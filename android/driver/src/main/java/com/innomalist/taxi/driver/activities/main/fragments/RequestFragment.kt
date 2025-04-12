package com.innomalist.taxi.driver.activities.main.fragments

import android.os.Bundle
import android.os.CountDownTimer
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.constraintlayout.widget.ConstraintLayout
import androidx.databinding.DataBindingUtil
import androidx.fragment.app.Fragment
import androidx.fragment.app.activityViewModels
import com.google.android.gms.maps.model.LatLng
import com.innomalist.taxi.common.utils.DistanceFormatter
import com.innomalist.taxi.common.utils.LocationHelper.Companion.distFrom
import com.innomalist.taxi.driver.R
import com.innomalist.taxi.driver.activities.main.MainActivityViewModel
import com.innomalist.taxi.driver.databinding.FragmentRequestBinding
import com.minimal.taxi.driver.fragment.AvailableOrder
import java.text.NumberFormat
import java.util.*

class RequestFragment : Fragment() {
    lateinit var binding: FragmentRequestBinding
    private val viewModel: MainActivityViewModel by activityViewModels()
    private lateinit var countDownTimer: CountDownTimer

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View {
        binding = DataBindingUtil.inflate(inflater, R.layout.fragment_request, container, false)
        val order = this.getOrder()
        binding.request = order
        val format: NumberFormat = NumberFormat.getCurrencyInstance()
        format.currency = Currency.getInstance(order.currency)
        binding.textCost.text = format.format(order.costBest)
        countDownTimer = object : CountDownTimer(300000, 50) {
            override fun onTick(millisUntilFinished: Long) {}
            override fun onFinish() {
                viewModel.deleteOrder(order.id)
            }
        }
        countDownTimer.start()
        binding.textUserDestinationDistance.text = DistanceFormatter.format(distFrom(
            LatLng(order.points.first().point.lat, order.points.first().point.lng), LatLng(order.points.last().point.lat, order.points.last().point.lng)
        ))
        binding.buttonAccept.setOnClickListener {
            countDownTimer.cancel()
            this.viewModel.acceptOrder(order.id)
        }
        binding.buttonDecline.setOnClickListener {
            countDownTimer.cancel()
            viewModel.deleteOrder(order.id)
        }
        return binding.root
    }

    private fun getOrder(): AvailableOrder {
        val orderId =
            arguments?.getLong(ARG_REQUEST_ID) ?: throw Exception("Showing a disvalidated order")
        return viewModel.availableOrders.value?.value?.firstOrNull { it.id.toLong() == orderId }
            ?: throw Exception("Showing a disvalidated order")
    }

    private fun locationChanged(latLng: LatLng) {
        val order = getOrder()
        val distanceTrip = distFrom(
            LatLng(order.points.first().point.lat, order.points.first().point.lng), LatLng(order.points.last().point.lat, order.points.last().point.lng)
        )
        val distanceDriver = distFrom(LatLng(order.points.first().point.lat,order.points.first().point.lng), latLng)
        val gStart = binding.root.findViewById<View>(R.id.guideline_start)
        val lp = gStart.layoutParams as ConstraintLayout.LayoutParams
        lp.guidePercent = distanceDriver.toFloat() / (distanceTrip + distanceDriver)
        gStart.layoutParams = lp
        binding.textDriverUserDistance.text = DistanceFormatter.format(distanceDriver)
    }

    companion object {
        private const val ARG_REQUEST_ID = "request"
        fun newInstance(id: Long): RequestFragment {
            val fragment = RequestFragment()
            val args = Bundle()
            args.putLong(ARG_REQUEST_ID, id)
            fragment.arguments = args
            return fragment
        }
    }
}