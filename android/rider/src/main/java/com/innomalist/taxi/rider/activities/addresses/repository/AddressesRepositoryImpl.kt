package com.innomalist.taxi.rider.activities.addresses.repository

import com.apollographql.apollo3.api.ApolloResponse
import com.google.android.gms.maps.model.LatLng
import com.innomalist.taxi.rider.ClientAPI
import com.minimal.taxi.rider.CreateAddressMutation
import com.minimal.taxi.rider.DeleteAddressMutation
import com.minimal.taxi.rider.GetAddressesQuery
import com.minimal.taxi.rider.UpdateAddressMutation
import javax.inject.Inject

class AddressesRepositoryImpl @Inject constructor(
    private val webService: ClientAPI
) : AddressesRepository {
    override suspend fun getAddresses(): ApolloResponse<GetAddressesQuery.Data> {
        return this.webService.getApolloClient().query(GetAddressesQuery()).execute()
    }

    override suspend fun deleteAddress(id: String): ApolloResponse<DeleteAddressMutation.Data> {
        return this.webService.getApolloClient().mutate(DeleteAddressMutation(id)).execute()
    }

    override suspend fun createAddress(
        title: String,
        details: String,
        location: LatLng
    ): ApolloResponse<CreateAddressMutation.Data> {
        return this.webService.getApolloClient().mutate(CreateAddressMutation(title, details, lat = location.latitude, lng = location.longitude)).execute()
    }

    override suspend fun updateAddress(
        id: String,
        title: String,
        details: String,
        location: LatLng
    ): ApolloResponse<UpdateAddressMutation.Data> {
        return this.webService.getApolloClient().mutate(UpdateAddressMutation(
            id,
            title,
            details,
            lat = location.latitude,
            lng = location.longitude,
        )).execute()
    }
}