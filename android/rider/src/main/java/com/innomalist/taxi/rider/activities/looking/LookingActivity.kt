package com.innomalist.taxi.rider.activities.looking

import android.annotation.SuppressLint
import android.app.Activity
import android.content.Intent
import android.os.Bundle
import androidx.activity.viewModels
import androidx.databinding.DataBindingUtil
import com.airbnb.lottie.LottieDrawable.INFINITE
import com.airbnb.lottie.LottieDrawable.RESTART
import com.innomalist.taxi.common.ViewState
import com.innomalist.taxi.common.components.BaseActivity
import com.innomalist.taxi.common.interfaces.AlertDialogEvent
import com.innomalist.taxi.common.utils.AlertDialogBuilder
import com.innomalist.taxi.common.utils.AlertDialogBuilder.show
import com.innomalist.taxi.common.utils.AlerterHelper
import com.innomalist.taxi.rider.R
import com.innomalist.taxi.rider.databinding.ActivityLookingBinding
import com.minimal.taxi.rider.type.OrderStatus
import dagger.hilt.android.AndroidEntryPoint

@AndroidEntryPoint
class LookingActivity : BaseActivity() {
    lateinit var binding: ActivityLookingBinding
    private val viewModel: LookingActivityViewModel by viewModels()

    @SuppressLint("CheckResult")
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        listenLiveData()
        binding = DataBindingUtil.setContentView(this@LookingActivity, R.layout.activity_looking)
        binding.buttonCancel.setOnClickListener { this.viewModel.cancelOrder() }
    }

    override fun onResume() {
        super.onResume()
        this.viewModel.getCurrentOrder()
    }

    private fun listenLiveData() {
        this.viewModel.currentOrder.observe(this) {
            when(it) {
                is ViewState.Error -> {
                    this.setResult(Activity.RESULT_CANCELED)
                    finish()
                    AlerterHelper.showError(this, it.message)
                }
                is ViewState.Loading -> {
                    binding.buttonCancel.isEnabled = false
                }
                is ViewState.Success -> {
                    val order = it.value ?: throw Exception("")
                    when (order.status) {
                        OrderStatus.Booked -> {
                            binding.textLooking.text = getString(R.string.looking_booked_request)
                            binding.loadingIndicator.setAnimation("check.json")
                            binding.loadingIndicator.repeatMode = RESTART
                            binding.loadingIndicator.repeatCount = 0
                            binding.loadingIndicator.playAnimation()
                            binding.buttonCancel.isEnabled = true
                        }

                        OrderStatus.Requested, OrderStatus.Found, OrderStatus.NotFound, OrderStatus.NoCloseFound -> {
                            binding.textLooking.text = getString(R.string.looking_text)
                            binding.loadingIndicator.setAnimation("car.json")
                            binding.loadingIndicator.repeatCount = INFINITE
                            binding.loadingIndicator.playAnimation()
                            binding.buttonCancel.isEnabled = true
                        }

                        OrderStatus.DriverAccepted, OrderStatus.Started, OrderStatus.Arrived, OrderStatus.WaitingForReview, OrderStatus.WaitingForPostPay, OrderStatus.WaitingForPrePay, OrderStatus.Finished -> {
                            binding.loadingIndicator.pauseAnimation()
                            val intent = Intent()
                            this.setResult(RESULT_OK, intent)
                            finish()
                        }

                        OrderStatus.DriverCanceled, OrderStatus.RiderCanceled -> {
                            this.setResult(RESULT_CANCELED)
                            finish()
                        }

                        OrderStatus.Expired -> show(this@LookingActivity, getString(R.string.message_expired_trip), AlertDialogBuilder.DialogButton.OK, AlertDialogEvent {
                            this@LookingActivity.setResult(RESULT_CANCELED)
                            finish()
                        })
                        is OrderStatus.UNKNOWN__ -> finish()
                    }
                }
            }
        }

        this.viewModel.updateResult.observe(this) {
            when(it) {
                is ViewState.Error -> {
                    AlerterHelper.showError(this, it.message)
                }
                is ViewState.Loading -> binding.buttonCancel.isEnabled = false
                is ViewState.Success -> {
                    this.setResult(Activity.RESULT_CANCELED)
                    finish()
                }
            }
        }
    }


    override fun onBackPressed() {}
}