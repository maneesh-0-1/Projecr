package com.innomalist.taxi.driver.activities.chargeAccount

import android.content.Intent
import android.os.Bundle
import android.view.View
import android.widget.ArrayAdapter
import android.widget.LinearLayout
import androidx.activity.viewModels
import androidx.appcompat.view.ContextThemeWrapper
import androidx.databinding.DataBindingUtil
import com.google.android.material.button.MaterialButton
import com.google.android.material.button.MaterialButtonToggleGroup
import com.innomalist.taxi.common.R
import com.innomalist.taxi.common.ViewState
import com.innomalist.taxi.common.activities.payment.PaymentActivity
import com.innomalist.taxi.common.components.BaseActivity
import com.innomalist.taxi.common.databinding.ActivityChargeAccountBinding
import com.innomalist.taxi.common.utils.AlertDialogBuilder
import com.innomalist.taxi.common.utils.AlerterHelper
import com.minimal.taxi.driver.WalletQuery
import com.minimal.taxi.driver.type.TopUpWalletInput
import dagger.hilt.android.AndroidEntryPoint
import java.text.NumberFormat
import java.util.*
import kotlin.collections.ArrayList

@AndroidEntryPoint
class ChargeAccountActivity : BaseActivity() {
    lateinit var binding: ActivityChargeAccountBinding
    private val viewModel: WalletActivityViewModel by viewModels()
    private var selectedPayment: WalletQuery.PaymentGateway? = null
    var currency: String? = null
    private var tripFee: Double = 0.0
    private var walletItems: List<WalletQuery.DriverWallet> = ArrayList()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = DataBindingUtil.setContentView(this, R.layout.activity_charge_account)
        initializeToolbar(getString(R.string.drawer_wallet))
        binding.waitingForPayment = false
        binding.checkoutButton.setOnClickListener { this.onCheckoutClicked() }
        listenLiveData()
        this.viewModel.syncWallet()
        binding.paymentToggleLayout.addOnButtonCheckedListener { _: MaterialButtonToggleGroup?, checkedId: Int, isChecked: Boolean ->
            if (!isChecked) {
                selectedPayment = null
                binding.checkoutButton.isEnabled = false
                binding.checkoutButton.text = getString(R.string.checkout_empty)
                return@addOnButtonCheckedListener
            } else {
                selectedPayment = this.viewModel.wallet.value?.value?.paymentGateways?.first { it.id.toInt() == checkedId }

            }
        }
        binding.chargeAddFirst.text = resources.getInteger(R.integer.charge_first).toString()
        binding.chargeAddSecond.text = resources.getInteger(R.integer.charge_second).toString()
        binding.chargeAddThird.text = resources.getInteger(R.integer.charge_third).toString()
        binding.chargeAddFirst.setOnClickListener { addCharge(R.integer.charge_first) }
        binding.chargeAddSecond.setOnClickListener { addCharge(R.integer.charge_second) }
        binding.chargeAddThird.setOnClickListener { addCharge(R.integer.charge_third) }
    }

    private fun listenLiveData() {
        this.viewModel.wallet.observe(this) {
            when(it) {
                is ViewState.Error -> binding.loadingMode = false
                is ViewState.Loading -> binding.loadingMode = true
                is ViewState.Success -> {
                    binding.loadingMode = false
                    val response = it.value ?: return@observe
                    if (response.paymentGateways.count() < 1) {
                        AlertDialogBuilder.show(this@ChargeAccountActivity, "No Gateway available.", AlertDialogBuilder.DialogButton.OK) {
                            finish()
                        }
                        return@observe
                    }
                    if (response.driverWallets.count() < 1) {
                        binding.emptyBalance = true
                        if (intent.getStringExtra("currency") == null) {
                            AlertDialogBuilder.show(this@ChargeAccountActivity, getString(R.string.message_wallet_trip_record_empty), AlertDialogBuilder.DialogButton.OK) {
                                finish()
                            }
                            return@observe
                        }
                    }
                    this.walletItems = response.driverWallets.sortedByDescending { x -> x.balance }
                    val items = this.walletItems.map { walletItem ->
                        val nf = NumberFormat.getCurrencyInstance()
                        nf.currency = Currency.getInstance(walletItem.currency)
                        nf.format(walletItem.balance)
                    }
                    val adapter = ArrayAdapter(this, android.R.layout.simple_dropdown_item_1line, items)
                    binding.balanceAutocomplete.setAdapter(adapter)
                    binding.balanceAutocomplete.setOnItemClickListener { _, _, position, _ ->
                        currency = walletItems[position].currency
                    }
                    if (response.driverWallets.isNotEmpty()) {
                        binding.balanceAutocomplete.setText(items[0], false)
                        currency = this.walletItems[0].currency
                    } else {
                        binding.balanceAutocomplete.visibility = View.GONE
                    }
                    when {
                        response.paymentGateways.size > 1 -> {
                            for (gw in response.paymentGateways) {
                                val btn = MaterialButton(ContextThemeWrapper(this, R.style.Widget_MaterialComponents_Button_TextButton))
                                btn.id = gw.id.toInt()
                                btn.text = gw.title
                                val params = LinearLayout.LayoutParams(
                                    LinearLayout.LayoutParams.WRAP_CONTENT,
                                    LinearLayout.LayoutParams.WRAP_CONTENT
                                )
                                params.setMargins(0, 0, 8, 0)
                                params.weight = 1f
                                btn.layoutParams = params
                                btn.setOnClickListener {
                                    selectedPayment = gw
                                    binding.checkoutButton.isEnabled = true
                                    binding.checkoutButton.text = getString(R.string.checkout_filled, gw.title)
                                }
                                binding.layoutMethods.addView(btn)
                            }
                        }
                        response.paymentGateways.size == 1 -> {
                            selectedPayment = response.paymentGateways[0]
                            binding.checkoutButton.isEnabled = true
                            binding.checkoutButton.text = getString(R.string.checkout_filled, selectedPayment!!.title)
                            binding.paymentToggleLayout.visibility = View.GONE
                            binding.titleMethod.visibility = View.GONE
                        }
                    }
                    if (intent.getStringExtra("currency") != null) {
                        this.currency = intent.getStringExtra("currency")
                        binding.balanceAutocomplete.isEnabled = false
                        val index = this.walletItems.indexOfFirst { walletItem -> walletItem.currency == this.currency }
                        tripFee = intent.getDoubleExtra("defaultAmount", 0.0) - if (index < 0) 0.0 else this.walletItems[index].balance
                        binding.textAmount.setText("$tripFee")
                        if (index > 0) {
                            binding.balanceAutocomplete.setSelection(index)
                        }
                        binding.emptyBalance = index < 0

                    }
                }
            }
        }

        this.viewModel.topUpAccountResult.observe(this) {
            when(it) {
                is ViewState.Error -> binding.waitingForPayment = false
                is ViewState.Loading -> binding.waitingForPayment = true
                is ViewState.Success -> {
                    binding.waitingForPayment = false
                    val url = it.value?.url ?: throw Exception("No Url Received")
                    val intent = Intent(this@ChargeAccountActivity, PaymentActivity::class.java)
                    intent.putExtra("redirectionUrl", url)
                    startActivityForResult(intent, WEB_PAYMENT_CALLBACK)
                }
            }
        }
    }

    private fun onCheckoutClicked() {
        if (binding.textAmount.text.toString().isEmpty()) {
            binding.textAmount.error = getString(R.string.error_charge_field_empty)
            return
        }
        val amountDouble = binding.textAmount.text.toString().replace(",", "").toDouble()
        if (tripFee > 0 && tripFee > amountDouble) {
            binding.textAmount.error = getString(R.string.error_charge_field_less_than_trip_fee)
            return
        }
        this.viewModel.topUpWallet(TopUpWalletInput(
            amount = amountDouble,
            currency = currency ?: "USD",
            gatewayId = selectedPayment!!.id
        ))
    }
    private fun addCharge(resId: Int) {
        try {
            binding.textAmount.setText(getString(resId))
        } catch (e: Exception) {
            e.printStackTrace()
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        when (requestCode) {
            WEB_PAYMENT_CALLBACK -> {
                when (resultCode) {
                    RESULT_OK -> {
                        AlerterHelper.showInfo(this, getString(R.string.message_payment_done))
                    }

                    RESULT_CANCELED -> {
                        AlerterHelper.showError(this, getString(R.string.message_payment_failed))
                    }
                }
            }
        }
    }

    companion object {
        private const val WEB_PAYMENT_CALLBACK = 244
    }
}