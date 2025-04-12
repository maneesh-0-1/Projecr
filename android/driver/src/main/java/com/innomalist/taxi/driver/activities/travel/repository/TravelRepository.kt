package com.innomalist.taxi.driver.activities.travel.repository

import com.apollographql.apollo3.api.ApolloResponse
import com.google.android.gms.maps.model.LatLng
import com.minimal.taxi.driver.MeQuery
import com.minimal.taxi.driver.OrderUpdatedSubscription
import com.minimal.taxi.driver.UpdateDriverLocationMutation
import com.minimal.taxi.driver.UpdateOrderStatusMutation
import com.minimal.taxi.driver.type.OrderStatus
import kotlinx.coroutines.flow.Flow

interface TravelRepository {
    suspend fun getCurrentOrder(): ApolloResponse<MeQuery.Data>
    suspend fun updateOrderStatus(orderId: String, status: OrderStatus, amountPaid: Double = 0.0): ApolloResponse<UpdateOrderStatusMutation.Data>
    suspend fun updateDriverLocation(location: LatLng): ApolloResponse<UpdateDriverLocationMutation.Data>
    suspend fun watchOrderUpdate(): Flow<ApolloResponse<OrderUpdatedSubscription.Data>>
}