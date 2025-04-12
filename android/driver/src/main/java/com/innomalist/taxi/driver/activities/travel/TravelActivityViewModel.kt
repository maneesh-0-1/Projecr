package com.innomalist.taxi.driver.activities.travel

import android.util.Log
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.apollographql.apollo3.api.ApolloResponse
import com.apollographql.apollo3.exception.ApolloException
import com.google.android.gms.maps.model.LatLng
import com.innomalist.taxi.common.ViewState
import com.innomalist.taxi.driver.activities.travel.repository.TravelRepository
import com.minimal.taxi.driver.UpdateOrderStatusMutation
import com.minimal.taxi.driver.fragment.CurrentOrder
import com.minimal.taxi.driver.type.OrderStatus
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.collect
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class TravelActivityViewModel @Inject() constructor(
    private val repository: TravelRepository
): ViewModel() {
    private val _currentOrder by lazy { MutableLiveData<ViewState<CurrentOrder?>>() }
    val currentOrder: LiveData<ViewState<CurrentOrder?>>
        get() = _currentOrder

    fun syncCurrentOrder() = viewModelScope.launch {
        _currentOrder.postValue(ViewState.Loading())
        try {
            val response = repository.getCurrentOrder()
            val order =
                response.data?.driver?.basicProfile?.orders?.nodes?.firstOrNull()?.currentOrder
            _currentOrder.postValue(ViewState.Success(order))
            observeOrderUpdates()
        } catch (e: ApolloException) {
            Log.e("ApolloException", "Failure", e)
            _currentOrder.postValue(ViewState.Error("ApolloException Occurred. Check Logs for details"))
        }
    }

    fun updateOrderStatus(status: OrderStatus, paidAmount: Double = 0.0) = viewModelScope.launch {
        _currentOrder.postValue(ViewState.Loading())
        try {
            val orderId = _currentOrder.value?.value?.id ?: return@launch
            val response = repository.updateOrderStatus(orderId, status, paidAmount)
            val order =
                response.data?.updateOneOrder?.currentOrder
            _currentOrder.postValue(ViewState.Success(order))
        } catch (e: ApolloException) {
            Log.e("ApolloException", "Failure", e)
            _currentOrder.postValue(ViewState.Error("ApolloException Occurred. Check Logs for details"))
        }
    }

    fun updateDriverLocation(location: LatLng) = viewModelScope.launch {
        repository.updateDriverLocation(location)
        _currentOrder.postValue(_currentOrder.value)
    }

    private fun observeOrderUpdates() = viewModelScope.launch {
        repository.watchOrderUpdate().collect {
            val _order = it.data?.orderUpdated?.currentOrder ?: return@collect
            _currentOrder.postValue(ViewState.Success(_order))
        }
    }
}