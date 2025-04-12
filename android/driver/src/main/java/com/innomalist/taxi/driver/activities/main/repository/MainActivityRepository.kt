package com.innomalist.taxi.driver.activities.main.repository

import com.apollographql.apollo3.api.ApolloResponse
import com.google.android.gms.maps.model.LatLng
import com.minimal.taxi.driver.*
import com.minimal.taxi.driver.type.DriverStatus
import kotlinx.coroutines.flow.Flow

interface MainActivityRepository {
    suspend fun updateDriverStatus(status: DriverStatus, fcmId: String): ApolloResponse<UpdateDriverStatusMutation.Data>
    suspend fun updateDriverLocation(location: LatLng): ApolloResponse<UpdateDriverLocationMutation.Data>
    suspend fun me(): ApolloResponse<MeQuery.Data>
    suspend fun acceptOrder(id: Double): ApolloResponse<UpdateOrderStatusMutation.Data>
    suspend fun getAvailableOrder(): ApolloResponse<AvailableOrdersQuery.Data>
    suspend fun observeNewOrder(): Flow<ApolloResponse<OrderCreatedSubscription.Data>>
    suspend fun observeRemoveOrder(): Flow<ApolloResponse<OrderRemovedSubscription.Data>>
    suspend fun observeOrderUpdated(): Flow<ApolloResponse<OrderUpdatedSubscription.Data>>
}