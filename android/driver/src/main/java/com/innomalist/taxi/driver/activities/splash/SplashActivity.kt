package com.innomalist.taxi.driver.activities.splash

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import android.view.View
import androidx.activity.viewModels
import androidx.databinding.DataBindingUtil
import com.firebase.ui.auth.AuthUI
import com.firebase.ui.auth.AuthUI.IdpConfig.PhoneBuilder
import com.firebase.ui.auth.FirebaseAuthUIActivityResultContract
import com.firebase.ui.auth.data.model.FirebaseAuthUIAuthenticationResult
import com.google.firebase.auth.FirebaseAuth
import com.innomalist.taxi.common.ViewState
import com.innomalist.taxi.common.components.BaseActivity
import com.innomalist.taxi.common.interfaces.AlertDialogEvent
import com.innomalist.taxi.common.utils.AlertDialogBuilder
import com.innomalist.taxi.common.utils.AlertDialogBuilder.DialogResult
import com.innomalist.taxi.common.utils.AlertDialogBuilder.show
import com.innomalist.taxi.common.utils.CommonUtils.isInternetDisabled
import com.innomalist.taxi.common.utils.MyPreferenceManager.Companion.getInstance
import com.innomalist.taxi.driver.R
import com.innomalist.taxi.driver.activities.main.MainActivity
import com.innomalist.taxi.driver.databinding.ActivitySplashBinding
import dagger.hilt.android.AndroidEntryPoint

@AndroidEntryPoint
class SplashActivity : BaseActivity() {
    private lateinit var binding: ActivitySplashBinding
    private val viewModel: SplashActivityViewModel by viewModels()
    private var signInActivityCode = 123

    private val onLoginClicked = View.OnClickListener {
        val signInIntent = AuthUI.getInstance()
                        .createSignInIntentBuilder()
                        .setAvailableProviders(listOf(PhoneBuilder().build()))
                        .setLogo(R.drawable.logo)
                        .setTheme(currentTheme)
                        .build()
        signInLauncher.launch(signInIntent)
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

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = DataBindingUtil.setContentView(this, R.layout.activity_splash)
        listenLiveData()
        binding.loginButton.setOnClickListener(onLoginClicked)
    }

    private fun listenLiveData() {
        this.viewModel.loginResult.observe(this) {
            when(it) {
                is ViewState.Error -> {
                    goToLoginMode()
                }
                is ViewState.Loading -> {
                    goToLoadingMode()
                }
                is ViewState.Success -> {
                    getInstance(applicationContext).token = it.value?.data?.login?.jwtToken ?: throw Exception("No Login Data retrieved.")
                    startMainActivity()
                }
            }
        }
    }

    private fun checkPermissions() {
        if (isInternetDisabled(this)) {
            show(this, getString(R.string.message_internet_connection), AlertDialogBuilder.DialogButton.CANCEL_RETRY, AlertDialogEvent { result: DialogResult ->
                if (result === DialogResult.RETRY) {
                    checkPermissions()
                } else {
                    finishAffinity()
                }
            })
            return
        }
        if (getInstance(applicationContext).token != null) {
            startMainActivity()
        } else {
            goToLoginMode()
        }
    }

    override fun onResume() {
        super.onResume()
        checkPermissions()
    }

    private fun startMainActivity() {
        val intent = Intent(this@SplashActivity, MainActivity::class.java)
        intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TASK
        startActivity(intent)
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