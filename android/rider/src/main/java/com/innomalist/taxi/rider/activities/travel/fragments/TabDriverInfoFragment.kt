package com.innomalist.taxi.rider.activities.travel.fragments

import android.annotation.SuppressLint
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.databinding.DataBindingUtil
import androidx.fragment.app.Fragment
import androidx.fragment.app.activityViewModels
import com.bumptech.glide.Glide
import com.innomalist.taxi.common.ViewState
import com.innomalist.taxi.rider.Config
import com.innomalist.taxi.rider.R
import com.innomalist.taxi.rider.activities.travel.TravelActivityViewModel
import com.innomalist.taxi.rider.databinding.FragmentTravelDriverBinding

class TabDriverInfoFragment : Fragment() {
    private val viewModel: TravelActivityViewModel by activityViewModels()
    lateinit var binding: FragmentTravelDriverBinding

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View {
        binding = DataBindingUtil.inflate(inflater, R.layout.fragment_travel_driver, container, false)
        binding.textPickup.isSelected = true
        binding.textDestination.isSelected = true
        listenLiveData()

        return binding.root
    }

    @SuppressLint("SetTextI18n")
    private fun listenLiveData() {
        this.viewModel.currentOrder.observe(viewLifecycleOwner) {
            when(it) {
                is ViewState.Error -> {}
                is ViewState.Loading -> {}
                is ViewState.Success -> {
                    val order = viewModel.currentOrder.value?.value
                    binding.textPickup.text = order?.addresses?.first() ?: "-"
                    binding.textDestination.text = order?.addresses?.last() ?: "-"
                    if (order?.driver != null) {
                        binding.driver = order.driver
                        binding.textDriverName.text =
                            "${order.driver.firstName} ${order.driver.lastName}"
                        var carName: String? = "-"
                        if (order.driver.car?.name != null) carName = order.driver.car.name
                        if (order.driver.carColor != null) carName += " " + order.driver.carColor.name
                        if (order.driver.carPlate != null) carName += ", " + order.driver.carPlate
                        binding.textCarName.text = carName
                        order.driver.media?.address?.let { address ->
                            Glide.with(this).load(Config.Backend + address).into(binding.imageDriver)
                        }
                    }
                }
            }
        }
    }
}