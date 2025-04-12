package com.innomalist.taxi.driver.activities.main.adapters

import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentManager
import com.innomalist.taxi.common.ui.ArrayFragmentPagerAdapter
import com.innomalist.taxi.driver.activities.main.fragments.RequestFragment
import com.minimal.taxi.driver.fragment.AvailableOrder

class RequestsFragmentPagerAdapter(fm: FragmentManager?, requests: List<AvailableOrder>) : ArrayFragmentPagerAdapter<AvailableOrder>(fm, requests) {
    fun getPositionWithTravelId(travelId: Double): Int {
        for (i in 0 until count) {
            if (getItem(i).id == travelId) {
                return i
            }
        }
        return -1
    }

    override fun getFragment(item: AvailableOrder?, position: Int): Fragment { // return RequestCardFragment.newInstance(item);
        return RequestFragment.newInstance(item!!.id.toLong())
    }
}