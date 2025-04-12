package com.innomalist.taxi.driver.activities.waitingForPayment

import android.util.Log
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.apollographql.apollo3.api.ApolloResponse
import com.apollographql.apollo3.exception.ApolloException
import com.innomalist.taxi.common.ViewState
import com.innomalist.taxi.driver.activities.waitingForPayment.repository.WaitingForPaymentRepository
import com.minimal.taxi.driver.MeQuery
import com.minimal.taxi.driver.UpdateOrderStatusMutation
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class WaitingForPaymentActivityViewModel @Inject() constructor(
    private val repository: WaitingForPaymentRepository
): ViewModel() {
    private val _updateResult by lazy { MutableLiveData<ViewState<ApolloResponse<UpdateOrderStatusMutation.Data>>>() }
    val updateResult: LiveData<ViewState<ApolloResponse<UpdateOrderStatusMutation.Data>>>
        get() = _updateResult

    private val _currentOrder by lazy { MutableLiveData<ViewState<ApolloResponse<MeQuery.Data>>>() }
    val currentOrder: LiveData<ViewState<ApolloResponse<MeQuery.Data>>>
        get() = _currentOrder

    fun paidInCash(orderId: String, amountPaid: Double) = viewModelScope.launch {
        _updateResult.postValue(ViewState.Loading())
        try {
            val response = repository.paidInCash(orderId, amountPaid)
            _updateResult.postValue(ViewState.Success(response))
        } catch(e: ApolloException) {
            Log.e("ApolloException", "Failure", e)
            _updateResult.postValue(ViewState.Error("ApolloException Occurred. Check Logs for details"))
        }
    }

    fun getCurrentOrder() = viewModelScope.launch {
        _currentOrder.postValue(ViewState.Loading())
        try {
            val response = repository.me()
            _currentOrder.postValue(ViewState.Success(response))
        } catch(e: ApolloException) {
            Log.e("ApolloException", "Failure", e)
            _currentOrder.postValue(ViewState.Error("ApolloException Occurred. Check Logs for details"))
        }
    }
}