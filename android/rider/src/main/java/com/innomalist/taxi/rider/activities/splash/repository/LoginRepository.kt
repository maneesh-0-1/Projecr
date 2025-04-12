package com.innomalist.taxi.rider.activities.splash.repository

import com.apollographql.apollo3.api.ApolloResponse
import com.minimal.taxi.rider.LoginMutation

interface LoginRepository {
    suspend fun login(firebaseToken: String): ApolloResponse<LoginMutation.Data>
}