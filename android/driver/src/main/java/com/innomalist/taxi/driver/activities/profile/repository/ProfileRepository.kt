package com.innomalist.taxi.driver.activities.profile.repository

import com.apollographql.apollo3.api.ApolloResponse
import com.minimal.taxi.driver.*
import com.minimal.taxi.driver.type.UpdateDriverInput

interface ProfileRepository {
    suspend fun getProfile(): ApolloResponse<GetDriverQuery.Data>
    suspend fun updateProfile(input: UpdateDriverProfileMutation): ApolloResponse<UpdateDriverProfileMutation.Data>
}