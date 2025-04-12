package com.innomalist.taxi.driver.activities.travels

import android.util.Log
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.apollographql.apollo3.api.ApolloResponse
import com.apollographql.apollo3.exception.ApolloException
import com.innomalist.taxi.common.ViewState
import com.innomalist.taxi.driver.activities.travels.repository.OrderHistoryRepository
import com.minimal.taxi.driver.fragment.HistoryOrderItem
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.launch
import java.lang.Exception
import java.text.SimpleDateFormat
import java.util.*
import javax.inject.Inject

@HiltViewModel
class OrderHistoryViewModel @Inject() constructor(
    private val repository: OrderHistoryRepository
) : ViewModel() {
    private val _orders by lazy { MutableLiveData<ViewState<HistoryOrderItem>>() }
    val orders: LiveData<ViewState<HistoryOrderItem>>
        get() = _orders

    private val _complaintSubmissionResult by lazy { MutableLiveData<ViewState<String>>() }
    val complaintSubmissionResult: LiveData<ViewState<String>>
        get() = _complaintSubmissionResult

    fun syncOrders() = viewModelScope.launch {
        _orders.postValue(ViewState.Loading())
        try {
            val response = repository.getOrders()
            val orders = response.data?.completed?.historyOrderItem ?: throw Exception()
            _orders.postValue(ViewState.Success(orders))
        } catch (e: ApolloException) {
            Log.e("ApolloException", "Failure", e)
            _orders.postValue(ViewState.Error("ApolloException Occurred. Check Logs for details"))
        }
    }

    fun writeComplaint(orderId: String, subject: String, content: String) = viewModelScope.launch {
        _complaintSubmissionResult.postValue(ViewState.Loading())
        try {
            val response = repository.writeComplaint(orderId, subject, content)
            val id = response.data?.createOneComplaint?.id ?: throw Exception("Can't retrieve complaint Id")
            _complaintSubmissionResult.postValue(ViewState.Success(id))
        } catch (e: ApolloException) {
            Log.e("ApolloException", "Failure", e)
            _complaintSubmissionResult.postValue(ViewState.Error("ApolloException Occurred. Check Logs for details"))
        }
    }
}

