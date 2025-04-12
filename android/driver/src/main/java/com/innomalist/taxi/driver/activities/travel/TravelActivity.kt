package com.innomalist.taxi.driver.activities.travel

import android.Manifest
import android.content.Context
import android.content.DialogInterface
import android.content.Intent
import android.content.pm.PackageManager
import android.location.Location
import android.location.LocationListener
import android.location.LocationManager
import android.net.Uri
import android.os.Bundle
import android.view.View
import android.view.ViewGroup
import android.view.WindowManager
import androidx.activity.viewModels
import androidx.appcompat.app.AlertDialog
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import androidx.databinding.DataBindingUtil
import androidx.transition.TransitionManager
import com.google.android.gms.maps.CameraUpdateFactory
import com.google.android.gms.maps.GoogleMap
import com.google.android.gms.maps.OnMapReadyCallback
import com.google.android.gms.maps.SupportMapFragment
import com.google.android.gms.maps.model.BitmapDescriptorFactory
import com.google.android.gms.maps.model.LatLng
import com.google.android.gms.maps.model.Marker
import com.google.android.gms.maps.model.MarkerOptions
import com.google.android.material.dialog.MaterialAlertDialogBuilder
import com.google.android.material.textfield.TextInputEditText
import com.innomalist.taxi.common.ViewState
import com.innomalist.taxi.driver.activities.chat.ChatActivity
import com.innomalist.taxi.common.components.BaseActivity
import com.innomalist.taxi.common.interfaces.AlertDialogEvent
import com.innomalist.taxi.common.location.MapHelper.centerLatLngsInMap
import com.innomalist.taxi.common.utils.AlertDialogBuilder
import com.innomalist.taxi.common.utils.AlertDialogBuilder.show
import com.innomalist.taxi.common.utils.AlerterHelper
import com.innomalist.taxi.common.utils.DistanceFormatter
import com.innomalist.taxi.common.utils.LoadingDialog
import com.innomalist.taxi.common.utils.LocationHelper.Companion.distFrom
import com.innomalist.taxi.driver.R
import com.innomalist.taxi.driver.activities.waitingForPayment.WaitingForPaymentActivity
import com.innomalist.taxi.driver.databinding.ActivityTravelBinding
import com.minimal.taxi.driver.type.OrderStatus
import dagger.hilt.android.AndroidEntryPoint
import java.text.NumberFormat
import java.util.*
import kotlin.collections.ArrayList

@AndroidEntryPoint
class TravelActivity : BaseActivity(), OnMapReadyCallback, LocationListener {
    lateinit var binding: ActivityTravelBinding
    private val viewModel: TravelActivityViewModel by viewModels()
    private var gMap: GoogleMap? = null
    private var currentLocation: LatLng? = null
    private var pointMarkers: MutableList<Marker> = ArrayList()
    private lateinit var locationManager: LocationManager
    private val permissionPhoneCallRequestCode = 400

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = DataBindingUtil.setContentView(this, R.layout.activity_travel)
        locationManager = getSystemService(Context.LOCATION_SERVICE) as LocationManager
        val mapFragment = (supportFragmentManager.findFragmentById(R.id.map) as SupportMapFragment?)!!
        mapFragment.getMapAsync(this)
        window.addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON)
        listenLiveData()
        binding.slideStart.setOnSlideCompleteListener { this.viewModel.updateOrderStatus(OrderStatus.Started) }
        binding.slideFinish.setOnSlideCompleteListener {
            this.viewModel.updateOrderStatus(
                OrderStatus.Finished
            )
        }
        binding.slideCall.setOnSlideCompleteListener { callRider() }
        binding.slideArrived.setOnSlideCompleteListener {
            this.viewModel.updateOrderStatus(
                OrderStatus.Arrived
            )
        }
        binding.chatButton.setOnClickListener { onChatButtonClicked() }
        binding.slideCancel.setOnSlideCompleteListener {
            this.viewModel.updateOrderStatus(
                OrderStatus.DriverCanceled
            )
        }
        Timer().schedule(object : TimerTask() {
            override fun run() {
                runOnUiThread {
                    //val request = viewModel.currentOrder.value?.value
                    // TODO: Show a better timing
//                    val timeStamp = if (request!!.status == OrderStatus.DriverAccepted) (request.etaPickup
//                            ?: 0) else "-"
//                    val seconds = (timeStamp - Date().time) / 1000
//                    if (seconds <= 0) binding.etaText.setText(R.string.eta_soon) else binding.etaText.text = String.format(Locale.getDefault(), "%02d:%02d", seconds / 60, seconds % 60)
                }
            }
        }, 0, 1000)
    }

    private fun listenLiveData() {
        this.viewModel.currentOrder.observe(this) {
            when (it) {
                is ViewState.Error -> {
                    LoadingDialog.hide()
                    finish()
                }
                is ViewState.Loading -> LoadingDialog.display(this)
                is ViewState.Success -> {
                    LoadingDialog.hide()
                    val order = it.value
                    if (order == null) {
                        finish()
                        return@observe
                    }
                    val format: NumberFormat = NumberFormat.getCurrencyInstance()
                    format.currency = Currency.getInstance(order.currency)
                    binding.costText.text = format.format(order.costAfterCoupon)
                    when (it.value!!.status) {
                        OrderStatus.DriverAccepted -> {
                            pointMarkers.forEach { marker -> marker.remove() }
                            val pickupLatLng = LatLng(
                                it.value!!.points[0].point.lat,
                                it.value!!.points[0].point.lng
                            )
                            val marker = gMap!!.addMarker(
                                MarkerOptions()
                                    .position(pickupLatLng)
                                    .icon(BitmapDescriptorFactory.fromResource(R.drawable.marker_pickup))
                            )
                            pointMarkers.add(marker!!)
                            if (currentLocation == null) gMap!!.animateCamera(
                                CameraUpdateFactory.newLatLngZoom(
                                    pickupLatLng,
                                    16f
                                )
                            ) else {
                                val locations: MutableList<LatLng> = ArrayList()
                                locations.add(pickupLatLng)
                                locations.add(currentLocation!!)
                                centerLatLngsInMap(gMap!!, locations, true)
                            }
                        }
                        OrderStatus.DriverCanceled, OrderStatus.RiderCanceled -> show(
                            this@TravelActivity,
                            getString(R.string.service_canceled),
                            AlertDialogBuilder.DialogButton.OK,
                            AlertDialogEvent { finish() })
                        OrderStatus.Started -> {
                            pointMarkers.forEach { marker -> marker.remove() }
                            it.value!!.points.indices.drop(1).forEach { index ->
                                pointMarkers.add(
                                    gMap!!.addMarker(
                                        MarkerOptions()
                                            .position(
                                                LatLng(
                                                    it.value!!.points[index].point.lat,
                                                    it.value!!.points[index].point.lng
                                                )
                                            )
                                            .icon(BitmapDescriptorFactory.fromResource(R.drawable.marker_destination))
                                    )!!
                                )
                            }
                            val positions = ArrayList<LatLng>()
                            for (marker in pointMarkers)
                                positions.add((marker.position))
                            currentLocation?.let { location -> positions.add(location) }
                            centerLatLngsInMap(gMap!!, positions, true)
                            TransitionManager.beginDelayedTransition((binding.root as ViewGroup))
                            binding.slideStart.visibility = View.GONE
                            binding.slideArrived.visibility = View.GONE
                            binding.slideCancel.visibility = View.GONE
                            binding.slideFinish.visibility = View.VISIBLE
                            binding.contactPanel.visibility = View.GONE
                            binding.chatButton.visibility = View.GONE
                        }
                        OrderStatus.WaitingForPostPay -> {
                            val intent = Intent(this, WaitingForPaymentActivity::class.java)
                            startActivity(intent)
                        }
                        OrderStatus.Finished, OrderStatus.WaitingForReview -> {
                            finish()
                        }
                        OrderStatus.Requested, OrderStatus.NotFound, OrderStatus.NoCloseFound, OrderStatus.Found, OrderStatus.Expired -> {
                            AlerterHelper.showError(
                                this,
                                "An unknown Trip status: ${it.value?.status?.rawValue ?: ""}"
                            )
                        }
                        OrderStatus.Arrived -> {
                            binding.slideStart.visibility = View.VISIBLE
                            binding.slideCancel.visibility = View.VISIBLE
                            binding.slideFinish.visibility = View.GONE
                            binding.slideArrived.visibility = View.GONE
                        }
                        OrderStatus.WaitingForPrePay -> {}
                        OrderStatus.Booked -> finish()
                        is OrderStatus.UNKNOWN__ -> finish()
                    }
                }
            }
        }
    }

    override fun onBackPressed() {}

    override fun onResume() {
        super.onResume()
        if (ActivityCompat.checkSelfPermission(
                this,
                Manifest.permission.ACCESS_FINE_LOCATION
            ) == PackageManager.PERMISSION_GRANTED || ActivityCompat.checkSelfPermission(
                this,
                Manifest.permission.ACCESS_COARSE_LOCATION
            ) == PackageManager.PERMISSION_GRANTED
        ) {
            locationManager.requestLocationUpdates(LocationManager.GPS_PROVIDER, 5000, 20f, this)
        }
        //TODO: Show message when new one arrives
//        SocketNetworkDispatcher.instance.onNewMessage = {
//            MediaPlayer.create(this@TravelActivity, R.raw.notification).start()
//            Snackbar.make(binding.root, it.content, Snackbar.LENGTH_SHORT).setAction(getString(R.string.action_reply)) {
//                val intent = Intent(this@TravelActivity, ChatActivity::class.java)
//                intent.putExtra("app", "driver")
//                startActivity(intent)
//            }.show()
//        }
        this.viewModel.syncCurrentOrder()

    }

    override fun onPause() {
        locationManager.removeUpdates(this)
        super.onPause()
    }

    override fun onMapReady(googleMap: GoogleMap) {
        gMap = googleMap
        if (ActivityCompat.checkSelfPermission(
                this,
                Manifest.permission.ACCESS_FINE_LOCATION
            ) != PackageManager.PERMISSION_GRANTED && ActivityCompat.checkSelfPermission(
                this,
                Manifest.permission.ACCESS_COARSE_LOCATION
            ) != PackageManager.PERMISSION_GRANTED
        ) {
            return
        }
        googleMap.isMyLocationEnabled = true
        googleMap.isTrafficEnabled = true
    }

    override fun onLocationChanged(location: Location) {
        val latLng = LatLng(location.latitude, location.longitude)
        this.viewModel.updateDriverLocation(latLng)
        currentLocation = LatLng(location.latitude, location.longitude)
        val request = this.viewModel.currentOrder.value?.value ?: return
        val destination: LatLng =
            if (request.status == OrderStatus.DriverAccepted || request.points.count() < 2) LatLng(
                request.points[0].point.lat,
                request.points[0].point.lng
            ) else LatLng(request.points[1].point.lat, request.points[1].point.lng)
        val distance = distFrom(latLng, destination)
        binding.distanceText.text = DistanceFormatter.format(distance)
    }

    override fun onProviderDisabled(provider: String) {}
    override fun onProviderEnabled(provider: String) {}
    override fun onStatusChanged(provider: String, status: Int, extras: Bundle) {}

    private fun showConfirmationDialog(path: String) {
        val builder = MaterialAlertDialogBuilder(this)
            .setTitle(getString(R.string.delivery_verify_code_title))
            .setMessage(getString(R.string.delivery_verify_code_message))
            .setView(R.layout.dialog_input)
            .setPositiveButton(R.string.alert_ok) { dialog: DialogInterface, _: Int ->
                val dlg = dialog as AlertDialog
                val txt = dlg.findViewById<TextInputEditText>(R.id.text1)
            }
        builder.show()
    }

    private fun callRider() {
        if (ContextCompat.checkSelfPermission(
                this,
                Manifest.permission.CALL_PHONE
            ) == PackageManager.PERMISSION_GRANTED
        ) {
            val intent = Intent(Intent.ACTION_CALL)
            intent.data =
                Uri.parse("tel:+" + viewModel.currentOrder.value?.value?.rider?.mobileNumber)
            intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
            startActivity(intent)
        } else {
            ActivityCompat.requestPermissions(
                this,
                arrayOf(Manifest.permission.CALL_PHONE),
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
                callRider()
            }
        }
    }

    private fun onChatButtonClicked() {
        val intent = Intent(this@TravelActivity, ChatActivity::class.java)
        intent.putExtra("app", "driver")
        startActivity(intent)
    }
}