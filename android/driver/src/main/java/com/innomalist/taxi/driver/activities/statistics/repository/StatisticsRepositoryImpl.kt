package com.innomalist.taxi.driver.activities.statistics.repository

import com.apollographql.apollo3.api.ApolloResponse
import com.innomalist.taxi.driver.ClientAPI
import com.minimal.taxi.driver.GetStatsQuery
import com.minimal.taxi.driver.type.TimeQuery
import javax.inject.Inject

class StatisticsRepositoryImpl @Inject() constructor(
    private val webService: ClientAPI
) : StatisticsRepository {
    override suspend fun getStats(timeFrame: TimeQuery): ApolloResponse<GetStatsQuery.Data> {
        return this.webService.getApolloClient().query(GetStatsQuery(timeFrame)).execute()
    }
}