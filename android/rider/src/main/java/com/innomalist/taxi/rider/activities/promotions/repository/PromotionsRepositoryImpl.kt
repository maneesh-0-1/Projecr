package com.innomalist.taxi.rider.activities.promotions.repository

import com.apollographql.apollo3.api.ApolloResponse
import com.innomalist.taxi.rider.ClientAPI
import com.minimal.taxi.rider.GetAnnouncementsQuery
import javax.inject.Inject

class PromotionsRepositoryImpl @Inject() constructor(
    private val webService: ClientAPI
) : PromotionsRepository {

    override suspend fun getPromotions(): ApolloResponse<GetAnnouncementsQuery.Data> {
        return this.webService.getApolloClient().query(GetAnnouncementsQuery()).execute()
    }
}