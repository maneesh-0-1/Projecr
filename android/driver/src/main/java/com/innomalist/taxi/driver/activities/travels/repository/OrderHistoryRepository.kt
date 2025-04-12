package com.innomalist.taxi.driver.activities.travels.repository

import com.apollographql.apollo3.api.ApolloResponse
import com.minimal.taxi.driver.HistoryQuery
import com.minimal.taxi.driver.WriteComplaintMutation

interface OrderHistoryRepository {
    suspend fun getOrders(): ApolloResponse<HistoryQuery.Data>
    suspend fun writeComplaint(orderId: String, subject: String, content: String): ApolloResponse<WriteComplaintMutation.Data>
}