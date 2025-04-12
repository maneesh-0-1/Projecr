package com.innomalist.taxi.driver.activities.statistics.repository

import com.apollographql.apollo3.api.ApolloResponse
import com.minimal.taxi.driver.GetStatsQuery
import com.minimal.taxi.driver.type.TimeQuery

interface StatisticsRepository {
    suspend fun getStats(timeFrame: TimeQuery): ApolloResponse<GetStatsQuery.Data>
}