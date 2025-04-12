package com.innomalist.taxi.rider.activities.main.repository

import com.apollographql.apollo3.api.ApolloResponse
import com.google.android.gms.maps.model.LatLng
import com.innomalist.taxi.rider.ClientAPI
import com.minimal.taxi.rider.*
import com.minimal.taxi.rider.type.CreateOrderInput
import com.minimal.taxi.rider.type.PointInput
import javax.inject.Inject

class MainActivityRepositoryImpl @Inject constructor(
    private val webService: ClientAPI
) : MainActivityRepository {
    override suspend fun getDriversInArea(location: LatLng): ApolloResponse<GetDriversLocationQuery.Data> {
        return this.webService.getApolloClient().query(GetDriversLocationQuery(PointInput(location.latitude, location.longitude))).execute()
    }

    override suspend fun getFare(points: List<LatLng>): ApolloResponse<CalculateFareMutation.Data> {
        return this.webService.getApolloClient().mutate(CalculateFareMutation(points.map { PointInput(it.latitude, it.longitude) })).execute()
    }

    override suspend fun requestService(
        serviceId: Int,
        points: List<LatLng>,
        intervalMinutes: Int,
        addresses: List<String>
    ): ApolloResponse<CreateOrderMutation.Data> {
        return this.webService.getApolloClient().mutate(CreateOrderMutation(CreateOrderInput(serviceId = serviceId, points = points.map { PointInput(it.latitude, it.longitude) }, intervalMinutes = intervalMinutes, addresses = addresses))).execute()
    }

    override suspend fun getAddresses(): ApolloResponse<GetAddressesQuery.Data> {
        return this.webService.getApolloClient().query(GetAddressesQuery()).execute()
    }

    override suspend fun getCurrentRequest(): ApolloResponse<GetCurrentOrderQuery.Data> {
        return this.webService.getApolloClient().query(GetCurrentOrderQuery()).execute()
    }
}