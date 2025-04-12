package com.innomalist.taxi.rider.activities.profile.repository

import com.apollographql.apollo3.api.ApolloResponse
import com.apollographql.apollo3.cache.normalized.FetchPolicy
import com.apollographql.apollo3.cache.normalized.fetchPolicy
import com.innomalist.taxi.rider.ClientAPI
import com.minimal.taxi.rider.GetRiderQuery
import com.minimal.taxi.rider.UpdateProfileMutation
import javax.inject.Inject

class ProfileRepositoryImpl @Inject() constructor(
    private val webservice: ClientAPI
) : ProfileRepository {
    override suspend fun getProfile(): ApolloResponse<GetRiderQuery.Data> {
        return this.webservice.getApolloClient().query(GetRiderQuery()).fetchPolicy(FetchPolicy.NetworkOnly).execute()
    }

    override suspend fun updateProfile(input: UpdateProfileMutation): ApolloResponse<UpdateProfileMutation.Data> {
        return this.webservice.getApolloClient().mutate(input).execute()
    }
}