package com.innomalist.taxi.rider.activities.chargeAccount.repository

import com.apollographql.apollo3.api.ApolloResponse
import com.innomalist.taxi.rider.ClientAPI
import com.minimal.taxi.rider.TopUpWalletMutation
import com.minimal.taxi.rider.WalletQuery
import com.minimal.taxi.rider.type.TopUpWalletInput
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