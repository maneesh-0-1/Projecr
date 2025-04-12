package com.innomalist.taxi.driver.activities.waitingForPayment.repository

import com.apollographql.apollo3.api.ApolloResponse
import com.minimal.taxi.driver.MeQuery
import com.minimal.taxi.driver.UpdateOrderStatusMutation

interface WaitingForPaymentRepository {
    suspend fun paidInCash(orderId: String, amountPaid: Double): ApolloResponse<UpdateOrderStatusMutation.Data>
    suspend fun me(): ApolloResponse<MeQuery.Data>
}