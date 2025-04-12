package com.innomalist.taxi.driver.activities.waitingForPayment.repository

import com.apollographql.apollo3.api.ApolloResponse
import com.innomalist.taxi.driver.ClientAPI
import com.minimal.taxi.driver.MeQuery
import com.minimal.taxi.driver.UpdateOrderStatusMutation
import com.minimal.taxi.driver.type.OrderStatus
import javax.inject.Inject

class WaitingForPaymentRepositoryImpl @Inject() constructor(
    private val webService: ClientAPI
): WaitingForPaymentRepository {
    override suspend fun paidInCash(orderId: String, amountPaid: Double): ApolloResponse<UpdateOrderStatusMutation.Data> {
        return this.webService.getApolloClient().mutate(UpdateOrderStatusMutation(orderId ,OrderStatus.Finished, amountPaid)).execute()
    }

    override suspend fun me(): ApolloResponse<MeQuery.Data> {
        return this.webService.getApolloClient().query(MeQuery()).execute()
    }
}