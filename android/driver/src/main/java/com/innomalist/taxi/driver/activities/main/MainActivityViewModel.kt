package com.innomalist.taxi.driver.activities.main

import android.util.Log
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.apollographql.apollo3.api.ApolloResponse
import com.apollographql.apollo3.exception.ApolloException
import com.google.android.gms.maps.model.LatLng
import com.innomalist.taxi.common.ViewState
import com.innomalist.taxi.driver.activities.main.repository.MainActivityRepository
import com.minimal.taxi.driver.UpdateOrderStatusMutation
import com.minimal.taxi.driver.fragment.AvailableOrder
import com.minimal.taxi.driver.fragment.BasicProfile
import com.minimal.taxi.driver.fragment.CurrentOrder
import com.minimal.taxi.driver.type.DriverStatus
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.collect
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class MainActivityViewModel @Inject constructor(
    private val repository: MainActivityRepository
) : ViewModel() {
    private val _acceptOrderResult by lazy { MutableLiveData<ViewState<ApolloResponse<UpdateOrderStatusMutation.Data>>>() }
    val acceptOrderResult: LiveData<ViewState<ApolloResponse<UpdateOrderStatusMutation.Data>>>
        get() = _acceptOrderResult

    private val _currentOrder by lazy { MutableLiveData<ViewState<CurrentOrder?>>() }
    val currentOrder: LiveData<ViewState<CurrentOrder?>>
        get() = _currentOrder

    private val _availableOrders by lazy { MutableLiveData<ViewState<List<AvailableOrder>>>() }
    val availableOrders: LiveData<ViewState<List<AvailableOrder>>>
        get() = _availableOrders

    private val _profile by lazy { MutableLiveData<ViewState<BasicProfile>>() }
    val profile: LiveData<ViewState<BasicProfile>>
        get() = _profile

    private val _newRequestReceived by lazy { MutableLiveData<Int>() }
    val newRequestReceived: LiveData<Int>
        get() = _newRequestReceived

    fun updateDriverStatus(status: DriverStatus, fcmId: String, location: LatLng?) =
        viewModelScope.launch {
            if (status == DriverStatus.Offline && location == null) {
                throw Exception("Can't turn online without location being provided")
            }

            _profile.postValue(ViewState.Loading())
            try {
                val response = repository.updateDriverStatus(status, fcmId)
                val profile = response.data?.updateOneDriver?.basicProfile
                    ?: throw Exception("No Profile found")
                _profile.postValue(ViewState.Success(profile))
                if (profile.status == DriverStatus.Online) {
                    watchAvailableOrderUpdates()
                    refreshAvailableOrders()
                }
//                if (profile.status == DriverStatus.InService) {
//                    repository.observeOrderUpdated().collect {
//                        val order = it.data?.orderUpdated?.currentOrder ?: return@collect
//                        _currentOrder.postValue(ViewState.Success(order))
//                    }
//                }
            } catch (e: ApolloException) {
                Log.e("ApolloException", "Failure", e)
                _profile.postValue(ViewState.Error("ApolloException Occurred. Check Logs for details"))
            }
        }

    fun updateDriverLocation(location: LatLng) = viewModelScope.launch {
        val orders = repository.updateDriverLocation(location).data?.updateDriversLocationNew?.map { it.availableOrder } ?: listOf()
        _availableOrders.postValue(ViewState.Success(orders))
    }

    fun acceptOrder(orderId: Double) = viewModelScope.launch {
        _acceptOrderResult.postValue(ViewState.Loading())
        try {
            val response = repository.acceptOrder(orderId)
            _acceptOrderResult.postValue(ViewState.Success(response))
            _availableOrders.postValue(ViewState.Success(listOf()))
            _currentOrder.postValue(ViewState.Success(response.data!!.updateOneOrder.currentOrder))
        } catch (e: ApolloException) {
            Log.e("ApolloException", "Failure", e)
            _acceptOrderResult.postValue(ViewState.Error("ApolloException Occurred. Check Logs for details"))
        }
    }

    fun syncUserAndCurrentOrder() = viewModelScope.launch {
        _currentOrder.postValue(ViewState.Loading())
        try {
            val response = repository.me()
            val order =
                response.data?.driver?.basicProfile?.orders?.nodes?.firstOrNull()?.currentOrder
            _currentOrder.postValue(ViewState.Success(order))
            val driver = response.data?.driver?.basicProfile ?: throw ApolloException("Driver Not Found")
            _profile.postValue(ViewState.Success(driver))
            if(driver.status == DriverStatus.Online) {
                refreshAvailableOrders()
                watchAvailableOrderUpdates()
            }
        } catch (e: ApolloException) {
            Log.e("ApolloException", "Failure", e)
            _currentOrder.postValue(ViewState.Error("ApolloException Occurred. Check Logs for details"))
        }
    }

    private fun refreshAvailableOrders() = viewModelScope.launch {
        _availableOrders.postValue(ViewState.Loading())
        try {
            val response = repository.getAvailableOrder()
            _availableOrders.postValue(ViewState.Success(response.data?.availableOrders?.map { it.availableOrder }
                ?: listOf()))
        } catch (e: ApolloException) {
            Log.e("ApolloException", "Failure", e)
            _availableOrders.postValue(ViewState.Error("ApolloException Occurred. Check Logs for details"))
        }
    }

    private fun watchAvailableOrderUpdates() = viewModelScope.launch {
        repository.observeNewOrder().collect {
            val order = it.data?.orderCreated?.availableOrder ?: return@collect
            _newRequestReceived.postValue(0)
            _availableOrders.postValue(
                ViewState.Success(
                    _availableOrders.value?.value?.plus(
                        order
                    ) ?: listOf(order)
                )
            )
        }
        repository.observeRemoveOrder().collect {
            val orderId = it.data?.orderRemoved?.id ?: return@collect
            _availableOrders.postValue(ViewState.Success(_availableOrders.value?.value?.dropWhile { availableOrder -> availableOrder.id == orderId }
                ?: listOf()))
        }
    }

    fun deleteOrder(orderId: Double) = viewModelScope.launch {
        _availableOrders.value?.value?.dropWhile { it.id == orderId } ?: return@launch
        _availableOrders.postValue(ViewState.Success(_availableOrders.value!!.value!!))
    }

}