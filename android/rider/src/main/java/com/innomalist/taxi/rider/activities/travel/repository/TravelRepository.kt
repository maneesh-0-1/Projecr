package com.innomalist.taxi.rider.activities.travel.repository

import com.apollographql.apollo3.api.ApolloResponse
import com.minimal.taxi.rider.*
import kotlinx.coroutines.flow.Flow


interface TravelRepository {
    suspend fun getCurrentOrder(): ApolloResponse<GetCurrentOrderQuery.Data>
    suspend fun cancelOrder(): ApolloResponse<CancelOrderMutation.Data>
    suspend fun submitReview(input: SubmitFeedbackMutation): ApolloResponse<SubmitFeedbackMutation.Data>
    suspend fun watchOrderUpdate(): Flow<ApolloResponse<UpdatedOrderSubscription.Data>>
    suspend fun watchDriverLocationUpdate(driverId: String): Flow<ApolloResponse<DriverLocationUpdatedSubscription.Data>>
    suspend fun applyCoupon(code: String): ApolloResponse<ApplyCouponMutation.Data>
}