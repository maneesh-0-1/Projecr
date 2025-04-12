package com.innomalist.taxi.rider.activities.splash

import android.Manifest.permission.ACCESS_COARSE_LOCATION
import android.Manifest.permission.ACCESS_FINE_LOCATION
import android.annotation.SuppressLint
import android.app.Activity
import android.content.Intent
import android.content.pm.PackageManager
import android.location.Location
import android.os.Bundle
import android.view.View
import androidx.activity.viewModels
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import androidx.databinding.DataBindingUtil
import com.firebase.ui.auth.AuthUI
import com.firebase.ui.auth.AuthUI.IdpConfig.PhoneBuilder
import com.firebase.ui.auth.FirebaseAuthUIActivityResultContract
import com.firebase.ui.auth.data.model.FirebaseAuthUIAuthenticationResult
import com.google.android.gms.location.LocationServices
import com.google.android.gms.maps.model.LatLng
import com.google.android.libraries.places.api.Places
import com.google.firebase.auth.FirebaseAuth
import com.google.firebase.messaging.FirebaseMessaging
import com.innomalist.taxi.common.ViewState
import com.innomalist.taxi.common.components.BaseActivity
import com.innomalist.taxi.common.interfaces.AlertDialogEvent
import com.innomalist.taxi.common.utils.AlertDialogBuilder
import com.innomalist.taxi.common.utils.AlertDialogBuilder.DialogResult
import com.innomalist.taxi.common.utils.AlertDialogBuilder.show
import com.innomalist.taxi.common.utils.CommonUtils.isInternetDisabled
import com.innomalist.taxi.common.utils.LocationHelper.Companion.latLngToDoubleArray
import com.innomalist.taxi.rider.R
import com.innomalist.taxi.rider.activities.main.MainActivity
import com.innomalist.taxi.rider.databinding.ActivitySplashBinding
import dagger.hilt.android.AndroidEntryPoint


@AndroidEntryPoint
class SplashActivity : BaseActivity() {
    lateinit var binding: ActivitySplashBinding
    private val viewModel: SplashActivityViewModel by viewModels()
    private var currentLocation: LatLng? = null
    private val permissionLocationRequestCode = 321
    private var goingToOpen = false

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        Places.initialize(applicationContext, getString(R.string.google_maps_key))
        Places.createClient(this)
        binding = DataBindingUtil.setContentView(this@SplashActivity, R.layout.activity_splash)
        observeLiveData()
        binding.loginButton.setOnClickListener {
            val signInIntent = AuthUI.getInstance()
                .createSignInIntentBuilder()
                .setAvailableProviders(listOf(PhoneBuilder().build()))
                .setTheme(currentTheme)
                .build()
            signInLauncher.launch(signInIntent)
        }
    }

    private val signInLauncher = registerForActivityResult(
        FirebaseAuthUIActivityResultContract()
    ) { result: FirebaseAuthUIAuthenticationResult? ->
        if (result?.resultCode == Activity.RESULT_OK) {
            goToLoadingMode()
            FirebaseAuth.getInstance().currentUser!!.getIdToken(false).addOnCompleteListener {
                this.viewModel.login(it.result!!.token!!)
            }
        } else {
            goToLoginMode()
        }
    }

    private fun observeLiveData() {
        this.viewModel.loginResult.observe(this) {
            when (it) {
                is ViewState.Error -> goToLoginMode()
                is ViewState.Loading -> goToLoadingMode()
                is ViewState.Success -> {
                    preferences.token = it.value?.data?.login?.jwtToken ?: return@observe
                    tryConnect()
                }
            }
        }
    }

    private fun checkPermissions() {
        if (isInternetDisabled(this)) {
            show(
                this,
                getString(R.string.message_enable_wifi),
                AlertDialogBuilder.DialogButton.CANCEL_RETRY,
                AlertDialogEvent { result: DialogResult ->
                    if (result == DialogResult.RETRY) {
                        checkPermissions()
                    } else {
                        finishAffinity()
                    }
                })
            return
        }
        if (ContextCompat.checkSelfPermission(
                this@SplashActivity,
                ACCESS_FINE_LOCATION
            ) == PackageManager.PERMISSION_GRANTED
        ) {
            requestLocation()
        } else {
            ActivityCompat.requestPermissions(
                this@SplashActivity,
                arrayOf(ACCESS_FINE_LOCATION, ACCESS_COARSE_LOCATION),
                permissionLocationRequestCode
            )
        }
    }

    @SuppressLint("MissingPermission")
    private fun requestLocation() {
        LocationServices.getFusedLocationProviderClient(this@SplashActivity).lastLocation.addOnSuccessListener(
            this@SplashActivity
        ) { location: Location? ->
            if (location != null) {
                currentLocation = LatLng(location.latitude, location.longitude)
            }
            tryConnect()

        }.addOnFailureListener {
            tryConnect()
        }
    }

    override fun onRequestPermissionsResult(
        requestCode: Int,
        permissions: Array<out String>,
        grantResults: IntArray
    ) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
        if (requestCode == permissionLocationRequestCode && !grantResults.contains(-1)) {
            requestLocation()
        } else {
            tryConnect()
        }
    }

    private fun startMainActivity(latLng: LatLng) {
        if (goingToOpen) return
        goingToOpen = true
        val intent = Intent(this@SplashActivity, MainActivity::class.java)
        val array = latLngToDoubleArray(latLng)
        intent.putExtra("currentLocation", array)
        startActivity(intent)
    }

    private fun tryConnect() {
        val token = preferences.token
        if (token != null && token.isNotEmpty()) {
            FirebaseMessaging.getInstance().token.addOnCompleteListener { fb ->
                runOnUiThread {
                    if (ActivityCompat.checkSelfPermission(
                            this,
                            ACCESS_FINE_LOCATION
                        ) == PackageManager.PERMISSION_GRANTED && ActivityCompat.checkSelfPermission(
                            this,
                            ACCESS_COARSE_LOCATION
                        ) == PackageManager.PERMISSION_GRANTED
                    ) {
                        if (currentLocation == null) {
                            val location =
                                getString(R.string.default_location).split(",").toTypedArray()
                            val lat = location[0].toDouble()
                            val lng = location[1].toDouble()
                            currentLocation = LatLng(lat, lng)
                        }
                        startMainActivity(currentLocation!!)
                    } else {
                        val location =
                            getString(R.string.default_location).split(",").toTypedArray()
                        startMainActivity(LatLng(location[0].toDouble(), location[1].toDouble()))
                    }
//                            is RemoteResponse.Error -> {
//                                runOnUiThread {
//                                    if(it.error == ConnectionError.VersionOutdated) {
//                                        MaterialAlertDialogBuilder(this)
//                                                .setMessage(getString(R.string.message_outdated_app))
//                                                .setPositiveButton(getString(R.string.alert_open_google_play)) { _, _ ->
//                                                    try {
//                                                        startActivity(Intent(Intent.ACTION_VIEW, Uri.parse("market://details?id=$packageName")))
//                                                    } catch (_: ActivityNotFoundException) {
//                                                        startActivity(Intent(Intent.ACTION_VIEW, Uri.parse("https://play.google.com/store/apps/details?id=$packageName")))
//                                                    }
//                                                }
//                                                .show()
//                                    } else {
//
//                                    }
//                                    goToLoginMode()
//                                    showError(this, it.error.rawValue)
//                                }
//
//                            }

                }
            }
            goToLoadingMode()
        } else {
            goToLoginMode()
        }
    }


    override fun onResume() {
        super.onResume()
        checkPermissions()
    }

    private fun goToLoadingMode() {
        binding.loginButton.visibility = View.GONE
        binding.progressBar.visibility = View.VISIBLE
    }

    private fun goToLoginMode() {
        binding.loginButton.visibility = View.VISIBLE
        binding.progressBar.visibility = View.GONE
    }
}