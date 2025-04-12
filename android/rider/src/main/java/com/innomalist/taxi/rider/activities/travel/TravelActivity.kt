package com.innomalist.taxi.rider.activities.travel

import android.Manifest.permission.CALL_PHONE
import android.annotation.SuppressLint
import android.content.Intent
import android.content.pm.PackageManager
import android.media.MediaPlayer
import android.net.Uri
import android.os.Bundle
import android.text.InputType
import android.view.Gravity
import android.view.View
import android.view.ViewGroup
import android.widget.EditText
import android.widget.LinearLayout
import androidx.activity.viewModels
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import androidx.databinding.DataBindingUtil
import androidx.transition.TransitionManager
import com.google.android.gms.maps.GoogleMap
import com.google.android.gms.maps.OnMapReadyCallback
import com.google.android.gms.maps.SupportMapFragment
import com.google.android.gms.maps.model.BitmapDescriptorFactory
import com.google.android.gms.maps.model.LatLng
import com.google.android.gms.maps.model.Marker
import com.google.android.gms.maps.model.MarkerOptions
import com.google.android.material.dialog.MaterialAlertDialogBuilder
import com.google.android.material.snackbar.Snackbar
import com.innomalist.taxi.common.ViewState
import com.innomalist.taxi.common.components.BaseActivity
import com.innomalist.taxi.common.interfaces.AlertDialogEvent
import com.innomalist.taxi.common.location.MapHelper.centerLatLngsInMap
import com.innomalist.taxi.common.utils.AlertDialogBuilder
import com.innomalist.taxi.common.utils.AlertDialogBuilder.show
import com.innomalist.taxi.common.utils.AlerterHelper.showInfo
import com.innomalist.taxi.common.utils.LoadingDialog
import com.innomalist.taxi.rider.R
import com.innomalist.taxi.rider.activities.chargeAccount.ChargeAccountActivity
import com.innomalist.taxi.rider.activities.chat.ChatActivity
import com.innomalist.taxi.rider.activities.travel.adapters.TravelTabsViewPagerAdapter
import com.innomalist.taxi.rider.activities.travel.fragments.ReviewDialog
import com.innomalist.taxi.rider.databinding.ActivityTravelBinding
import com.innomalist.taxi.rider.toLatLng
import com.minimal.taxi.rider.type.OrderStatus
import com.minimal.taxi.rider.type.ServicePaymentMethod
import dagger.hilt.android.AndroidEntryPoint
import java.util.*
import kotlin.collections.ArrayList

@AndroidEntryPoint
class TravelActivity : BaseActivity(), OnMapReadyCallback {
    lateinit var binding: ActivityTravelBinding
    private val viewModel: TravelActivityViewModel by viewModels()
    private var pointMarkers: MutableList<Marker> = ArrayList()
    private var driverMarker: Marker? = null
    private var gMap: GoogleMap? = null
    private var travelTabsViewPagerAdapter: TravelTabsViewPagerAdapter? = null
    private val permissionPhoneCallRequestCode = 400

    @SuppressLint("CheckResult")
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = DataBindingUtil.setContentView(this, R.layout.activity_travel)
        (supportFragmentManager.findFragmentById(R.id.map) as SupportMapFragment).getMapAsync(this)
        listenLiveData()
        binding.slideCancel.setOnSlideCompleteListener { this.viewModel.cancelOrder() }
        binding.slideCall.setOnSlideCompleteListener { callDriver() }
        binding.chatButton.setOnClickListener {
            startActivity(Intent(this@TravelActivity, ChatActivity::class.java))
        }
    }

    private fun listenLiveData() {
        this.viewModel.submitReviewResult.observe(this) {
            when (it) {
                is ViewState.Error -> {
                    LoadingDialog.hide()
                    finish()
                }
                is ViewState.Loading -> LoadingDialog.display(this)
                is ViewState.Success -> {
                    LoadingDialog.hide()
                    finish()
                }
            }
        }
        this.viewModel.updateResult.observe(this) {
            when (it) {
                is ViewState.Loading -> binding.slideCancel.isEnabled = false
                is ViewState.Error -> binding.slideCancel.isEnabled = true
                is ViewState.Success -> {}
            }
        }
        this.viewModel.driverLocation.observe(this) {
            val points =
                this.viewModel.currentOrder.value?.value?.points?.map { point -> point.point.toLatLng() }
                    ?.plus(it) ?: listOf(it)
            if (driverMarker == null) {
                driverMarker = gMap!!.addMarker(
                    MarkerOptions().position(it)
                        .icon(BitmapDescriptorFactory.fromResource(R.drawable.marker_taxi))
                )
            } else {
                driverMarker!!.position = it
            }
            centerLatLngsInMap(gMap!!, points, true)
        }
        this.viewModel.unreadMessages.observe(this) {
            MediaPlayer.create(this@TravelActivity, R.raw.notification).start()
            Snackbar.make(
                binding.root,
                R.string.notification_new_message_title,
                Snackbar.LENGTH_LONG
            ).setAction(getString(R.string.action_reply)) {
                val intent = Intent(this@TravelActivity, ChatActivity::class.java)
                startActivity(intent)
            }.show()
        }
        this.viewModel.currentOrder.observe(this) {
            when (it) {
                is ViewState.Error -> finish()
                is ViewState.Loading -> LoadingDialog.display(this)
                is ViewState.Success -> {
                    LoadingDialog.hide()
                    val order = it.value ?: throw Exception("Can't get the order")
                    travelTabsViewPagerAdapter = TravelTabsViewPagerAdapter(
                        supportFragmentManager,
                        this@TravelActivity,
                        order
                    )
                    binding.viewpager.adapter = travelTabsViewPagerAdapter
                    binding.tabLayout.setupWithViewPager(binding.viewpager)
                    when (order.status) {
                        OrderStatus.DriverAccepted, OrderStatus.Started -> {
                            pointMarkers.forEach { marker -> marker.remove() }
                            pointMarkers = ArrayList()
                            for (id in order.points.indices) {
                                val marker = gMap!!.addMarker(
                                    MarkerOptions()
                                        .position(
                                            LatLng(
                                                order.points[id].point.lat,
                                                order.points[id].point.lng
                                            )
                                        )
                                        .icon(BitmapDescriptorFactory.fromResource(if (id == 0) R.drawable.marker_pickup else R.drawable.marker_destination))
                                )
                                (pointMarkers as ArrayList<Marker>).add(marker!!)
                            }
                            var points = order.points.map { point -> point.point.toLatLng() }
                            this.viewModel.driverLocation.value?.let { location ->
                                points = points.plus(location)
                                if (driverMarker == null) {
                                    driverMarker = gMap!!.addMarker(
                                        MarkerOptions().position(location)
                                            .icon(BitmapDescriptorFactory.fromResource(R.drawable.marker_taxi))
                                    )
                                } else {
                                    driverMarker!!.position = location
                                }
                            }
                            centerLatLngsInMap(gMap!!, points, true)
                            if (order.status == OrderStatus.Started) {
                                TransitionManager.beginDelayedTransition((binding.root as ViewGroup))
                                binding.slideCall.visibility = View.GONE
                                binding.chatButton.visibility = View.GONE
                                binding.slideCancel.visibility = View.GONE
                            }
                        }

                        OrderStatus.Arrived -> {
                            showInfo(this, getString(R.string.message_driver_arrived))
                        }

                        OrderStatus.DriverCanceled, OrderStatus.RiderCanceled -> show(
                            this@TravelActivity,
                            getString(R.string.service_canceled),
                            AlertDialogBuilder.DialogButton.OK,
                            AlertDialogEvent { finish() })

                        OrderStatus.WaitingForPostPay -> {
                            if (order.service.paymentMethod != ServicePaymentMethod.OnlyCash) {
                                val intent = Intent(this, ChargeAccountActivity::class.java)
                                intent.putExtra("defaultAmount", order.costAfterCoupon)
                                intent.putExtra("currency", order.currency)
                                startActivity(intent)
                            } else {
                                MaterialAlertDialogBuilder(this)
                                    .setTitle(R.string.message_rider_finished_title)
                                    .setMessage(R.string.message_finished_rider_content_pay_in_cash)
                                    .setPositiveButton(R.string.notification_finished_action) { _, _ ->
                                        this.viewModel.getCurrentOrder()
                                    }
                                    .show()
                            }
                        }

                        OrderStatus.WaitingForReview -> {
                            if (supportFragmentManager.findFragmentByTag("fragment_review_travel") == null) {
                                val reviewDialog: ReviewDialog = ReviewDialog.newInstance()
                                reviewDialog.isCancelable = false
                                reviewDialog.show(supportFragmentManager, "fragment_review_travel")
                            }
                        }

                        else -> {
                            finish()
                        }
                    }
                }
            }
        }
    }

    override fun onResume() {
        super.onResume()
        if (gMap != null) {
            this.viewModel.getCurrentOrder()
        }
    }

    fun onChargeAccountClicked() {
        val order = this.viewModel.currentOrder.value?.value ?: return
        val intent = Intent(this@TravelActivity, ChargeAccountActivity::class.java)
        intent.putExtra("defaultAmount", order.costAfterCoupon)
        intent.putExtra("currency", order.currency)
        startActivity(intent)
    }

    fun onApplyCouponClicked() {
        val container = LinearLayout(this)
        container.orientation = LinearLayout.VERTICAL
        val lp = LinearLayout.LayoutParams(
            LinearLayout.LayoutParams.MATCH_PARENT,
            LinearLayout.LayoutParams.WRAP_CONTENT
        )
        lp.setMargins(48, 0, 48, 0)
        val input = EditText(this)
        input.layoutParams = lp
        input.gravity = Gravity.TOP or Gravity.START
        input.inputType = InputType.TYPE_CLASS_TEXT
        input.setLines(1)
        input.maxLines = 1
        container.addView(input, lp)
        MaterialAlertDialogBuilder(this)
            .setTitle(R.string.coupon_dialog_title)
            .setMessage(R.string.coupon_dialog_message)
            .setView(container).setPositiveButton(R.string.alert_ok) { _, _ ->
                viewModel.applyCoupon(input.text.toString())
            }.setNegativeButton(R.string.alert_cancel) { _, _ -> }.show()
    }

    override fun onBackPressed() {}

    override fun onMapReady(googleMap: GoogleMap) {
        gMap = googleMap
        googleMap.isTrafficEnabled = true
        googleMap.setMaxZoomPreference(17f)
        this.viewModel.getCurrentOrder()
    }

    private fun callDriver() {
        val order = this.viewModel.currentOrder.value?.value ?: return
        if (ContextCompat.checkSelfPermission(
                this,
                CALL_PHONE
            ) == PackageManager.PERMISSION_GRANTED
        ) {
            val intent = Intent(Intent.ACTION_CALL)
            intent.data = Uri.parse("tel:+" + order.driver!!.mobileNumber)
            intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
            startActivity(intent)
        } else {
            ActivityCompat.requestPermissions(
                this,
                arrayOf(CALL_PHONE),
                permissionPhoneCallRequestCode
            )
        }
    }

    override fun onRequestPermissionsResult(
        requestCode: Int,
        permissions: Array<out String>,
        grantResults: IntArray
    ) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
        if (requestCode == permissionPhoneCallRequestCode) {
            if (!grantResults.contains(-1)) {
                callDriver()
            }
        }
    }
}