package com.innomalist.taxi.driver.activities.statistics

import android.graphics.Color
import android.os.Bundle
import android.view.View
import androidx.activity.viewModels
import androidx.databinding.DataBindingUtil
import com.db.williamchart.data.Scale
import com.google.android.material.tabs.TabLayout
import com.google.android.material.tabs.TabLayout.OnTabSelectedListener
import com.innomalist.taxi.common.ViewState
import com.innomalist.taxi.common.components.BaseActivity
import com.innomalist.taxi.common.utils.AlerterHelper
import com.innomalist.taxi.common.utils.DistanceFormatter
import com.innomalist.taxi.driver.R
import com.innomalist.taxi.driver.databinding.ActivityStatisticsBinding
import com.minimal.taxi.driver.type.TimeQuery
import com.tylersuehr.esr.ContentItemLoadingStateFactory
import com.tylersuehr.esr.EmptyStateRecyclerView
import com.tylersuehr.esr.ImageTextStateDisplay
import dagger.hilt.android.AndroidEntryPoint
import java.text.NumberFormat
import java.util.*

@AndroidEntryPoint
class StatisticsActivity : BaseActivity() {
    lateinit var binding: ActivityStatisticsBinding
    private val viewModel: StatisticsActivityViewModel by viewModels()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = DataBindingUtil.setContentView(this, R.layout.activity_statistics)
        initializeToolbar(getString(R.string.drawer_earnings))
        binding.emptyState.setStateDisplay(EmptyStateRecyclerView.STATE_LOADING, ContentItemLoadingStateFactory.newCardLoadingState(this))
        binding.emptyState.setStateDisplay(EmptyStateRecyclerView.STATE_EMPTY, ImageTextStateDisplay(this, com.innomalist.taxi.common.R.drawable.empty_state, getString(R.string.empty_state_driver_earning_title), getString(R.string.empty_state_driver_earning_message)))
        binding.tabDate.addOnTabSelectedListener(tabSelectedListener)
        listenLiveData()
        this.viewModel.syncStats(TimeQuery.Daily)
    }

    private fun listenLiveData() {
        this.viewModel.stats.observe(this) {
            when(it) {
                is ViewState.Error -> AlerterHelper.showError(this, it.message ?: "Unknown error on Statistics Activity")
                is ViewState.Loading -> {
                    binding.tabDate.isEnabled = false
                    binding.emptyState.invokeState(EmptyStateRecyclerView.STATE_LOADING)
                }
                is ViewState.Success -> {
                    val response = it.value ?: return@observe
                    if(response.dataset.count() < 1) {
                        binding.emptyState.invokeState(EmptyStateRecyclerView.STATE_EMPTY)
                        return@observe
                    }
                    binding.emptyState.visibility = View.GONE
                    binding.tabDate.visibility = View.VISIBLE
                    binding.chartCard.visibility = View.VISIBLE
                    binding.incomeCard.visibility = View.VISIBLE
                    binding.ratingCard.visibility = View.VISIBLE
                    binding.serviceCard.visibility = View.VISIBLE
                    val data = response.dataset.map { it2 -> it2.name to it2.earning.toFloat() }.toList()
                    val map = LinkedList(data)
                    binding.chart.gradientFillColors = intArrayOf(Color.parseColor("#81FFFFFF"), Color.TRANSPARENT)
                    binding.chart.animation.duration = 300L
                    val mx = response.dataset.maxByOrNull { it2 -> it2.earning }!!.earning * 1.1
                    val mn = response.dataset.minByOrNull { it2 -> it2.earning }!!.earning * 0.9
                    binding.chart.scale = Scale(mn.toFloat(), mx.toFloat())
                    binding.chart.postInvalidate()
                    binding.chart.animate(map)
                    val current = response.dataset.firstOrNull { it2 -> it2.current == it2.name }
                    binding.chart.labelsFormatter = { fl ->
                        val formatter: NumberFormat = NumberFormat.getCurrencyInstance()
                        formatter.currency = Currency.getInstance(response.currency)
                        formatter.format(fl)
                    }
                    if(current != null) {
                        val formatter: NumberFormat = NumberFormat.getCurrencyInstance()
                        formatter.currency = Currency.getInstance(response.currency)
                        binding.incomeText.text = formatter.format(current.earning)
                        binding.serviceText.text = current.count.toString()
                        binding.distanceText.text = DistanceFormatter.format(current.distance.toInt())
                    } else {
                        binding.incomeText.text = "-"
                        binding.serviceText.text = "-"
                        binding.distanceText.text = "-"
                    }
                }
            }
        }
    }

    private var tabSelectedListener: OnTabSelectedListener = object : OnTabSelectedListener {
        override fun onTabSelected(tab: TabLayout.Tab) {
            val qType = when(tab.position) {
                0 -> TimeQuery.Daily
                1 -> TimeQuery.Weekly
                2 -> TimeQuery.Monthly
                else -> TimeQuery.Daily
            }
            this@StatisticsActivity.viewModel.syncStats(qType)
        }

        override fun onTabUnselected(tab: TabLayout.Tab) {}
        override fun onTabReselected(tab: TabLayout.Tab) {}
    }
}