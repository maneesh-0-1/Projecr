package com.innomalist.taxi.common.utils

import android.content.Context
import android.location.LocationManager
import android.net.ConnectivityManager
import androidx.appcompat.app.AppCompatActivity

object CommonUtils {
    @JvmStatic
    fun isInternetDisabled(activity: AppCompatActivity): Boolean {
        var haveConnectedWifi = false
        var haveConnectedMobile = false
        val cm = activity.getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager
        val netInfo = cm.allNetworkInfo
        for (ni in netInfo) {
            if (ni.typeName.equals("WIFI", ignoreCase = true)) if (ni.isConnected) haveConnectedWifi = true
            if (ni.typeName.equals("MOBILE", ignoreCase = true)) if (ni.isConnected) haveConnectedMobile = true
        }
        return !haveConnectedWifi && !haveConnectedMobile
    }

    @JvmStatic
    fun isGPSEnabled(activity: AppCompatActivity): Boolean {
        val locationManager = activity.getSystemService(Context.LOCATION_SERVICE) as LocationManager
        return locationManager.isProviderEnabled(LocationManager.GPS_PROVIDER)
    }
}