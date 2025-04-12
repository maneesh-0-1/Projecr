package com.innomalist.taxi.driver.activities.chargeAccount

import android.util.Log
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.apollographql.apollo3.exception.ApolloException
import com.innomalist.taxi.common.ViewState
import com.innomalist.taxi.driver.activities.chargeAccount.repository.WalletRepository
import com.minimal.taxi.driver.TopUpWalletMutation
import com.minimal.taxi.driver.WalletQuery
import com.minimal.taxi.driver.fragment.HistoryOrderItem
import com.minimal.taxi.driver.type.TopUpWalletInput
import dagger.hilt.android.AndroidEntryPoint
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.launch
import java.lang.Exception
import javax.inject.Inject

@HiltViewModel
class WalletActivityViewModel @Inject() constructor(
    private val repository: WalletRepository
): ViewModel() {
    private val _wallet by lazy { MutableLiveData<ViewState<WalletQuery.Data>>() }
    val wallet: LiveData<ViewState<WalletQuery.Data>>
        get() = _wallet

    private val _topUpAccountResult by lazy { MutableLiveData<ViewState<TopUpWalletMutation.TopUpWallet>>() }
    val topUpAccountResult: LiveData<ViewState<TopUpWalletMutation.TopUpWallet>>
        get() = _topUpAccountResult

    fun syncWallet() = viewModelScope.launch {
        _wallet.postValue(ViewState.Loading())
        try {
            val response = repository.getWallet()
            val orders = response.data ?: throw Exception()
            _wallet.postValue(ViewState.Success(orders))
        } catch (e: ApolloException) {
            Log.e("ApolloException", "Failure", e)
            _wallet.postValue(ViewState.Error("ApolloException Occurred. Check Logs for details"))
        }
    }

    fun topUpWallet(input: TopUpWalletInput) = viewModelScope.launch {
        _topUpAccountResult.postValue(ViewState.Loading())
        try {
            val response = repository.topUpWallet(input)
            val id = response.data?.topUpWallet ?: throw Exception("Can't retrieve complaint Id")
            _topUpAccountResult.postValue(ViewState.Success(id))
        } catch (e: ApolloException) {
            Log.e("ApolloException", "Failure", e)
            _topUpAccountResult.postValue(ViewState.Error("ApolloException Occurred. Check Logs for details"))
        }
    }
}