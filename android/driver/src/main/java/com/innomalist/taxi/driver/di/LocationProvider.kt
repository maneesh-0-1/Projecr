package com.innomalist.taxi.driver.di

import android.content.Context
import com.google.android.gms.location.FusedLocationProviderClient
import com.google.android.gms.location.LocationServices
import javax.inject.Inject

class LocationProvider @Inject constructor(
    private val applicationContext: Context
) {

    fun getFusedLocationProvider(): FusedLocationProviderClient {
        return LocationServices.getFusedLocationProviderClient(applicationContext)
    }
}