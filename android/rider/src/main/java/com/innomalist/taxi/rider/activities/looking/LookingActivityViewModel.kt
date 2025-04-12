package com.innomalist.taxi.rider.activities.looking

import android.util.Log
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.apollographql.apollo3.api.ApolloResponse
import com.apollographql.apollo3.exception.ApolloException
import com.innomalist.taxi.common.ViewState
import com.innomalist.taxi.rider.activities.travel.repository.TravelRepository
import com.minimal.taxi.rider.CancelOrderMutation
import com.minimal.taxi.rider.GetCurrentOrderQuery
import com.minimal.taxi.rider.fragment.CurrentOrder
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.collect
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class LookingActivityViewModel @Inject() constructor(
    private val repository: TravelRepository): ViewModel() {
    private val _currentOrder by lazy { MutableLiveData<ViewState<CurrentOrder?>>() }
    val currentOrder: LiveData<ViewState<CurrentOrder?>>
        get() = _currentOrder

    private val _updateResult by lazy { MutableLiveData<ViewState<ApolloResponse<CancelOrderMutation.Data>>>() }
    val updateResult: LiveData<ViewState<ApolloResponse<CancelOrderMutation.Data>>>
        get() = _updateResult

    fun getCurrentOrder() = viewModelScope.launch {
        _currentOrder.postValue(ViewState.Loading())
        try {
            val response = repository.getCurrentOrder().dataOrThrow.currentOrderWithLocation.order.currentOrder
            _currentOrder.postValue(ViewState.Success(response))
            observeOrderUpdates()
        } catch(e: ApolloException) {
            Log.e("ApolloException", "Failure", e)
            _currentOrder.postValue(ViewState.Error("ApolloException Occurred. Check Logs for details"))
        }
    }

    fun cancelOrder() = viewModelScope.launch {
        _updateResult.postValue(ViewState.Loading())
        try {
            val response = repository.cancelOrder()
            _updateResult.postValue(ViewState.Success(response))
        } catch (e: ApolloException) {
            Log.e("ApolloException", "Failure", e)
            _updateResult.postValue(ViewState.Error("ApolloException Occurred. Check Logs for details"))
        }
    }

    private fun observeOrderUpdates() = viewModelScope.launch {
        repository.watchOrderUpdate().collect {
            val order = it.data?.orderUpdated?.currentOrder ?: return@collect
            _currentOrder.postValue(ViewState.Success(order))
        }
    }
}