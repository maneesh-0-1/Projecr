package com.innomalist.taxi.driver.activities.profile.repository

import com.apollographql.apollo3.api.ApolloResponse
import com.innomalist.taxi.driver.ClientAPI
import com.minimal.taxi.driver.GetDriverQuery
import com.minimal.taxi.driver.UpdateDriverProfileMutation
import com.minimal.taxi.driver.type.UpdateDriverInput
import javax.inject.Inject

class ProfileRepositoryImpl @Inject() constructor(
    private val webService: ClientAPI
) : ProfileRepository {
    override suspend fun getProfile(): ApolloResponse<GetDriverQuery.Data> {
        return this.webService.getApolloClient().query(GetDriverQuery()).execute()
    }

    override suspend fun updateProfile(input: UpdateDriverProfileMutation): ApolloResponse<UpdateDriverProfileMutation.Data> {
        return this.webService.getApolloClient().mutate(input).execute()
    }
}