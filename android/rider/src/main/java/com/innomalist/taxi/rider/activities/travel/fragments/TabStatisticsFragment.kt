package com.innomalist.taxi.rider.activities.travel.fragments

import android.annotation.SuppressLint
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.databinding.DataBindingUtil
import androidx.fragment.app.Fragment
import androidx.fragment.app.activityViewModels
import com.innomalist.taxi.common.ViewState
import com.innomalist.taxi.rider.R
import com.innomalist.taxi.rider.activities.travel.TravelActivity
import com.innomalist.taxi.rider.activities.travel.TravelActivityViewModel
import com.innomalist.taxi.rider.databinding.FragmentTravelStatsBinding
import java.text.NumberFormat
import java.util.*

class TabStatisticsFragment : Fragment() {
    private var binding: FragmentTravelStatsBinding? = null
    private val viewModel: TravelActivityViewModel by activityViewModels()

    @SuppressLint("CheckResult")
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        listenLiveData()
        Timer().schedule(object : TimerTask() {
            override fun run() {
                val activity = activity ?: return
                activity.runOnUiThread {
                    val order = this@TabStatisticsFragment.viewModel.currentOrder.value?.value ?: return@runOnUiThread
                    var timestamp: Long = 0
                    if (order.startTimestamp == null) {
                        if (order.etaPickup != null) {
                            timestamp = order.etaPickup.time
                        }
                    } else {
                        timestamp = order.startTimestamp.time + (order.durationBest * 1000)
                    }
                    val seconds = (timestamp - Date().time) / 1000
                    if(binding == null) {
                        return@runOnUiThread
                    }
                    if (seconds <= 0) binding!!.etaText.setText(R.string.eta_soon) else binding!!.etaText.text = String.format(Locale.getDefault(), "%02d:%02d", seconds / 60, seconds % 60)
                }
            }
        }, 0, 1000)
    }

    private fun listenLiveData() {
        this.viewModel.currentOrder.observe(this) {
            when(it) {
                is ViewState.Error -> {}
                is ViewState.Loading -> {}
                is ViewState.Success -> {
                    val order = this@TabStatisticsFragment.viewModel.currentOrder.value?.value ?: return@observe
                    val format: NumberFormat = NumberFormat.getCurrencyInstance()
                    format.currency = Currency.getInstance(order.currency)
                    binding!!.costText.text = format.format(order.costAfterCoupon)
                }
            }
        }
    }

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View {
        binding = DataBindingUtil.inflate(inflater, R.layout.fragment_travel_stats, container, false)
        binding!!.applyCouponButton.setOnClickListener { (requireActivity() as TravelActivity).onApplyCouponClicked() }
        binding!!.chargeAccountButton.setOnClickListener { (requireActivity() as TravelActivity).onChargeAccountClicked() }
        return binding!!.root
    }


    companion object {
        fun newInstance(): TabStatisticsFragment {
            return TabStatisticsFragment()
        }
    }
}