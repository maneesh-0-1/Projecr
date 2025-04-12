package com.innomalist.taxi.rider.activities.transactions.repository

import com.apollographql.apollo3.api.ApolloResponse
import com.minimal.taxi.rider.TransactionsQuery

interface TransactionsRepository {
    suspend fun getTransactions(): ApolloResponse<TransactionsQuery.Data>
}