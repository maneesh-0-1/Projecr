package com.innomalist.taxi.rider.activities.travel.repository

import com.apollographql.apollo3.api.ApolloResponse
import com.apollographql.apollo3.cache.normalized.FetchPolicy
import com.apollographql.apollo3.cache.normalized.fetchPolicy
import com.innomalist.taxi.rider.ClientAPI
import com.minimal.taxi.rider.*
import kotlinx.coroutines.flow.Flow
import javax.inject.Inject

class TravelRepositoryImpl @Inject() constructor(
    private val webservice: ClientAPI
) : TravelRepository {
    override suspend fun getCurrentOrder(): ApolloResponse<GetCurrentOrderQuery.Data> {
        return this.webservice.getApolloClient().query(GetCurrentOrderQuery()).fetchPolicy(FetchPolicy.NetworkOnly).execute()
    }

    override suspend fun cancelOrder(): ApolloResponse<CancelOrderMutation.Data> {
        return this.webservice.getApolloClient().mutate(CancelOrderMutation()).execute()
    }

    override suspend fun submitReview(input: SubmitFeedbackMutation): ApolloResponse<SubmitFeedbackMutation.Data> {
        return this.webservice.getApolloClient().mutate(input).fetchPolicy(FetchPolicy.NetworkOnly).execute()
    }

    override suspend fun watchOrderUpdate(): Flow<ApolloResponse<UpdatedOrderSubscription.Data>> {
        return this.webservice.getApolloClient().subscribe(UpdatedOrderSubscription()).execute()
    }

    override suspend fun watchDriverLocationUpdate(driverId: String): Flow<ApolloResponse<DriverLocationUpdatedSubscription.Data>> {
        return this.webservice.getApolloClient().subscribe(DriverLocationUpdatedSubscription(driverId = driverId)).execute()
    }

    override suspend fun applyCoupon(code: String): ApolloResponse<ApplyCouponMutation.Data> {
        return this.webservice.getApolloClient().mutate(ApplyCouponMutation(code)).execute()
    }
}