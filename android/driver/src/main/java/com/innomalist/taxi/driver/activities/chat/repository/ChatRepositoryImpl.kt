package com.innomalist.taxi.driver.activities.chat.repository

import com.apollographql.apollo3.api.ApolloResponse
import com.innomalist.taxi.driver.ClientAPI
import com.minimal.taxi.driver.GetMessagesQuery
import com.minimal.taxi.driver.NewMessageReceivedSubscription
import com.minimal.taxi.driver.SendMessageMutation
import kotlinx.coroutines.flow.Flow
import javax.inject.Inject

class ChatRepositoryImpl @Inject() constructor(
    private val webService: ClientAPI
) : ChatRepository {
    override suspend fun getMessages(): ApolloResponse<GetMessagesQuery.Data> {
        return this.webService.getApolloClient().query(GetMessagesQuery()).execute()
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