package com.innomalist.taxi.rider.activities.splash.repository

import com.apollographql.apollo3.api.ApolloResponse
import com.innomalist.taxi.rider.ClientAPI
import com.minimal.taxi.rider.LoginMutation
import javax.inject.Inject

class LoginRepositoryImpl @Inject() constructor(
    private val webService: ClientAPI
) : LoginRepository {
    override suspend fun login(firebaseToken: String): ApolloResponse<LoginMutation.Data> {
        return this.webService.getApolloClient().mutate(LoginMutation(firebaseToken)).execute()
    }
}