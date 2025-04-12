package com.innomalist.taxi.rider.activities.profile.repository

import com.apollographql.apollo3.api.ApolloResponse
import com.minimal.taxi.rider.GetRiderQuery
import com.minimal.taxi.rider.UpdateProfileMutation

interface ProfileRepository {
    suspend fun getProfile(): ApolloResponse<GetRiderQuery.Data>
    suspend fun updateProfile(input: UpdateProfileMutation): ApolloResponse<UpdateProfileMutation.Data>
}