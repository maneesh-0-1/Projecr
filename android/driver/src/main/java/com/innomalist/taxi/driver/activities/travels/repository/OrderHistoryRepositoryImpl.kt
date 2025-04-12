package com.innomalist.taxi.driver.activities.travels.repository

import com.apollographql.apollo3.api.ApolloResponse
import com.apollographql.apollo3.cache.normalized.FetchPolicy
import com.apollographql.apollo3.cache.normalized.fetchPolicy
import com.innomalist.taxi.driver.ClientAPI
import com.minimal.taxi.driver.HistoryQuery
import com.minimal.taxi.driver.WriteComplaintMutation
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
        return this.webService.getApolloClient().mutate(WriteComplaintMutation(orderId, subject, content)).fetchPolicy(FetchPolicy.NetworkOnly).execute()
    }
}