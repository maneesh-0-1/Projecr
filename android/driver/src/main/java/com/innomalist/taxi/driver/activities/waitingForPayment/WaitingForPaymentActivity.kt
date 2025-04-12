package com.innomalist.taxi.driver.activities.waitingForPayment

import android.app.Activity
import android.os.Bundle
import android.view.View
import androidx.activity.viewModels
import androidx.databinding.DataBindingUtil
import com.innomalist.taxi.common.ViewState
import com.innomalist.taxi.common.components.BaseActivity
import com.innomalist.taxi.common.utils.AlertDialogBuilder
import com.innomalist.taxi.common.utils.AlertDialogBuilder.show
import com.innomalist.taxi.driver.R
import com.innomalist.taxi.driver.databinding.ActivityWaitingForPaymentBinding
import com.minimal.taxi.driver.type.OrderStatus
import com.minimal.taxi.driver.type.ServicePaymentMethod
import dagger.hilt.android.AndroidEntryPoint

@AndroidEntryPoint
class WaitingForPaymentActivity : BaseActivity() {
    lateinit var binding: ActivityWaitingForPaymentBinding
    private val viewModel: WaitingForPaymentActivityViewModel by viewModels()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = DataBindingUtil.setContentView(this@WaitingForPaymentActivity, R.layout.activity_waiting_for_payment)
        listenLiveData()
//        SocketNetworkDispatcher.instance.onPaid = {
//            this.setResult(Activity.RESULT_OK)
//            finish()
//        }
        binding.buttonPaidInCash.setOnClickListener {
            val order = this.viewModel.currentOrder.value?.value?.data?.driver?.basicProfile?.orders?.nodes?.firstOrNull()?.currentOrder ?: return@setOnClickListener
            this.viewModel.paidInCash(order.id, order.costAfterCoupon)
        }
    }

    override fun onResume() {
        super.onResume()
        this.viewModel.getCurrentOrder()
    }

    private fun listenLiveData() {
        this.viewModel.currentOrder.observe(this) {
            when(it) {
                is ViewState.Error -> {
                    this.setResult(Activity.RESULT_OK)
                    finish()
                }
                is ViewState.Loading -> {
                    binding.buttonPaidInCash.visibility = View.INVISIBLE
                }
                is ViewState.Success -> {
                    val order = this.viewModel.currentOrder.value?.value?.data?.driver?.basicProfile?.orders?.nodes?.firstOrNull()?.currentOrder
                    if(order == null) {
                        this.setResult(Activity.RESULT_OK)
                        finish()
                        return@observe
                    }
                    if(order.service.paymentMethod == ServicePaymentMethod.CashCredit || order.service.paymentMethod == ServicePaymentMethod.OnlyCash) {
                        binding.buttonPaidInCash.visibility = View.VISIBLE
                    }
                    when (order.status) {
                        OrderStatus.Finished, OrderStatus.WaitingForReview -> {
                            this.setResult(Activity.RESULT_OK)
                            finish()
                        }

                        OrderStatus.WaitingForPostPay -> {

                        }

                        else -> {
                            show(this, "Unhandled service status: ${order.status.rawValue}", AlertDialogBuilder.DialogButton.OK, null)
                        }
                    }
                }
            }
        }
        this.viewModel.updateResult.observe(this) {
            when(it) {
                is ViewState.Error -> binding.buttonPaidInCash.isEnabled = true
                is ViewState.Loading -> binding.buttonPaidInCash.isEnabled = false
                is ViewState.Success -> {
                    this.setResult(Activity.RESULT_OK)
                    finish()
                }
            }
        }
    }
}