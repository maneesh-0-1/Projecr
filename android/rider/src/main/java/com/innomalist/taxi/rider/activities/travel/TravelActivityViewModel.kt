package com.innomalist.taxi.rider.activities.travel

import android.util.Log
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.apollographql.apollo3.api.ApolloResponse
import com.apollographql.apollo3.exception.ApolloException
import com.google.android.gms.maps.model.LatLng
import com.innomalist.taxi.common.ViewState
import com.innomalist.taxi.rider.activities.chat.repository.ChatRepository
import com.innomalist.taxi.rider.activities.travel.repository.TravelRepository
import com.innomalist.taxi.rider.toLatLng
import com.minimal.taxi.rider.CancelOrderMutation
import com.minimal.taxi.rider.GetCurrentOrderQuery
import com.minimal.taxi.rider.SubmitFeedbackMutation
import com.minimal.taxi.rider.fragment.CurrentOrder
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.collect
import kotlinx.coroutines.launch
import java.lang.Exception
import javax.inject.Inject

@HiltViewModel
class TravelActivityViewModel @Inject() constructor(
    private val repository: TravelRepository,
    private val chatRepository: ChatRepository
): ViewModel() {
    private val _currentOrder by lazy { MutableLiveData<ViewState<CurrentOrder?>>() }
    val currentOrder: LiveData<ViewState<CurrentOrder?>>
        get() = _currentOrder

    private val _driverLocation by lazy { MutableLiveData<LatLng>() }
    val driverLocation: LiveData<LatLng>
        get() = _driverLocation

    private val _unreadMessages by lazy { MutableLiveData<Int>() }
    val unreadMessages: LiveData<Int>
        get() = _unreadMessages

    private val _updateResult by lazy { MutableLiveData<ViewState<ApolloResponse<CancelOrderMutation.Data>>>() }
    val updateResult: LiveData<ViewState<ApolloResponse<CancelOrderMutation.Data>>>
        get() = _updateResult

    private val _applyCouponResult by lazy { MutableLiveData<ViewState<Int>>() }
    val applyCouponResult: LiveData<ViewState<Int>>
        get() = _applyCouponResult

    private val _submitReviewResult by lazy { MutableLiveData<ViewState<ApolloResponse<SubmitFeedbackMutation.Data>>>() }
    val submitReviewResult: LiveData<ViewState<ApolloResponse<SubmitFeedbackMutation.Data>>>
        get() = _submitReviewResult

    fun getCurrentOrder() = viewModelScope.launch {
        _currentOrder.postValue(ViewState.Loading())
        try {
            val response = repository.getCurrentOrder().dataOrThrow.currentOrderWithLocation
            _currentOrder.postValue(ViewState.Success(response.order.currentOrder))
            observeOrderUpdates()
            val location = response.driverLocation?.point?.toLatLng() ?: return@launch
            _driverLocation.postValue(location)
        } catch(e: ApolloException) {
            Log.e("ApolloException", "Failure", e)
            _currentOrder.postValue(ViewState.Error("ApolloException Occurred. Check Logs for details"))
        }
    }

    fun applyCoupon(code: String) = viewModelScope.launch {
        _applyCouponResult.postValue(ViewState.Loading())
        try {
            val response = repository.applyCoupon(code)
            _applyCouponResult.postValue(ViewState.Success(1))
            _currentOrder.postValue(ViewState.Success(response.dataOrThrow.applyCoupon.currentOrder))
        } catch (e: ApolloException) {
            Log.e("ApolloException", "Failure", e)
            _applyCouponResult.postValue(ViewState.Error("ApolloException Occurred. Check Logs for details"))
        }
    }

    fun cancelOrder() = viewModelScope.launch {
        _updateResult.postValue(ViewState.Loading())
        try {
            val response = repository.cancelOrder()
            _updateResult.postValue(ViewState.Success(response))
            _currentOrder.postValue(ViewState.Success(response.dataOrThrow.cancelOrder.currentOrder))
        } catch (e: ApolloException) {
            Log.e("ApolloException", "Failure", e)
            _updateResult.postValue(ViewState.Error("ApolloException Occurred. Check Logs for details"))
        }
    }

    fun submitFeedback(input: SubmitFeedbackMutation) = viewModelScope.launch {
        _submitReviewResult.postValue(ViewState.Loading())
        try {
            val response = repository.submitReview(input)
            _submitReviewResult.postValue(ViewState.Success(response))
            val order = response.data?.submitReview?.currentOrder
            //_currentOrder.postValue(ViewState.Success(order))
        } catch (e: ApolloException) {
            Log.e("ApolloException", "Failure", e)
            _submitReviewResult.postValue(ViewState.Error("ApolloException Occurred. Check Logs for details"))
        }
    }

    private fun observeOrderUpdates() = viewModelScope.launch {
        repository.watchOrderUpdate().collect {
            val _order = it.data?.orderUpdated?.currentOrder ?: return@collect
            _currentOrder.postValue(ViewState.Success(_order))
        }
        val driverId = _currentOrder.value?.value?.driver?.id ?: throw Exception("No Driver found.")
        repository.watchDriverLocationUpdate(driverId = driverId).collect {
            val location = it.data?.driverLocationUpdated?.point?.toLatLng() ?: return@collect
            _driverLocation.postValue(location)
        }
        chatRepository.observeMessages().collect {
            if(it.data?.newMessageReceived != null) {
                _unreadMessages.postValue(_unreadMessages.value?.plus(1) ?: 1)

            }
        }
    }

}