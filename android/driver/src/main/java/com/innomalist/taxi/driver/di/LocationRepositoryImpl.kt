package com.innomalist.taxi.driver.di

import android.annotation.SuppressLint
import android.location.Location
import kotlinx.coroutines.tasks.await
import javax.inject.Inject

class LocationRepositoryImpl @Inject constructor(
    private val locationProvider: LocationProvider
) : LocationRepository {

    @SuppressLint("MissingPermission")
    override suspend fun getCurrentLocation(): Location? {
        return locationProvider.getFusedLocationProvider().lastLocation.await()
    }
}