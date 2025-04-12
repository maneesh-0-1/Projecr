package com.innomalist.taxi.rider.di

import android.location.Location

interface LocationRepository {
    suspend fun getCurrentLocation(): Location?

}