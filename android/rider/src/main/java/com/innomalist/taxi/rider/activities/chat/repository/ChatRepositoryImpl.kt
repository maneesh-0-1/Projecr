package com.innomalist.taxi.rider.activities.chat.repository

import com.apollographql.apollo3.api.ApolloResponse
import com.innomalist.taxi.rider.ClientAPI
import com.minimal.taxi.rider.GetMessagesQuery
import com.minimal.taxi.rider.NewMessageReceivedSubscription
import com.minimal.taxi.rider.SendMessageMutation
import kotlinx.coroutines.flow.Flow
import javax.inject.Inject

class ChatRepositoryImpl @Inject() constructor(
    private val webService: ClientAPI
) : ChatRepository {
    override suspend fun getMessages(orderId: String): ApolloResponse<GetMessagesQuery.Data> {
        return this.webService.getApolloClient().query(GetMessagesQuery(orderId)).execute()
    }

    override suspend fun sendMessage(
        orderId: String,
        content: String
    ): ApolloResponse<SendMessageMutation.Data> {
        return this.webService.getApolloClient().mutate(SendMessageMutation(orderId, content)).execute()
    }

    override suspend fun observeMessages(): Flow<ApolloResponse<NewMessageReceivedSubscription.Data>> {
        return this.webService.getApolloClient().subscribe(NewMessageReceivedSubscription()).execute()
    }
}