package com.innomalist.taxi.driver.activities.main.repository

import com.apollographql.apollo3.api.ApolloResponse
import com.google.android.gms.maps.model.LatLng
import com.innomalist.taxi.driver.ClientAPI
import com.minimal.taxi.driver.*
import com.minimal.taxi.driver.type.DriverStatus
import com.minimal.taxi.driver.type.OrderStatus
import com.minimal.taxi.driver.type.PointInput
import kotlinx.coroutines.flow.Flow
import javax.inject.Inject

class MainActivityRepositoryImpl @Inject() constructor(
    private val webService: ClientAPI
) : MainActivityRepository {
    override suspend fun updateDriverStatus(status: DriverStatus, fcmId: String): ApolloResponse<UpdateDriverStatusMutation.Data> {
        return this.webService.getApolloClient().mutate(UpdateDriverStatusMutation(status, fcmId)).execute()
    }

    override suspend fun updateDriverLocation(location: LatLng): ApolloResponse<UpdateDriverLocationMutation.Data> {
        return this.webService.getApolloClient().mutate(UpdateDriverLocationMutation(PointInput(location.latitude, location.longitude))).execute()
    }

    override suspend fun me(): ApolloResponse<MeQuery.Data> {
        return this.webService.getApolloClient().query(MeQuery()).execute()
    }

    override suspend fun acceptOrder(id: Double): ApolloResponse<UpdateOrderStatusMutation.Data> {
        return this.webService.getApolloClient().mutate(UpdateOrderStatusMutation(id.toInt().toString(), OrderStatus.DriverAccepted, null)).execute()
    }

    override suspend fun getAvailableOrder(): ApolloResponse<AvailableOrdersQuery.Data> {
        return this.webService.getApolloClient().query(AvailableOrdersQuery()).execute()
    }

    override suspend fun observeNewOrder(): Flow<ApolloResponse<OrderCreatedSubscription.Data>> {
        return this.webService.getApolloClient().subscribe(OrderCreatedSubscription()).execute()
    }

    override suspend fun observeRemoveOrder(): Flow<ApolloResponse<OrderRemovedSubscription.Data>> {
        return this.webService.getApolloClient().subscribe(OrderRemovedSubscription()).execute()
    }

    override suspend fun observeOrderUpdated(): Flow<ApolloResponse<OrderUpdatedSubscription.Data>> {
        return this.webService.getApolloClient().subscribe(OrderUpdatedSubscription()).execute()
    }
}