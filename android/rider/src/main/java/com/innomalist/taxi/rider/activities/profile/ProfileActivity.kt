package com.innomalist.taxi.rider.activities.profile

import android.Manifest
import android.app.Activity
import android.content.Intent
import android.content.pm.PackageManager
import android.graphics.Color
import android.net.Uri
import android.os.Build
import android.os.Bundle
import android.view.Menu
import android.view.MenuItem
import android.widget.ArrayAdapter
import androidx.activity.viewModels
import androidx.core.content.ContextCompat
import androidx.databinding.DataBindingUtil
import com.bumptech.glide.Glide
import com.esafirm.imagepicker.features.*
import com.innomalist.taxi.common.ViewState
import com.innomalist.taxi.common.components.BaseActivity
import com.innomalist.taxi.common.utils.AlertDialogBuilder
import com.innomalist.taxi.common.utils.AlerterHelper
import com.innomalist.taxi.common.utils.LoadingDialog
import com.innomalist.taxi.rider.Config
import com.innomalist.taxi.rider.R
import com.innomalist.taxi.rider.databinding.ActivityEditProfileBinding
import com.minimal.taxi.rider.GetRiderQuery
import com.minimal.taxi.rider.UpdateProfileMutation
import com.minimal.taxi.rider.type.Gender
import com.yalantis.ucrop.UCrop
import dagger.hilt.android.AndroidEntryPoint
import java.io.File
import java.io.FileInputStream
import java.util.*

@AndroidEntryPoint
class ProfileActivity : BaseActivity() {
    lateinit var binding: ActivityEditProfileBinding
    lateinit var rider: GetRiderQuery.Rider
    private val viewModel: ProfileActivityViewModel by viewModels()
    private val permissionStorage = 2
    private val permissionCameraRequest = 3

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = DataBindingUtil.setContentView(this, R.layout.activity_edit_profile)
        listenLiveData()
        this.viewModel.getProfile()
        binding.fabAddPhoto.setOnClickListener{ profileImageClicked() }
        initializeToolbar("")
    }

    private fun listenLiveData() {
        this.viewModel.profile.observe(this) {
            when(it) {
                is ViewState.Error -> {
                    LoadingDialog.hide()
                    AlerterHelper.showError(this, it.message)
                }
                is ViewState.Loading -> {
                    LoadingDialog.display(this)
                }
                is ViewState.Success -> {
                    LoadingDialog.hide()
                    val rider = it.value?.data?.rider?.basicProfile ?: return@observe
                    val adapter = ArrayAdapter(this, android.R.layout.simple_dropdown_item_1line, resources.getStringArray(R.array.genders))
                    binding.genderAutocomplete.setAdapter(adapter)
                    binding.user = rider
                    when(rider.gender) {
                        Gender.Male -> 0
                        Gender.Female -> 1
                        Gender.Unknown -> 2
                        is Gender.UNKNOWN__ -> 2
                        null -> null
                    }?.let {
                        binding.genderAutocomplete.listSelection = it
                    }
                    rider.media?.let { media ->
                        Glide.with(binding.profileImage).load(Config.Backend + media.address).into(binding.profileImage)
                    }
                }
            }
        }

        this.viewModel.updateResult.observe(this) {
            when(it) {
                is ViewState.Loading -> {}
                is ViewState.Error -> AlerterHelper.showError(this, it.message)
                is ViewState.Success -> {
                    setResult(Activity.RESULT_OK)
                    finish()
                }
            }
        }
    }

    override fun onCreateOptionsMenu(menu: Menu): Boolean {
        menuInflater.inflate(R.menu.actionbar_save, menu)
        return super.onCreateOptionsMenu(menu)
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        val gender: Gender = when(binding.genderAutocomplete.listSelection) {
            0 -> Gender.Male
            1 -> Gender.Female
            else -> Gender.Unknown
        }
        this.viewModel.updateProfile(UpdateProfileMutation(firstName = binding.firstNameTextfield.text.toString(), lastName = binding.lastNameTextfield.text.toString(), email = binding.emailTextfield.text.toString(), gender = gender))
        return super.onOptionsItemSelected(item)
    }

    private val imagePickerLaunder = registerImagePicker {
        val image = it.first()
        val destinationUri = Uri.fromFile(File(cacheDir, "p.jpg"))
        val options = UCrop.Options()
        options.setStatusBarColor(ContextCompat.getColor(this, R.color.black))
        options.setToolbarColor(ContextCompat.getColor(this, R.color.black))
        options.setToolbarWidgetColor(ContextCompat.getColor(this, R.color.white))
        UCrop.of(Uri.fromFile(File(image.path)), destinationUri)
            .withAspectRatio(1f, 1f)
            .withMaxResultSize(200, 200)
            .withOptions(options)
            .start(this@ProfileActivity)
    }

    private fun profileImageClicked() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M && ContextCompat.checkSelfPermission(this, Manifest.permission.READ_EXTERNAL_STORAGE) != PackageManager.PERMISSION_GRANTED) {
            requestPermissions(
                arrayOf(Manifest.permission.READ_EXTERNAL_STORAGE),
                permissionStorage
            )
            return
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M && ContextCompat.checkSelfPermission(this, Manifest.permission.CAMERA) != PackageManager.PERMISSION_GRANTED) {
            requestPermissions(
                arrayOf(Manifest.permission.CAMERA),
                permissionCameraRequest
            )
            return
        }
        val config = ImagePickerConfig {
            mode = ImagePickerMode.SINGLE
            theme = R.style.ImagePickerTheme
            returnMode = ReturnMode.ALL
            isFolderMode = true
            arrowColor = Color.WHITE
            folderTitle = getString(R.string.picker_folder)
            imageTitle = getString(R.string.picker_tap_select)
            doneButtonText = getString(R.string.alert_ok)
        }
        imagePickerLaunder.launch(config)
    }

    override fun onRequestPermissionsResult(
        requestCode: Int,
        permissions: Array<String>,
        grantResults: IntArray
    ) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
        when (requestCode) {
            permissionStorage -> {
                if (grantResults.isNotEmpty() && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                    profileImageClicked()
                } else {
                    AlertDialogBuilder.show(
                        this@ProfileActivity,
                        getString(R.string.prompt_storage_rw),
                        event = null
                    )
                }
            }
            permissionCameraRequest -> {
                if(grantResults.isNotEmpty())
                    profileImageClicked()
            }
        }
    }

    public override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (resultCode == Activity.RESULT_OK && requestCode == UCrop.REQUEST_CROP) {
            val resultUri = UCrop.getOutput(data!!) ?: return
            val file = File(resultUri.path!!)
            val dt = ByteArray(file.length().toInt())
            FileInputStream(file).read(dt)
            //TODO: Important! Upload profile picture possibility
//            UpdateProfileImage(data = dt).execute<Media> {
//                when(it) {
//                    is RemoteResponse.Success -> {
//                        rider.media = it.body
//                        saveUserInfo()
//                        binding.user!!.media = it.body
//                        DataBinder.setMedia(binding.profileImage, rider.media)
//                    }
//
//                    is RemoteResponse.Error -> {
//                        it.error.showAlert(this)
//                    }
//                }
//            }
        } else if (resultCode == UCrop.RESULT_ERROR) try {
            throw Objects.requireNonNull(UCrop.getError(data!!)!!)
        } catch (throwable: Throwable) {
            throwable.printStackTrace()
        }
    }
}