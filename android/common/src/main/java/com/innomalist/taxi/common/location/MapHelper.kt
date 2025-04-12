package com.innomalist.taxi.common.location

import com.google.android.gms.maps.CameraUpdateFactory
import com.google.android.gms.maps.GoogleMap
import com.google.android.gms.maps.model.LatLng
import com.google.android.gms.maps.model.LatLngBounds

object MapHelper {
    @JvmStatic
    fun centerLatLngsInMap(googleMap: GoogleMap, locations: List<LatLng>, animate: Boolean) {
        if(locations.isEmpty()) return
        if(locations.count() == 1) {
            googleMap.animateCamera(
                CameraUpdateFactory.newLatLngZoom(
                    locations.first(),
                    16f
                )
            )
        } else {
            val builder = LatLngBounds.Builder()
            if (locations.size < 2) return
            for (location in locations) builder.include(location)
            val bounds = builder.build()
            val padding = 100 // in pixels
            val cu = CameraUpdateFactory.newLatLngBounds(bounds, padding)
            //if (animate) googleMap.animateCamera(cu) else googleMap.moveCamera(cu)
            //It can't be moved until the tiles are fully loaded
            googleMap.setOnMapLoadedCallback {
                if(animate)
                    googleMap.animateCamera(cu)
                else
                    googleMap.moveCamera(cu)
            }
        }


    }
}