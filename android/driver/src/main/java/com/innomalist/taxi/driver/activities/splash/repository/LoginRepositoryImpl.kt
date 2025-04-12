package com.innomalist.taxi.driver.activities.splash.repository

import com.apollographql.apollo3.api.ApolloResponse
import com.innomalist.taxi.driver.ClientAPI
import com.minimal.taxi.driver.LoginMutation
import javax.inject.Inject

class LoginRepositoryImpl @Inject() constructor(
    private val webservice: ClientAPI
) : LoginRepository {
    override suspend fun login(firebaseToken: String): ApolloResponse<LoginMutation.Data> {
        return this.webservice.getApolloClient().mutate(LoginMutation(firebaseToken)).execute()
    }
}