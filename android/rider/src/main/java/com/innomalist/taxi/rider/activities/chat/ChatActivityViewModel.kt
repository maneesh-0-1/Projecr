package com.innomalist.taxi.rider.activities.chat

import android.util.Log
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.apollographql.apollo3.exception.ApolloException
import com.innomalist.taxi.common.ViewState
import com.innomalist.taxi.rider.activities.chat.repository.ChatRepository
import com.innomalist.taxi.rider.activities.profile.repository.ProfileRepository
import com.innomalist.taxi.rider.activities.travel.repository.TravelRepository
import com.minimal.taxi.rider.fragment.BasicProfile
import com.minimal.taxi.rider.fragment.Message
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.collect
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class ChatActivityViewModel @Inject() constructor(
    private val repository: ChatRepository,
    private val orderRepository: TravelRepository,
    private val profileRepository: ProfileRepository
): ViewModel() {
    private val _messages by lazy { MutableLiveData<ViewState<List<Message>>>() }
    val messages: LiveData<ViewState<List<Message>>>
        get() = _messages

    private val _profile by lazy { MutableLiveData<BasicProfile?>() }
    val profile: LiveData<BasicProfile?>
        get() = _profile

    fun syncMessages() = viewModelScope.launch {
        val profile = profileRepository.getProfile().dataOrThrow.rider?.basicProfile ?: throw Exception("Rider Not Found")
        val orderId = orderRepository.getCurrentOrder().dataOrThrow.currentOrderWithLocation.order.currentOrder.id
        _profile.postValue(profile)
        _messages.postValue(ViewState.Loading())
        try {
            val response = repository.getMessages(orderId)
            _messages.postValue(ViewState.Success(response.data?.orderMessages?.map { it.message } ?: listOf()))
        } catch (e: ApolloException) {
            Log.e("ApolloException", "Failure", e)
            _messages.postValue(ViewState.Error("ApolloException Occurred. Check Logs for details"))
        }
//        _messages.postValue(ViewState.Loading())
//        try {
//            val response = repository.getMessages("1")
//            _messages.postValue(ViewState.Success(response.data?.orderMessages?.map { it.message } ?: listOf()))
//        } catch (e: ApolloException) {
//            Log.e("ApolloException", "Failure", e)
//            _messages.postValue(ViewState.Error("ApolloException Occurred. Check Logs for details"))
//        }
    }

    fun sendMessage(content: String) = viewModelScope.launch {
        val orderId = orderRepository.getCurrentOrder().dataOrThrow.currentOrderWithLocation.order.currentOrder.id
        val message = repository.sendMessage(orderId, content).data?.createOneOrderMessage?.message ?: return@launch
        val messages: List<Message> = _messages.value?.value?.plus(message) ?: listOf(message)
        _messages.postValue(ViewState.Success(messages))
    }

    fun watchForMessages() = viewModelScope.launch {
        repository.observeMessages().collect {
            val message = it.data?.newMessageReceived?.message ?: return@collect
            val messages: List<Message> = _messages.value?.value?.plus(message) ?: listOf(message)
            _messages.postValue(ViewState.Success(messages))
        }
    }
}