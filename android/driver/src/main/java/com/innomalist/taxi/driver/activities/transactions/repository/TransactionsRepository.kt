package com.innomalist.taxi.driver.activities.transactions.repository

import com.apollographql.apollo3.api.ApolloResponse
import com.minimal.taxi.driver.TransactionsQuery

interface TransactionsRepository {
    suspend fun getTransactions(): ApolloResponse<TransactionsQuery.Data>
}