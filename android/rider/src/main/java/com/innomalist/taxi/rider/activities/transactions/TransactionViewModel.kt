package com.innomalist.taxi.rider.activities.transactions

import android.util.Log
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.apollographql.apollo3.exception.ApolloException
import com.innomalist.taxi.common.ViewState
import com.innomalist.taxi.rider.activities.transactions.repository.TransactionsRepository
import com.minimal.taxi.rider.TransactionsQuery
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.launch
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
            val orders = response.dataOrThrow.riderTransacions.edges.map { it.node }
            _transactions.postValue(ViewState.Success(orders))
        } catch (e: ApolloException) {
            Log.e("ApolloException", "Failure", e)
            _transactions.postValue(ViewState.Error("ApolloException Occurred. Check Logs for details"))
        }
    }
}