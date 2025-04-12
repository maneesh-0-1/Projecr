package com.innomalist.taxi.rider.activities.travels.repository

import com.apollographql.apollo3.api.ApolloResponse
import com.minimal.taxi.rider.HistoryQuery
import com.minimal.taxi.rider.WriteComplaintMutation

interface OrderHistoryRepository {
    suspend fun getOrders(): ApolloResponse<HistoryQuery.Data>
    suspend fun writeComplaint(orderId: String, subject: String, content: String): ApolloResponse<WriteComplaintMutation.Data>
}