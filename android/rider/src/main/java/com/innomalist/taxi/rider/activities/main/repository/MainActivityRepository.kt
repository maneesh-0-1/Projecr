package com.innomalist.taxi.rider.activities.main.repository

import com.apollographql.apollo3.api.ApolloResponse
import com.google.android.gms.maps.model.LatLng
import com.minimal.taxi.rider.*

interface MainActivityRepository {
    suspend fun getDriversInArea(location: LatLng): ApolloResponse<GetDriversLocationQuery.Data>
    suspend fun getFare(points: List<LatLng>): ApolloResponse<CalculateFareMutation.Data>
    suspend fun requestService(serviceId: Int, points: List<LatLng>, intervalMinutes: Int, addresses: List<String>): ApolloResponse<CreateOrderMutation.Data>
    suspend fun getAddresses(): ApolloResponse<GetAddressesQuery.Data>
    suspend fun getCurrentRequest(): ApolloResponse<GetCurrentOrderQuery.Data>
}