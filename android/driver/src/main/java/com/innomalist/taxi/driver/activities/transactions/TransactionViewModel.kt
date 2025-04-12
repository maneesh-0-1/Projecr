package com.innomalist.taxi.driver.activities.transactions

import android.util.Log
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.apollographql.apollo3.exception.ApolloException
import com.innomalist.taxi.common.ViewState
import com.innomalist.taxi.driver.activities.transactions.repository.TransactionsRepository
import com.minimal.taxi.driver.TransactionsQuery
import com.minimal.taxi.driver.fragment.HistoryOrderItem
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.launch
import java.lang.Exception
import javax.inject.Inject

@HiltViewModel
class TransactionViewModel @Inject() constructor(
    private val repository: TransactionsRepository
): ViewModel() {
    private val _transactions by lazy { MutableLiveData<ViewState<List<TransactionsQuery.Node>>>() }
    val transactions: LiveData<ViewState<List<TransactionsQuery.Node>>>
        get() = _transactions

    fun syncTransactions() = viewModelScope.launch {
        _transactions.postValue(ViewState.Loading())
        try {
            val response = repository.getTransactions()
            val orders = response.data?.driverTransacions?.edges?.map { it.node } ?: throw Exception()
            _transactions.postValue(ViewState.Success(orders))
        } catch (e: ApolloException) {
            Log.e("ApolloException", "Failure", e)
            _transactions.postValue(ViewState.Error("ApolloException Occurred. Check Logs for details"))
        }
    }
}