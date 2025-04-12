package com.innomalist.taxi.driver.activities.travel.repository

import com.apollographql.apollo3.api.ApolloResponse
import com.apollographql.apollo3.cache.normalized.FetchPolicy
import com.apollographql.apollo3.cache.normalized.fetchPolicy
import com.google.android.gms.maps.model.LatLng
import com.innomalist.taxi.driver.ClientAPI
import com.minimal.taxi.driver.MeQuery
import com.minimal.taxi.driver.OrderUpdatedSubscription
import com.minimal.taxi.driver.UpdateDriverLocationMutation
import com.minimal.taxi.driver.UpdateOrderStatusMutation
import com.minimal.taxi.driver.type.OrderStatus
import com.minimal.taxi.driver.type.PointInput
import kotlinx.coroutines.flow.Flow
import javax.inject.Inject

class TravelRepositoryImpl @Inject() constructor(
    private val webService: ClientAPI
) : TravelRepository {
    override suspend fun getCurrentOrder(): ApolloResponse<MeQuery.Data> {
        return this.webService.getApolloClient().query(MeQuery()).fetchPolicy(FetchPolicy.NetworkOnly).execute()
    }

    override suspend fun updateOrderStatus(
        orderId: String,
        status: OrderStatus,
        amountPaid: Double
    ): ApolloResponse<UpdateOrderStatusMutation.Data> {
        return this.webService.getApolloClient().mutate(UpdateOrderStatusMutation(orderId, status, amountPaid)).execute()
    }

    override suspend fun updateDriverLocation(location: LatLng): ApolloResponse<UpdateDriverLocationMutation.Data> {
        return this.webService.getApolloClient().mutate(UpdateDriverLocationMutation(PointInput(location.latitude, location.longitude))).execute()
    }

    override suspend fun watchOrderUpdate(): Flow<ApolloResponse<OrderUpdatedSubscription.Data>> {
        return this.webService.getApolloClient().subscribe(OrderUpdatedSubscription()).execute()
    }
}