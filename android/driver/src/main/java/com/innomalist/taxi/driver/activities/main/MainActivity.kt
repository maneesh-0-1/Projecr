package com.innomalist.taxi.driver.activities.main

import android.Manifest
import android.annotation.SuppressLint
import android.app.NotificationChannel
import android.app.NotificationManager
import android.content.Context
import android.content.DialogInterface
import android.content.Intent
import android.content.pm.PackageManager
import android.location.Location
import android.location.LocationListener
import android.location.LocationManager
import android.media.AudioAttributes
import android.media.MediaPlayer
import android.net.Uri
import android.os.Build
import android.os.Bundle
import android.provider.Settings
import android.util.Log
import android.util.TypedValue
import android.view.MenuItem
import android.view.View
import android.view.WindowManager
import android.widget.ImageView
import android.widget.TextView
import android.widget.Toast
import androidx.activity.viewModels
import androidx.core.app.ActivityCompat
import androidx.core.view.GravityCompat
import androidx.databinding.DataBindingUtil
import com.bumptech.glide.Glide
import com.google.android.gms.maps.CameraUpdateFactory
import com.google.android.gms.maps.GoogleMap
import com.google.android.gms.maps.OnMapReadyCallback
import com.google.android.gms.maps.SupportMapFragment
import com.google.android.gms.maps.model.*
import com.google.android.material.dialog.MaterialAlertDialogBuilder
import com.google.firebase.messaging.FirebaseMessaging
import com.innomalist.taxi.driver.Config
import com.innomalist.taxi.common.ViewState
import com.innomalist.taxi.driver.activities.chargeAccount.ChargeAccountActivity
import com.innomalist.taxi.driver.activities.transactions.TransactionsActivity
import com.innomalist.taxi.common.components.BaseActivity
import com.innomalist.taxi.common.utils.AlertDialogBuilder
import com.innomalist.taxi.common.utils.AlerterHelper
import com.innomalist.taxi.common.utils.CommonUtils
import com.innomalist.taxi.driver.R
import com.innomalist.taxi.driver.activities.about.AboutActivity
import com.innomalist.taxi.driver.activities.main.adapters.RequestsFragmentPagerAdapter
import com.innomalist.taxi.driver.activities.profile.ProfileActivity
import com.innomalist.taxi.driver.activities.statistics.StatisticsActivity
import com.innomalist.taxi.driver.activities.travel.TravelActivity
import com.innomalist.taxi.driver.activities.travels.TravelsActivity
import com.innomalist.taxi.driver.databinding.ActivityMainBinding
import com.minimal.taxi.driver.type.DriverStatus
import dagger.hilt.android.AndroidEntryPoint

enum class LocationState {
    OK,
    LocationDisabled,
    PermissionNotAsked,
    PermissionDenied
}

@AndroidEntryPoint
class MainActivity : BaseActivity(), OnMapReadyCallback, LocationListener {
    private val viewModel: MainActivityViewModel by viewModels()
    private var mMap: GoogleMap? = null
    private var markersLocations: List<Marker> = listOf()
    private lateinit var binding: ActivityMainBinding
    private lateinit var requestCardsAdapter: RequestsFragmentPagerAdapter
    private var mapFragment: SupportMapFragment? = null
    private val requestLocationCode = 432
    private var currentLocation: LatLng? = null

    @SuppressLint("CheckResult")
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = DataBindingUtil.setContentView(this@MainActivity, R.layout.activity_main)
        createNotificationChannels()
        listenLiveData()
        mapFragment = supportFragmentManager.findFragmentById(R.id.map) as SupportMapFragment
        window.addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON)
        binding.buttonEnableLocation.setOnClickListener { startActivity(Intent(Settings.ACTION_LOCATION_SOURCE_SETTINGS)) }
        binding.buttonEnablePermission.setOnClickListener {
            val permissions = arrayOf(Manifest.permission.ACCESS_COARSE_LOCATION, Manifest.permission.ACCESS_FINE_LOCATION)
            /*if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                permissions = permissions.plus(Manifest.permission.ACCESS_BACKGROUND_LOCATION)
            }*/
            MaterialAlertDialogBuilder(this@MainActivity)
                    .setTitle(R.string.message_gps_title)
                    .setMessage(getString(R.string.message_driver_location_permission))
                    .setPositiveButton(R.string.alert_ok) { _, _ ->
                        ActivityCompat.requestPermissions(this@MainActivity, permissions, requestLocationCode)
                    }
                    .setNegativeButton(R.string.alert_cancel) { _, _ ->

                    }
                    .show()
            return@setOnClickListener
        }
        binding.buttonOpenLocationSettings.setOnClickListener { startActivity(Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS, Uri.parse("package:$packageName"))) }
        setSupportActionBar(binding.appbar)
        val actionBar = supportActionBar
        val value = TypedValue()
        theme.resolveAttribute(R.attr.colorPrimary, value, true)
        window.navigationBarColor = value.data
        if (actionBar != null) {
            actionBar.setHomeAsUpIndicator(R.drawable.menu)
            actionBar.setDisplayHomeAsUpEnabled(true)
        }
        binding.navigationView.setNavigationItemSelectedListener { menuItem: MenuItem ->
            binding.drawerLayout.closeDrawers()
            when (menuItem.itemId) {
                R.id.nav_item_travels -> startActivity(Intent(this@MainActivity, TravelsActivity::class.java))
                R.id.nav_item_statistics -> startActivity(Intent(this@MainActivity, StatisticsActivity::class.java))
                R.id.nav_item_charge_account -> startActivity(Intent(this@MainActivity, ChargeAccountActivity::class.java))
                R.id.nav_item_transactions -> startActivity(Intent(this@MainActivity, TransactionsActivity::class.java))
                R.id.nav_item_about -> startActivity(Intent(this@MainActivity, AboutActivity::class.java))
                R.id.nav_item_exit -> logout()
                else -> Toast.makeText(this@MainActivity, menuItem.title, Toast.LENGTH_SHORT).show()
            }
            true
        }
        binding.switchConnection.setOnClickListener { switchClicked() }
    }

    private fun listenLiveData() {
        this.viewModel.newRequestReceived.observe(this) {
            MediaPlayer.create(this, R.raw.notification).start()
        }
        this.viewModel.acceptOrderResult.observe(this) {
            when(it) {
                is ViewState.Error -> {
                    AlerterHelper.showError(this, it.message)
                }

                is ViewState.Loading -> {}
                is ViewState.Success -> {
                    removeMarkers()
                }
            }
        }
        this.viewModel.profile.observe(this) {
            when(it) {
                is ViewState.Error -> {

                }
                is ViewState.Loading -> {

                }
                is ViewState.Success -> {
                    val user = it.value ?: throw Exception("User not available")
                    val status = it.value?.status ?: throw Exception("Status not available")
                    val name: String = if ((user.firstName.isNullOrEmpty()) && (user.lastName.isNullOrEmpty())) user.mobileNumber else user.firstName + " " + user.lastName
                    val header = binding.navigationView.getHeaderView(0)
                    (header.findViewById<View>(R.id.navigation_header_name) as TextView).text = name
                    (header.findViewById<View>(R.id.navigation_header_charge) as TextView).text =
                        user.mobileNumber
                    val imageView = header.findViewById<ImageView>(R.id.navigation_header_image)
                    if(user.media != null)
                        Glide.with(this).load(Config.Backend + user.media.address).into(imageView)
                    when(status) {
                        DriverStatus.Blocked, DriverStatus.HardReject -> {
                            MaterialAlertDialogBuilder(this)
                                .setTitle(R.string.error)
                                .setMessage("Your access to application has been denied.")
                                .setPositiveButton(R.string.alert_ok) { _: DialogInterface?, _: Int -> finish() }
                                .show()
                        }
                        DriverStatus.Offline, DriverStatus.Online, DriverStatus.InService -> {

                        }
                        is DriverStatus.UNKNOWN__ -> {
                            AlerterHelper.showError(this, "Unknown status. Make sure your app is updated to latest version from store.")
                        }
                        DriverStatus.WaitingDocuments, DriverStatus.SoftReject, DriverStatus.PendingApproval -> {
                            startActivity(Intent(this, ProfileActivity::class.java))
                        }
                    }
                }
            }
        }
        this.viewModel.currentOrder.observe(this) {
            when(it) {
                is ViewState.Error -> {
                    logout()
                }
                is ViewState.Success -> {
                    if (it.value != null) {
                        val intent = Intent(this@MainActivity, TravelActivity::class.java)
                        startActivity(intent)
                    }
                }
                is ViewState.Loading -> {}
            }

        }
        this.viewModel.availableOrders.observe(this) {
            when(it) {
                is ViewState.Error -> {
                    binding.switchConnection.isChecked = false
                }
                is ViewState.Loading -> {}
                is ViewState.Success -> {
                    val orders = it.value ?: listOf()
                    binding.switchConnection.isChecked = true
                    requestCardsAdapter = RequestsFragmentPagerAdapter(supportFragmentManager, orders)
                    binding.requestsViewPager.adapter = requestCardsAdapter
                    binding.requestsViewPager.offscreenPageLimit = 3
                }
            }
        }
    }

    @SuppressLint("MissingPermission")
    override fun onMapReady(googleMap: GoogleMap) {
        mMap = googleMap
        mMap!!.uiSettings.isMapToolbarEnabled = false
        mMap!!.isMyLocationEnabled = true
        mMap!!.uiSettings.isMyLocationButtonEnabled = true
        val locationManager = (this.getSystemService(Context.LOCATION_SERVICE) as LocationManager)
        locationManager.requestLocationUpdates(LocationManager.GPS_PROVIDER, 5000, 5f, this)
        getLastKnownLocation()
        if (resources.getBoolean(R.bool.isNightMode)) {
            val success = mMap!!.setMapStyle(
                    MapStyleOptions.loadRawResourceStyle(
                            this, R.raw.map_night))
            if (!success) Log.e("MapsActivityRaw", "Style parsing failed.")
        }
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        when (item.itemId) {
            android.R.id.home -> binding.drawerLayout.openDrawer(GravityCompat.START)
        }
        return super.onOptionsItemSelected(item)
    }

    override fun onRequestPermissionsResult(requestCode: Int, permissions: Array<out String>, grantResults: IntArray) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
        checkPermissions()
    }

    override fun onResume() {
        super.onResume()
        checkPermissions()
    }

    private fun checkPermissions() {
        if (!CommonUtils.isGPSEnabled(this@MainActivity)) {
            binding.locationState = LocationState.LocationDisabled
            return
        }
        if (ActivityCompat.checkSelfPermission(this@MainActivity, Manifest.permission.ACCESS_COARSE_LOCATION) == PackageManager.PERMISSION_GRANTED) {
            binding.locationState = LocationState.OK
            runOnUiThread {
                mapFragment!!.getMapAsync(this)
            }
            this.viewModel.syncUserAndCurrentOrder()
            return
        }
        binding.locationState = LocationState.PermissionNotAsked
    }

    private fun switchClicked() {
        if (binding.switchConnection.isChecked && this.currentLocation == null) {
            AlertDialogBuilder.show(this@MainActivity, "Your exact current location is yet to be determined. Please try again after a few seconds.", AlertDialogBuilder.DialogButton.OK, null)
            binding.switchConnection.isChecked = false
            return
        }
        FirebaseMessaging.getInstance().token.addOnCompleteListener {
            this.viewModel.updateDriverStatus(if(binding.switchConnection.isChecked) DriverStatus.Online else DriverStatus.Offline, it.result, location = this.currentLocation)
        }

    }

    private fun getLastKnownLocation() {
        if (ActivityCompat.checkSelfPermission(this@MainActivity, Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED && ActivityCompat.checkSelfPermission(this@MainActivity, Manifest.permission.ACCESS_COARSE_LOCATION) != PackageManager.PERMISSION_GRANTED) {
            return
        }
        val manager = applicationContext.getSystemService(Context.LOCATION_SERVICE) as LocationManager
        val providers: List<String> = manager.getProviders(true)
        var bestLocation: Location? = null
        for (provider in providers) {
            val l = manager.getLastKnownLocation(provider) ?: continue
            if (bestLocation == null || l.accuracy < bestLocation.accuracy) {
                bestLocation = l
            }
        }
        if(bestLocation == null)
            return
        currentLocation = LatLng(bestLocation.latitude, bestLocation.longitude)
        if (binding.switchConnection.isChecked) {
            viewModel.updateDriverLocation(currentLocation!!)
        }
        mMap!!.animateCamera(CameraUpdateFactory.newLatLngZoom(currentLocation!!, 16f))
    }

    private fun logout() {
        preferences.clearPreferences()
        finish()
    }

    override fun onLocationChanged(location: Location) {
        if (binding.switchConnection.isChecked) {
            val latLng = LatLng(location.latitude, location.longitude)
            this.viewModel.updateDriverLocation(latLng)
            val cameraUpdate = CameraUpdateFactory.newLatLngZoom(latLng, if (mMap!!.cameraPosition.zoom > 5) mMap!!.cameraPosition.zoom else 16f)
            mMap!!.animateCamera(cameraUpdate)
        }
    }

    override fun onStatusChanged(s: String, i: Int, bundle: Bundle) {}
    override fun onProviderEnabled(s: String) {}
    override fun onProviderDisabled(s: String) {}

    private fun createNotificationChannels() {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.O) {
            return
        }
        val sound = Uri.parse("android.resource://" + applicationContext.packageName + "/" + R.raw.notification)

        val notificationManager = applicationContext.getSystemService(NOTIFICATION_SERVICE) as NotificationManager

        NotificationChannel("request", "Requests", NotificationManager.IMPORTANCE_HIGH).let {
            it.enableLights(true)
            it.description = "New trip requests notification"
            val audioAttributes = AudioAttributes.Builder()
                    .setContentType(AudioAttributes.CONTENT_TYPE_SONIFICATION)
                    .setUsage(AudioAttributes.USAGE_NOTIFICATION)
                    .build()
            it.setSound(sound, audioAttributes)
            notificationManager.createNotificationChannel(it)
        }

        NotificationChannel("message", "Message", NotificationManager.IMPORTANCE_HIGH).let {
            it.enableLights(true)
            it.description = "In-App Chat messages"
            val audioAttributes = AudioAttributes.Builder()
                    .setContentType(AudioAttributes.CONTENT_TYPE_SONIFICATION)
                    .setUsage(AudioAttributes.USAGE_ALARM)
                    .build()
            it.setSound(sound, audioAttributes)
            notificationManager.createNotificationChannel(it)
        }

        NotificationChannel("paid", "Payment", NotificationManager.IMPORTANCE_HIGH).let {
            it.enableLights(true)
            it.description = "Service Payment notification"
            val audioAttributes = AudioAttributes.Builder()
                    .setContentType(AudioAttributes.CONTENT_TYPE_SONIFICATION)
                    .setUsage(AudioAttributes.USAGE_ALARM)
                    .build()
            it.setSound(sound, audioAttributes)
            notificationManager.createNotificationChannel(it)
        }
    }

    private fun removeMarkers() {
        markersLocations.forEach {
            it.remove()
        }
        markersLocations = listOf()
        mMap!!.setPadding(0, 0, 0, 0)
    }
}