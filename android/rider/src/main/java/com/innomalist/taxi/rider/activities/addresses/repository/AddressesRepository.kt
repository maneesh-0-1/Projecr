package com.innomalist.taxi.rider.activities.addresses.repository

import com.apollographql.apollo3.api.ApolloResponse
import com.google.android.gms.maps.model.LatLng
import com.minimal.taxi.rider.CreateAddressMutation
import com.minimal.taxi.rider.DeleteAddressMutation
import com.minimal.taxi.rider.GetAddressesQuery
import com.minimal.taxi.rider.UpdateAddressMutation

interface AddressesRepository {
    suspend fun getAddresses(): ApolloResponse<GetAddressesQuery.Data>
    suspend fun deleteAddress(id: String): ApolloResponse<DeleteAddressMutation.Data>
    suspend fun createAddress(title: String, details: String, location: LatLng): ApolloResponse<CreateAddressMutation.Data>
    suspend fun updateAddress(id: String, title: String, details: String, location: LatLng): ApolloResponse<UpdateAddressMutation.Data>
}