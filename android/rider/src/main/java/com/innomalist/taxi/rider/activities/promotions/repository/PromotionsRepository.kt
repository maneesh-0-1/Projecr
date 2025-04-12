package com.innomalist.taxi.rider.activities.promotions.repository

import com.apollographql.apollo3.api.ApolloResponse
import com.minimal.taxi.rider.GetAnnouncementsQuery

interface PromotionsRepository {
    suspend fun getPromotions(): ApolloResponse<GetAnnouncementsQuery.Data>
}