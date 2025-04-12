package com.innomalist.taxi.driver.activities.chargeAccount.repository

import com.apollographql.apollo3.api.ApolloResponse
import com.innomalist.taxi.driver.ClientAPI
import com.minimal.taxi.driver.TopUpWalletMutation
import com.minimal.taxi.driver.WalletQuery
import com.minimal.taxi.driver.type.TopUpWalletInput
import javax.inject.Inject

class WalletRepositoryImpl @Inject() constructor(
    private val webService: ClientAPI
) : WalletRepository {
    override suspend fun getWallet(): ApolloResponse<WalletQuery.Data> {
        return this.webService.getApolloClient().query(WalletQuery()).execute()
    }

    override suspend fun topUpWallet(input: TopUpWalletInput): ApolloResponse<TopUpWalletMutation.Data> {
        return this.webService.getApolloClient().mutate(TopUpWalletMutation(input)).execute()
    }
}