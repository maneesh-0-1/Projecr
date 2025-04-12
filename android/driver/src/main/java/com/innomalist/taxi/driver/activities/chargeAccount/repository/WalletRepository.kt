package com.innomalist.taxi.driver.activities.chargeAccount.repository

import com.apollographql.apollo3.api.ApolloResponse
import com.minimal.taxi.driver.TopUpWalletMutation
import com.minimal.taxi.driver.WalletQuery
import com.minimal.taxi.driver.type.TopUpWalletInput

interface WalletRepository {
    suspend fun getWallet(): ApolloResponse<WalletQuery.Data>
    suspend fun topUpWallet(input: TopUpWalletInput): ApolloResponse<TopUpWalletMutation.Data>
}