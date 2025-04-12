package com.innomalist.taxi.driver.activities.chat

import android.util.Log
import android.view.View
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.apollographql.apollo3.exception.ApolloException
import com.innomalist.taxi.common.ViewState
import com.innomalist.taxi.driver.activities.chat.repository.ChatRepository
import com.innomalist.taxi.driver.activities.travel.repository.TravelRepository
import com.minimal.taxi.driver.fragment.*
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.collect
import kotlinx.coroutines.launch
import java.lang.Exception
import javax.inject.Inject

@HiltViewModel
class ChatActivityViewModel @Inject() constructor(
    private val repository: ChatRepository,
    private val orderRepository: TravelRepository
): ViewModel() {
    private val _messages by lazy { MutableLiveData<ViewState<List<Message>>>() }
    val messages: LiveData<ViewState<List<Message>>>
        get() = _messages

    private val _profile by lazy { MutableLiveData<OrderForChat>() }
    val profile: LiveData<OrderForChat>
        get() = _profile


    fun syncMessages() = viewModelScope.launch {
//        val profile = orderRepository.getCurrentOrder().data?.driver?.basicProfile ?: throw Exception("No Order Found")
//        val orderId = profile.orders.nodes.firstOrNull()?.currentOrder?.id ?: throw Exception("No Order Found")
//        _profile.postValue(profile)
//        _messages.postValue(ViewState.Loading())
//        try {
//            val response = repository.getMessages(orderId)
//            _messages.postValue(ViewState.Success(response.data?.orderMessages?.map { it.message } ?: listOf()))
//        } catch (e: ApolloException) {
//            Log.e("ApolloException", "Failure", e)
//            _messages.postValue(ViewState.Error("ApolloException Occurred. Check Logs for details"))
//        }
        _messages.postValue(ViewState.Loading())
        try {
            val response = repository.getMessages()
            val driver = response.data?.driver ?: throw Exception("Driver not found")
            val order = driver.orders.nodes.firstOrNull()?.orderForChat ?: throw Exception("Order not found")
            val messages = order.conversations ?: throw Exception("Messages found")
            _profile.postValue(order)
            _messages.postValue(ViewState.Success(messages.map { it.message }))
        } catch (e: ApolloException) {
            Log.e("ApolloException", "Failure", e)
            _messages.postValue(ViewState.Error("ApolloException Occurred. Check Logs for details"))
        }
    }

    fun sendMessage(content: String) = viewModelScope.launch {
        _profile.value?.let {
            val message = repository.sendMessage(it.id, content).data?.createOneOrderMessage?.message ?: return@launch
            val messages: List<Message> = _messages.value?.value?.plus(message) ?: listOf(message)
            _messages.postValue(ViewState.Success(messages))
        }
    }

    fun watchForMessages() = viewModelScope.launch {
        repository.observeMessages().collect {
            val message = it.data?.newMessageReceived?.message ?: return@collect
            val messages: List<Message> = _messages.value?.value?.plus(message) ?: listOf(message)
            _messages.postValue(ViewState.Success(messages))
        }
    }
}