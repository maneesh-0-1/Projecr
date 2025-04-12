package com.innomalist.taxi.driver.activities.chat.repository

import com.apollographql.apollo3.api.ApolloResponse
import com.minimal.taxi.driver.GetMessagesQuery
import com.minimal.taxi.driver.NewMessageReceivedSubscription
import com.minimal.taxi.driver.SendMessageMutation
import com.minimal.taxi.driver.type.OrderMessage
import kotlinx.coroutines.flow.Flow

interface ChatRepository {
    suspend fun getMessages(): ApolloResponse<GetMessagesQuery.Data>
    suspend fun sendMessage(orderId: String, content: String): ApolloResponse<SendMessageMutation.Data>
    suspend fun observeMessages(): Flow<ApolloResponse<NewMessageReceivedSubscription.Data>>
}