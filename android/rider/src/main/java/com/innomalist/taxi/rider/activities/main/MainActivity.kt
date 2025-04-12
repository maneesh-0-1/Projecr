package com.innomalist.taxi.rider.activities.main

import android.Manifest
import android.app.*
import android.content.ActivityNotFoundException
import android.content.DialogInterface
import android.content.Intent
import android.content.pm.PackageManager
import android.location.*
import android.media.AudioAttributes
import android.net.Uri
import android.os.Build
import android.os.Bundle
import android.provider.Settings
import android.speech.RecognizerIntent
import android.util.Log
import android.view.MenuItem
import android.view.View
import android.view.ViewGroup
import android.widget.*
import androidx.activity.result.ActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import androidx.activity.viewModels
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import androidx.core.view.GravityCompat
import androidx.databinding.DataBindingUtil
import androidx.drawerlayout.widget.DrawerLayout
import androidx.transition.Fade
import androidx.transition.Slide
import androidx.transition.TransitionManager
import androidx.transition.TransitionSet
import com.arlib.floatingsearchview.FloatingSearchView.OnLeftMenuClickListener
import com.bumptech.glide.Glide
import com.google.android.gms.location.LocationServices
import com.google.android.gms.maps.CameraUpdateFactory
import com.google.android.gms.maps.GoogleMap
import com.google.android.gms.maps.OnMapReadyCallback
import com.google.android.gms.maps.SupportMapFragment
import com.google.android.gms.maps.model.*
import com.google.android.libraries.places.api.model.Place
import com.google.android.libraries.places.widget.Autocomplete
import com.google.android.libraries.places.widget.AutocompleteActivity
import com.google.android.libraries.places.widget.model.AutocompleteActivityMode
import com.google.android.material.bottomsheet.BottomSheetBehavior
import com.google.android.material.dialog.MaterialAlertDialogBuilder
import com.google.maps.android.SphericalUtil
import com.innomalist.taxi.common.ViewState
import com.innomalist.taxi.common.addSystemWindowInsetToMargin
import com.innomalist.taxi.common.components.BaseActivity
import com.innomalist.taxi.common.interfaces.AlertDialogEvent
import com.innomalist.taxi.common.location.MapHelper.centerLatLngsInMap
import com.innomalist.taxi.common.utils.AlertDialogBuilder
import com.innomalist.taxi.common.utils.AlertDialogBuilder.DialogResult
import com.innomalist.taxi.common.utils.AlertDialogBuilder.show
import com.innomalist.taxi.common.utils.AlerterHelper
import com.innomalist.taxi.common.utils.AlerterHelper.showInfo
import com.innomalist.taxi.common.utils.AlerterHelper.showWarning
import com.innomalist.taxi.common.utils.CommonUtils
import com.innomalist.taxi.common.utils.LoadingDialog
import com.innomalist.taxi.common.utils.LocationHelper.Companion.distFrom
import com.innomalist.taxi.common.utils.LocationHelper.Companion.doubleArrayToLatLng
import com.innomalist.taxi.common.utils.LocationHelper.Companion.latLngToDoubleArray
import com.innomalist.taxi.rider.Config
import com.innomalist.taxi.rider.R
import com.innomalist.taxi.rider.activities.about.AboutActivity
import com.innomalist.taxi.rider.activities.addresses.AddressesActivity
import com.innomalist.taxi.rider.activities.chargeAccount.ChargeAccountActivity
import com.innomalist.taxi.rider.activities.looking.LookingActivity
import com.innomalist.taxi.rider.activities.main.adapters.ServiceCategoryViewPagerAdapter
import com.innomalist.taxi.rider.activities.main.fragments.ServiceCarousalFragment.OnServicesCarousalFragmentListener
import com.innomalist.taxi.rider.activities.profile.ProfileActivity
import com.innomalist.taxi.rider.activities.promotions.PromotionsActivity
import com.innomalist.taxi.rider.activities.transactions.TransactionsActivity
import com.innomalist.taxi.rider.activities.travel.TravelActivity
import com.innomalist.taxi.rider.activities.travels.TravelsActivity
import com.innomalist.taxi.rider.databinding.ActivityMainBinding
import com.minimal.taxi.rider.CalculateFareMutation
import com.minimal.taxi.rider.type.OrderStatus
import dagger.hilt.android.AndroidEntryPoint
import kotlinx.coroutines.*
import java.io.IOException
import java.text.SimpleDateFormat
import java.util.*
import kotlin.collections.ArrayList

@AndroidEntryPoint
class MainActivity : BaseActivity(), OnMapReadyCallback, OnServicesCarousalFragmentListener {
    lateinit var binding: ActivityMainBinding
    val viewModel: MainActivityViewModel by viewModels()
    private var mMap: GoogleMap? = null
    private var markers: ArrayList<Marker> = ArrayList()
    private var minutesFromNow = 0
    private var driverMarkers: ArrayList<Marker>? = null
    private var selectedService: CalculateFareMutation.Service1? = null
    private var selectedCurrency: String = ""
    private var serviceCategoryViewPagerAdapter: ServiceCategoryViewPagerAdapter? = null
    private lateinit var bottomSheetBehavior: BottomSheetBehavior<*>
    private var polylineOriginDestination: Polyline? = null
    private val requestRecordAudioPermission = 401
    private var selectedPoints: MutableList<LatLng> = mutableListOf()
    private var selectedAddresses: MutableList<String> = mutableListOf()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        createNotificationChannels()
        watchForViewModelChanges()
        binding = DataBindingUtil.setContentView(this@MainActivity, R.layout.activity_main)
        binding.searchPlace.addSystemWindowInsetToMargin(top = true)
        binding.buttonConfirmPickup.isEnabled = false
        binding.buttonConfirmPickup.setOnClickListener { onButtonConfirmPickupClicked() }
        binding.buttonConfirmDestination.setOnClickListener { onButtonFinalDestinationClicked() }
        binding.buttonAddDestination.setOnClickListener { onButtonAddDestinationClicked() }
        binding.buttonRequest.setOnClickListener { onButtonConfirmServiceClicked() }
        binding.buttonTime.setOnClickListener { onSelectTimeClicked() }
        bottomSheetBehavior = BottomSheetBehavior.from(binding.bottomSheet)
        bottomSheetBehavior.state = BottomSheetBehavior.STATE_COLLAPSED
        binding.searchText.isSelected = true
        binding.drawerLayout.addDrawerListener(object : DrawerLayout.DrawerListener {
            override fun onDrawerSlide(drawerView: View, slideOffset: Float) {}
            override fun onDrawerOpened(drawerView: View) {}
            override fun onDrawerClosed(drawerView: View) {
                binding.searchPlace.closeMenu(true)
            }

            override fun onDrawerStateChanged(newState: Int) {}
        })
        binding.searchPlace.setOnLeftMenuClickListener(object : OnLeftMenuClickListener {
            override fun onMenuOpened() {
                if (binding.buttonConfirmPickup.visibility == View.VISIBLE) binding.drawerLayout.openDrawer(
                    GravityCompat.START
                )
            }

            override fun onMenuClosed() {
                if (binding.buttonConfirmPickup.visibility == View.GONE) {
                    goBackFromServiceSelection()
                }
            }
        })
        binding.searchText.setOnClickListener { findPlace("") }
        binding.searchPlace.setSearchFocusable(false)
        binding.searchPlace.setOnMenuItemClickListener { item: MenuItem ->
            when (item.itemId) {
                R.id.action_favorites -> {
                    this.viewModel.getAddresses()
                }
                R.id.action_voice_rec -> displaySpeechRecognizer()
                R.id.action_location -> {
                    gotoCurrentLocation()
                }
            }
        }
        driverMarkers = ArrayList()
        val mapFragment =
            (supportFragmentManager.findFragmentById(R.id.map) as SupportMapFragment?)!!
        mapFragment.getMapAsync(this)

        val actionBar = supportActionBar
        if (actionBar != null) {
            actionBar.setHomeAsUpIndicator(R.drawable.menu)
            actionBar.setDisplayHomeAsUpEnabled(true)
            actionBar.title = getString(R.string.app_name)
        }
        this.viewModel.getCurrentOrder()
        this.viewModel.fetchProfile()
        binding.navigationView.setNavigationItemSelectedListener { menuItem: MenuItem ->
            binding.drawerLayout.closeDrawers()
            when (menuItem.itemId) {
                R.id.nav_item_favorites -> {
                    val intent = Intent(this@MainActivity, AddressesActivity::class.java)
                    if (mMap != null) {
                        val array = latLngToDoubleArray(mMap!!.cameraPosition.target)
                        intent.putExtra("currentLocation", array)
                    }
                    startActivity(intent)
                }
                R.id.nav_item_travels -> startActivity(
                    Intent(
                        this@MainActivity,
                        TravelsActivity::class.java
                    )
                )
                R.id.nav_item_promotions -> startActivity(
                    Intent(
                        this@MainActivity,
                        PromotionsActivity::class.java
                    )
                )
                R.id.nav_item_profile -> registerForProfileScreenResult.launch(
                    Intent(
                        this@MainActivity,
                        ProfileActivity::class.java
                    )
                )
                R.id.nav_item_charge_account -> registerForWalletScreenResult.launch(
                    Intent(
                        this@MainActivity,
                        ChargeAccountActivity::class.java
                    )
                )
                R.id.nav_item_transactions -> startActivity(
                    Intent(
                        this@MainActivity,
                        TransactionsActivity::class.java
                    )
                )
                R.id.nav_item_about -> startActivity(
                    Intent(
                        this@MainActivity,
                        AboutActivity::class.java
                    )
                )
                R.id.nav_item_exit -> show(
                    this@MainActivity,
                    getString(R.string.message_logout),
                    AlertDialogBuilder.DialogButton.OK_CANCEL,
                    AlertDialogEvent { result: DialogResult -> if (result == DialogResult.OK) logout() })
                else -> Toast.makeText(this@MainActivity, menuItem.title, Toast.LENGTH_SHORT).show()
            }
            true
        }

    }

    private val registerForGPSActivationSettingScreenResult =
        registerForActivityResult(ActivityResultContracts.StartActivityForResult()) {
            gotoCurrentLocation()
        }

    private val registerForLookingScreenResult =
        registerForActivityResult(ActivityResultContracts.StartActivityForResult()) { result: ActivityResult ->
            if (result.resultCode == RESULT_OK) {
                registerForTravelScreenResult.launch(
                    Intent(
                        this@MainActivity,
                        TravelActivity::class.java
                    )
                )
            } else {
                goBackFromServiceSelection()
            }
        }

    private val registerForTravelScreenResult =
        registerForActivityResult(ActivityResultContracts.StartActivityForResult()) {
            goBackFromServiceSelection()
        }

    private val registerForProfileScreenResult =
        registerForActivityResult(ActivityResultContracts.StartActivityForResult()) { result: ActivityResult ->
            if (result.resultCode == RESULT_OK) showInfo(
                this@MainActivity,
                getString(R.string.info_edit_profile_success)
            )
            this.viewModel.fetchProfile()
        }

    private val registerForWalletScreenResult =
        registerForActivityResult(ActivityResultContracts.StartActivityForResult()) { result: ActivityResult ->
            if (result.resultCode == RESULT_OK) showInfo(
                this@MainActivity,
                getString(R.string.account_charge_success)
            )
        }

    private val registerForPlacesScreenResult =
        registerForActivityResult(ActivityResultContracts.StartActivityForResult()) { result: ActivityResult ->
            binding.searchPlace.clearSearchFocus()
            if (result.resultCode == RESULT_OK) {
                val place = Autocomplete.getPlaceFromIntent(result.data!!)
                mMap!!.animateCamera(CameraUpdateFactory.newLatLng(place.latLng!!))
            } else if (result.resultCode == AutocompleteActivity.RESULT_ERROR) {
                val status = Autocomplete.getStatusFromIntent(result.data!!)
                Log.i("PLACES", status.statusMessage!!)
            }
        }

    private val registerForVoiceRecognitionScreenResult =
        registerForActivityResult(ActivityResultContracts.StartActivityForResult()) { result: ActivityResult ->
            if (result.resultCode == RESULT_OK) {
                val results: List<String> =
                    result.data!!.getStringArrayListExtra(RecognizerIntent.EXTRA_RESULTS)!!
                if (results.isNotEmpty()) findPlace(results[0]) else showWarning(
                    this,
                    getString(R.string.warning_voice_recognizer_failed)
                )
            }
        }

    private fun watchForViewModelChanges() {
        this.viewModel.driversLocation.observe(this) {
            when (it) {
                is ViewState.Loading -> {}
                is ViewState.Success -> {
                    for (marker in driverMarkers!!) {
                        marker.remove()
                    }
                    driverMarkers!!.removeAll { true }
                    val locations = it.value?.data?.getDriversLocation ?: return@observe
                    for (driverLocation in locations) driverMarkers!!.add(
                        mMap!!.addMarker(
                            MarkerOptions()
                                .position(LatLng(driverLocation.lat, driverLocation.lng))
                                .icon(BitmapDescriptorFactory.fromResource(R.drawable.marker_taxi))
                        )!!
                    )
                }
                is ViewState.Error -> {}
            }
        }
        this.viewModel.profile.observe(this) {
            val name: String =
                if (it.firstName.isNullOrEmpty() && it.lastName.isNullOrEmpty()) it.mobileNumber else "${it.firstName} ${it.lastName}"
            val header = binding.navigationView.getHeaderView(0)
            (header.findViewById<View>(R.id.navigation_header_name) as TextView).text = name
            (header.findViewById<View>(R.id.navigation_header_charge) as TextView).text =
                it.mobileNumber
            it.media?.let { media ->
                val imageView = header.findViewById<ImageView>(R.id.navigation_header_image)
                Glide.with(this).load(Config.Backend + media.address).into(imageView)
            }
        }
        this.viewModel.requestService.observe(this) {
            when (it) {
                is ViewState.Loading -> {
                    binding.buttonRequest.isEnabled = false
                }
                is ViewState.Success -> {
                    binding.buttonRequest.isEnabled = true
                    registerForLookingScreenResult.launch(
                        Intent(
                            this@MainActivity,
                            LookingActivity::class.java
                        )
                    )
                }
                is ViewState.Error -> {
                    binding.buttonRequest.isEnabled = true
                    //TODO: Open wallet if insufficient credit
                    AlerterHelper.showError(this, it.message)
//                    when (it.message) {
//                        ErrorStatus.CreditInsufficient -> {
//                            MaterialAlertDialogBuilder(this)
//                                .setTitle(R.string.message_default_title)
//                                .setMessage(R.string.socket_error_credit_insufficient)
//                                .setPositiveButton(R.string.open_wallet) { _: DialogInterface, _: Int ->
//                                    val intent = Intent(this, ChargeAccountActivity::class.java)
//                                    intent.putExtra("defaultAmount", ceil(selectedService!!.cost!!.toDouble()))
//                                    intent.putExtra("currency", selectedCurrency)
//                                    startActivity(intent)
//                                }
//                                .setNegativeButton(R.string.alert_cancel, null)
//                                .show()
//                        }
//
//                        else -> {
//                            it.error.showAlert(this@MainActivity)
//                        }
//                    }
                }
            }
        }
        this.viewModel.fareResult.observe(this) {
            when (it) {
                is ViewState.Error -> {
                    AlerterHelper.showError(this, it.message)
                    goBackFromServiceSelection()
                }
                is ViewState.Loading -> {}
                is ViewState.Success -> {
                    val fare = it.value?.data?.calculateFare ?: return@observe
                    minutesFromNow = 0
                    serviceCategoryViewPagerAdapter = ServiceCategoryViewPagerAdapter(
                        supportFragmentManager,
                        fare.services,
                        fare.currency
                    )
                    binding.serviceTypesViewPager.adapter = serviceCategoryViewPagerAdapter
                    binding.serviceTypesViewPager.measure(
                        LinearLayout.LayoutParams.MATCH_PARENT,
                        LinearLayout.LayoutParams.WRAP_CONTENT
                    )
                    mMap!!.setPadding(0, 100, 0, binding.bottomSheet.height - 30)
                    bottomSheetBehavior.state = BottomSheetBehavior.STATE_EXPANDED
                    centerLatLngsInMap(mMap!!, selectedPoints, true)
                    for (x in 1 until markers.size) {
                        showCurvedPolyline(selectedPoints[x - 1], selectedPoints[x])
                    }
                    binding.mapLayout.postDelayed({

                    }, 1500)
                    binding.tabCategories.setupWithViewPager(binding.serviceTypesViewPager)
                }
            }
        }

        this.viewModel.addresses.observe(this) {
            when (it) {
                is ViewState.Error -> {
                    AlerterHelper.showError(this, it.message)
                    goBackFromServiceSelection()
                }
                is ViewState.Loading -> {}
                is ViewState.Success -> {
                    if (it.value?.data?.riderAddresses?.isEmpty() != false) {
                        showWarning(
                            this@MainActivity,
                            getString(R.string.warning_no_favorite_place)
                        )
                        return@observe
                    }
                    val addresses = it.value?.data?.riderAddresses ?: return@observe
                    val addressStrings: Array<String> =
                        addresses.map { add -> add.title }.toTypedArray()
                    val builder = MaterialAlertDialogBuilder(this)
                        .setTitle("Locations")
                        .setSingleChoiceItems(
                            addressStrings,
                            -1
                        ) { _: DialogInterface?, which: Int ->
                            mMap!!.animateCamera(
                                CameraUpdateFactory.newLatLng(
                                    LatLng(
                                        addresses[which].location.lat,
                                        addresses[which].location.lng
                                    )
                                )
                            )
                            binding.searchText.text = addresses[which].details
                        }
                    builder.show()
                }
            }
        }

        this.viewModel.currentOrder.observe(this) {
            when (it) {
                is ViewState.Success -> {
                    LoadingDialog.hide()
                    val travel = it.value ?: return@observe
                    val notStartedStatusesArray: Array<OrderStatus> =
                        arrayOf(OrderStatus.Booked, OrderStatus.Found, OrderStatus.Requested, OrderStatus.NoCloseFound, OrderStatus.NotFound)
                    if (notStartedStatusesArray.contains(travel.status)) {
                        registerForLookingScreenResult.launch(
                            Intent(
                                this@MainActivity,
                                LookingActivity::class.java
                            )
                        )
                    } else {
                        registerForTravelScreenResult.launch(
                            Intent(
                                this@MainActivity,
                                TravelActivity::class.java
                            )
                        )
                    }
                }
                is ViewState.Error -> LoadingDialog.hide()
                is ViewState.Loading -> LoadingDialog.display(this)
            }
        }
    }

    private fun gotoCurrentLocation() {
        if (!CommonUtils.isGPSEnabled(this@MainActivity)) {
            MaterialAlertDialogBuilder(this@MainActivity)
                .setTitle(R.string.message_gps_title)
                .setMessage(R.string.message_gps_content)
                .setPositiveButton(R.string.action_open_settings) { _, _ ->
                    registerForGPSActivationSettingScreenResult.launch(
                        Intent(Settings.ACTION_LOCATION_SOURCE_SETTINGS)
                    )
                }
                .setNegativeButton(R.string.alert_cancel) { _, _ ->

                }
                .show()
            return
        }
        if (ContextCompat.checkSelfPermission(
                this,
                Manifest.permission.ACCESS_FINE_LOCATION
            ) != PackageManager.PERMISSION_GRANTED
        ) {
            val permissions = arrayOf(
                Manifest.permission.ACCESS_COARSE_LOCATION,
                Manifest.permission.ACCESS_FINE_LOCATION
            )
            ActivityCompat.requestPermissions(this@MainActivity, permissions, 543)
            return
        }
        mMap!!.isMyLocationEnabled = true
        mMap!!.uiSettings.isMyLocationButtonEnabled = false
        LocationServices.getFusedLocationProviderClient(this@MainActivity).lastLocation.addOnSuccessListener(
            this@MainActivity
        ) { location: Location? ->
            if (location != null) {
                mMap!!.animateCamera(
                    CameraUpdateFactory.newLatLngZoom(
                        LatLng(
                            location.latitude,
                            location.longitude
                        ), 16f
                    )
                )
            }
        }.addOnFailureListener {
        }
    }

    override fun onServiceSelected(service: CalculateFareMutation.Service1?, currency: String) {
        selectedService = service
        selectedCurrency = currency
        binding.buttonRequest.isEnabled = (service != null)
        binding.buttonTime.isEnabled = (service != null)
        if (service == null) return
        //binding.buttonTime.visibility = if (service.bookingMode == Service.BookingMode.OnlyNow) View.GONE else View.VISIBLE
    }

    private fun onSelectTimeClicked() {
        DatePickerDialog(
            this@MainActivity,
            { _, year, month, day ->
                TimePickerDialog(
                    this@MainActivity,
                    TimePickerDialog.OnTimeSetListener { _: TimePicker?, hourOfDay: Int, minute: Int ->
                        val date = Calendar.getInstance()
                        date.set(year, month, day, hourOfDay, minute)
                        val now = Calendar.getInstance()
                        val diff = date.timeInMillis - now.timeInMillis
                        if (diff < 0) {
                            show(
                                this@MainActivity,
                                getString(R.string.time_is_past_now),
                                AlertDialogBuilder.DialogButton.OK,
                                null
                            )
                            return@OnTimeSetListener
                        }
                        minutesFromNow = (diff / 60000).toInt()
                        val str = SimpleDateFormat(
                            if (date.get(Calendar.DAY_OF_YEAR) == now.get(Calendar.DAY_OF_YEAR)) "d MMM" else "HH:mm",
                            Locale.getDefault()
                        ).format(date.time)
                        binding.buttonRequest.text = getString(R.string.book_later_button, str)
                    },
                    Calendar.getInstance()[Calendar.HOUR_OF_DAY],
                    Calendar.getInstance()[Calendar.MINUTE],
                    true
                ).show()
            },
            Calendar.getInstance()[Calendar.YEAR],
            Calendar.getInstance()[Calendar.MONTH],
            Calendar.getInstance()[Calendar.DAY_OF_MONTH]
        ).show()
    }

    private fun logout() {
        preferences.clearPreferences()
        finish()
    }

    private fun showCurvedPolyline(p1: LatLng, p2: LatLng) {
        val k = 0.2
        val d = SphericalUtil.computeDistanceBetween(p1, p2)
        val h = SphericalUtil.computeHeading(p1, p2)
        val p = SphericalUtil.computeOffset(p1, d * 0.5, h)
        val x = (1 - k * k) * d * 0.5 / (2 * k)
        val r = (1 + k * k) * d * 0.5 / (2 * k)
        val c = SphericalUtil.computeOffset(p, x, h + 90.0)
        val options = PolylineOptions()
        val pattern = listOf(Dash(30.0f), Gap(20.0f))
        val h1 = SphericalUtil.computeHeading(c, p1)
        val h2 = SphericalUtil.computeHeading(c, p2)
        val numPoints = 100
        val step = (h2 - h1) / numPoints
        for (i in 0 until numPoints) {
            val pi = SphericalUtil.computeOffset(c, r, h1 + i * step)
            options.add(pi)
        }
        polylineOriginDestination = mMap!!.addPolyline(
            options.width(10f).zIndex(100f).color(primaryColor).geodesic(true).pattern(pattern)
        )
    }

    private fun findPlace(pretext: String) {
        val fields = listOf(Place.Field.LAT_LNG, Place.Field.NAME)
        val intent = Autocomplete.IntentBuilder(AutocompleteActivityMode.OVERLAY, fields)
            .setInitialQuery(pretext)
        if (resources.getStringArray(R.array.places_countries).isNotEmpty()) {
            intent.setCountries(resources.getStringArray(R.array.places_countries).toMutableList())
        }
        registerForPlacesScreenResult.launch(intent.build(this))
    }

    private fun displaySpeechRecognizer() {
        if (ContextCompat.checkSelfPermission(
                this,
                Manifest.permission.RECORD_AUDIO
            ) == PackageManager.PERMISSION_GRANTED
        ) {
            try {
                val intent = Intent(RecognizerIntent.ACTION_RECOGNIZE_SPEECH)
                intent.putExtra(
                    RecognizerIntent.EXTRA_LANGUAGE_MODEL,
                    RecognizerIntent.LANGUAGE_MODEL_FREE_FORM
                )
                intent.putExtra(
                    RecognizerIntent.EXTRA_LANGUAGE,
                    getString(R.string.default_language)
                )
                registerForVoiceRecognitionScreenResult.launch(intent)
            } catch (e: ActivityNotFoundException) {
                show(
                    this@MainActivity,
                    getString(R.string.question_install_speech),
                    getString(R.string.error),
                    AlertDialogBuilder.DialogButton.OK_CANCEL,
                    AlertDialogEvent { result: DialogResult ->
                        if (result === DialogResult.OK) {
                            val browserIntent = Intent(
                                Intent.ACTION_VIEW,
                                Uri.parse("https://market.android.com/details?id=com.google.android.voicesearch")
                            )
                            startActivity(browserIntent)
                        }
                    })
            }
        } else {
            ActivityCompat.requestPermissions(
                this,
                arrayOf(Manifest.permission.RECORD_AUDIO),
                requestRecordAudioPermission
            )
        }
    }

    override fun onRequestPermissionsResult(
        requestCode: Int,
        permissions: Array<out String>,
        grantResults: IntArray
    ) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
        if (grantResults.contains(-1)) {
            return
        }
        when (requestCode) {
            permissionGPS -> {
                gotoCurrentLocation()

            }
            requestRecordAudioPermission -> {
                displaySpeechRecognizer()
            }
        }
    }

    private fun onButtonConfirmPickupClicked() {
        binding.buttonConfirmDestination.isEnabled = false
        binding.buttonAddDestination.isEnabled = false
        TransitionManager.beginDelayedTransition(
            (binding.root as ViewGroup),
            TransitionSet().addTransition(Slide()).addTransition(Fade())
        )
        binding.buttonConfirmPickup.visibility = View.GONE
        if (!resources.getBoolean(R.bool.single_point_mode)) {
            binding.buttonConfirmDestination.visibility = View.VISIBLE
            addDestination()
        } else
            onButtonFinalDestinationClicked()
    }

    private fun onButtonAddDestinationClicked() {
        addDestination()
    }

    private fun onButtonFinalDestinationClicked() {
        addDestination(finalDestination = true)
    }

    private fun addDestination(force: Boolean = false, finalDestination: Boolean = false) {
        if (!force && selectedPoints.count() > 0 && distFrom(
                mMap!!.cameraPosition.target,
                selectedPoints.last()
            ) < 1000
        ) {
            MaterialAlertDialogBuilder(this)
                .setMessage(R.string.message_distance_close)
                .setPositiveButton(R.string.alert_ok) { _: DialogInterface, _: Int ->
                    addDestination(true, finalDestination)
                }
                .setNegativeButton(R.string.alert_cancel, null)
                .show()
            return
        }
        selectedPoints = selectedPoints.plus(mMap!!.cameraPosition.target).toMutableList()
        selectedAddresses =
            selectedAddresses.plus(binding.searchText.text.toString()).toMutableList()
        markers.add(
            mMap!!.addMarker(
                MarkerOptions().anchor(0.5f, 0.5f)
                    .position(mMap!!.cameraPosition.target)
                    .icon(BitmapDescriptorFactory.fromResource(R.drawable.ic_marker_2))
            )!!
        )
        mMap!!.animateCamera(
            CameraUpdateFactory.newLatLng(
                LatLng(
                    mMap!!.cameraPosition.target.latitude + 0.001,
                    mMap!!.cameraPosition.target.longitude
                )
            )
        )
        val canAddAnotherDestination =
            selectedPoints.count() < (resources.getInteger(R.integer.maximum_destinations) - 1) && !resources.getBoolean(
                R.bool.single_point_mode
            )
        binding.buttonAddDestination.visibility =
            if (canAddAnotherDestination) View.VISIBLE else View.GONE
        if (finalDestination) {
            binding.drawerLayout.setDrawerLockMode(DrawerLayout.LOCK_MODE_LOCKED_CLOSED)
            binding.buttonRequest.isEnabled = false
            binding.buttonTime.isEnabled = false
            binding.buttonRequest.text = getString(R.string.confirm_service)
            binding.expandingMarker.visibility = View.GONE
            mMap!!.uiSettings.setAllGesturesEnabled(false)
            TransitionManager.beginDelayedTransition(
                (binding.root as ViewGroup),
                TransitionSet().addTransition(Fade())
            )
            binding.buttonConfirmDestination.visibility = View.GONE
            binding.buttonAddDestination.visibility = View.GONE
            binding.searchPlace.visibility = View.GONE
            this.viewModel.calculateFare(selectedPoints)
        }
    }

    private fun goBackFromServiceSelection() {
        binding.drawerLayout.setDrawerLockMode(DrawerLayout.LOCK_MODE_UNLOCKED)
        selectedPoints = ArrayList()
        selectedAddresses = ArrayList()
        polylineOriginDestination?.remove()
        binding.expandingMarker.visibility = View.VISIBLE
        bottomSheetBehavior.state = BottomSheetBehavior.STATE_COLLAPSED
        mMap?.let { map ->

            map.setPadding(0, 0, 0, 100)
            map.uiSettings.setAllGesturesEnabled(true)
        }
        binding.buttonConfirmPickup.isEnabled = false
        TransitionManager.beginDelayedTransition(
            (binding.root as ViewGroup),
            TransitionSet().addTransition(Fade())
        )
        binding.buttonConfirmPickup.visibility = View.VISIBLE
        binding.searchPlace.visibility = View.VISIBLE
        binding.searchPlace.closeMenu(false)
        for (marker in markers) {
            marker.remove()
        }
        markers = ArrayList()
    }

    private fun onButtonConfirmServiceClicked(skipCancellation: Boolean = false) {
        //TODO: Think of something about cancellation fee
//        if(selectedService!!.cancellationTotalFee!! > 0 && !skipCancellation) {
//            val formatter: NumberFormat = NumberFormat.getCurrencyInstance()
//            formatter.currency = Currency.getInstance(selectedCurrency)
//            val fee = formatter.format(selectedService!!.cancellationTotalFee!!)
//            show(this, getString(R.string.cancellation_fee_confirmation, fee), AlertDialogBuilder.DialogButton.OK_CANCEL) { event ->
//                run {
//                    if (event == DialogResult.OK) {
//                        onButtonConfirmServiceClicked(true)
//                    }
//                }
//            }
//            return
//        }
        viewModel.requestService(
            selectedPoints,
            selectedService!!.id.toInt(),
            minutesFromNow,
            selectedAddresses
        )
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        when (item.itemId) {
            android.R.id.home -> binding.drawerLayout.openDrawer(GravityCompat.START)
        }
        return super.onOptionsItemSelected(item)
    }

    override fun onMapReady(googleMap: GoogleMap) {
        mMap = googleMap
        mMap!!.setPadding(0, 0, 0, 100)
        mMap!!.isTrafficEnabled = false
        mMap!!.animateCamera(
            CameraUpdateFactory.newLatLngZoom(
                doubleArrayToLatLng(
                    intent.getDoubleArrayExtra(
                        "currentLocation"
                    )!!
                ), 16.0f
            )
        )
        if (ContextCompat.checkSelfPermission(
                this@MainActivity,
                Manifest.permission.ACCESS_COARSE_LOCATION
            ) == PackageManager.PERMISSION_GRANTED
        ) {
            mMap!!.isMyLocationEnabled = true
            mMap!!.uiSettings.isMyLocationButtonEnabled = false
        }
        mMap!!.setOnCameraMoveStartedListener {
            binding.expandingMarker.progress = 0f
            binding.expandingMarker.setMinAndMaxProgress(0.0f, 0.65f)
            binding.expandingMarker.playAnimation()
        }
        mMap!!.setOnCameraIdleListener {
            binding.expandingMarker.progress = 0.65f
            binding.expandingMarker.setMinAndMaxProgress(0.65f, 1f)
            binding.expandingMarker.playAnimation()
            val parentJob = Job()
            CoroutineScope(Dispatchers.Main + parentJob).launch {
                getAddress(googleMap.cameraPosition.target)
                viewModel.fetchDriversLocation(googleMap.cameraPosition.target)
            }
        }
        if (resources.getBoolean(R.bool.isNightMode)) {
            mMap!!.setMapStyle(MapStyleOptions.loadRawResourceStyle(this, R.raw.map_night))
        }
    }

    private suspend fun getAddress(location: LatLng) {
        val s = getAddressNetwork(location)
        binding.searchText.text = s
        if (binding.buttonConfirmPickup.visibility == View.VISIBLE) {
            binding.buttonConfirmPickup.isEnabled = true
        } else {
            binding.buttonConfirmDestination.isEnabled = true
            binding.buttonAddDestination.isEnabled = true
        }
    }

    private suspend fun getAddressNetwork(location: LatLng): String = withContext(Dispatchers.IO) {
        val geocode = Geocoder(this@MainActivity, Locale.getDefault())
        var addresses: List<Address>? = null
        try {
            addresses = geocode.getFromLocation(location.latitude, location.longitude, 1)
        } catch (e: IOException) {
            e.printStackTrace()
        }
        if (addresses != null && addresses.isNotEmpty()) {
            var address = ""
            if (addresses[0].thoroughfare != null) address = addresses[0].thoroughfare
            if (addresses[0].featureName != null) {
                if (address == "") address =
                    addresses[0].featureName else address += ", " + addresses[0].featureName
            }
            return@withContext address
        } else return@withContext getString(R.string.unknown_location)
    }

    override fun onBackPressed() {
        if (binding.buttonConfirmPickup.visibility == View.VISIBLE) {
            show(
                this@MainActivity,
                getString(R.string.message_exit),
                AlertDialogBuilder.DialogButton.OK_CANCEL,
                AlertDialogEvent { result: DialogResult -> if (result === DialogResult.OK) finishAffinity() })
        } else {
            goBackFromServiceSelection()
        }
    }

    private fun createNotificationChannels() {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.O) {
            return
        }
        val sound =
            Uri.parse("android.resource://" + applicationContext.packageName + "/" + R.raw.notification)

        val notificationManager =
            applicationContext.getSystemService(NOTIFICATION_SERVICE) as NotificationManager

        NotificationChannel("tripEvents", "Trip Events", NotificationManager.IMPORTANCE_HIGH).let {
            it.enableLights(true)
            it.description = "Notifies of events happening on trip"
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
    }

    companion object {
        private const val permissionGPS = 203
    }
}