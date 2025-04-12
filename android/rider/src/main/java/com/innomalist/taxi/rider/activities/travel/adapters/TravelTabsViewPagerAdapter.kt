package com.innomalist.taxi.rider.activities.travel.adapters

import android.content.Context
import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentManager
import androidx.fragment.app.FragmentPagerAdapter
import com.innomalist.taxi.common.R
import com.innomalist.taxi.rider.activities.travel.fragments.TabDriverInfoFragment
import com.innomalist.taxi.rider.activities.travel.fragments.TabStatisticsFragment
import com.minimal.taxi.rider.fragment.CurrentOrder
import java.util.*

class TravelTabsViewPagerAdapter(manager: FragmentManager, private val context: Context, private val request: CurrentOrder) : FragmentPagerAdapter(manager, BEHAVIOR_RESUME_ONLY_CURRENT_FRAGMENT) {
    override fun getItem(position: Int): Fragment {
        return when (position) {
            0 -> TabDriverInfoFragment()
            1 -> TabStatisticsFragment.newInstance()
            else -> TabDriverInfoFragment()
        }
    }

    override fun getCount(): Int {
        return 2
    }

    override fun getPageTitle(position: Int): CharSequence {
        return when (position) {
            0 -> context.getString(R.string.tab_driver_info)
            1 -> context.getString(R.string.tab_statistics)
            else -> context.getString(R.string.tab_driver_info)
        }
    }
}