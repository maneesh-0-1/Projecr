package com.innomalist.taxi.rider.activities.chat.repository

import com.apollographql.apollo3.api.ApolloResponse
import com.minimal.taxi.rider.GetMessagesQuery
import com.minimal.taxi.rider.NewMessageReceivedSubscription
import com.minimal.taxi.rider.SendMessageMutation
import kotlinx.coroutines.flow.Flow

interface ChatRepository {
    suspend fun getMessages(orderId: String): ApolloResponse<GetMessagesQuery.Data>
    suspend fun sendMessage(orderId: String, content: String): ApolloResponse<SendMessageMutation.Data>
    suspend fun observeMessages(): Flow<ApolloResponse<NewMessageReceivedSubscription.Data>>
}