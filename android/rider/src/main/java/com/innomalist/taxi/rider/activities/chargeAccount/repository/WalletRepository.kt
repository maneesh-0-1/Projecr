package com.innomalist.taxi.rider.activities.chargeAccount.repository

import com.apollographql.apollo3.api.ApolloResponse
import com.minimal.taxi.rider.TopUpWalletMutation
import com.minimal.taxi.rider.WalletQuery
import com.minimal.taxi.rider.type.TopUpWalletInput

interface WalletRepository {
    suspend fun getWallet(): ApolloResponse<WalletQuery.Data>
    suspend fun topUpWallet(input: TopUpWalletInput): ApolloResponse<TopUpWalletMutation.Data>
}