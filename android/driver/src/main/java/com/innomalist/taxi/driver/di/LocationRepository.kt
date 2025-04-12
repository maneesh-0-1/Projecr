package com.innomalist.taxi.driver.di

import android.location.Location

interface LocationRepository {
    suspend fun getCurrentLocation(): Location?

}