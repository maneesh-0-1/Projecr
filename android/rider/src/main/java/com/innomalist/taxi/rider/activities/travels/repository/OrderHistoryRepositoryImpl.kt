package com.innomalist.taxi.rider.activities.travels.repository

import com.apollographql.apollo3.api.ApolloResponse
import com.innomalist.taxi.rider.ClientAPI
import com.minimal.taxi.rider.HistoryQuery
import com.minimal.taxi.rider.WriteComplaintMutation
import javax.inject.Inject

class OrderHistoryRepositoryImpl @Inject() constructor(
    private val webService: ClientAPI
) : OrderHistoryRepository {
    override suspend fun getOrders(): ApolloResponse<HistoryQuery.Data> {
        return this.webService.getApolloClient().query(HistoryQuery()).execute()
    }

    override suspend fun writeComplaint(
        orderId: String,
        subject: String,
        content: String
    ): ApolloResponse<WriteComplaintMutation.Data> {
        return this.webService.getApolloClient().mutate(WriteComplaintMutation(orderId, subject, content)).execute()
    }
}