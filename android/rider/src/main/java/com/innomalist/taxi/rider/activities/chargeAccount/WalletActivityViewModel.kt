package com.innomalist.taxi.rider.activities.chargeAccount

import android.util.Log
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.apollographql.apollo3.exception.ApolloException
import com.innomalist.taxi.common.ViewState
import com.innomalist.taxi.rider.activities.chargeAccount.repository.WalletRepository
import com.minimal.taxi.rider.TopUpWalletMutation
import com.minimal.taxi.rider.WalletQuery
import com.minimal.taxi.rider.type.TopUpWalletInput
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.launch
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
            val orders = response.dataOrThrow
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
            val id = response.dataOrThrow.topUpWallet
            _topUpAccountResult.postValue(ViewState.Success(id))
        } catch (e: ApolloException) {
            Log.e("ApolloException", "Failure", e)
            _topUpAccountResult.postValue(ViewState.Error("ApolloException Occurred. Check Logs for details"))
        }
    }
}