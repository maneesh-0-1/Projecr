package com.innomalist.taxi.driver.activities.transactions.repository

import com.apollographql.apollo3.api.ApolloResponse
import com.innomalist.taxi.driver.ClientAPI
import com.minimal.taxi.driver.TransactionsQuery
import javax.inject.Inject

class TransactionsRepositoryImpl @Inject() constructor(
    private val webService: ClientAPI
) : TransactionsRepository {
    override suspend fun getTransactions(): ApolloResponse<TransactionsQuery.Data> {
        return this.webService.getApolloClient().query(TransactionsQuery()).execute()
    }
}