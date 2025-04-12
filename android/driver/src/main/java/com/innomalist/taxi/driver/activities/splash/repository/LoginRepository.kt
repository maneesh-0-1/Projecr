package com.innomalist.taxi.driver.activities.splash.repository

import com.apollographql.apollo3.api.ApolloResponse
import com.minimal.taxi.driver.LoginMutation

interface LoginRepository {
    suspend fun login(firebaseToken: String): ApolloResponse<LoginMutation.Data>
}