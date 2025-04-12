package com.innomalist.taxi.driver.activities.profile

import android.Manifest
import android.app.Activity
import android.content.Intent
import android.content.pm.PackageManager
import android.graphics.Color
import android.net.Uri
import android.os.AsyncTask
import android.os.Build
import android.os.Bundle
import android.view.Menu
import android.view.MenuItem
import android.view.View
import android.widget.ArrayAdapter
import androidx.activity.viewModels
import androidx.core.content.ContextCompat
import androidx.databinding.DataBindingUtil
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.apollographql.apollo3.api.Optional
import com.bumptech.glide.Glide
import com.esafirm.imagepicker.features.*
import com.innomalist.taxi.common.ViewState
import com.innomalist.taxi.common.components.BaseActivity
import com.innomalist.taxi.common.interfaces.AlertDialogEvent
import com.innomalist.taxi.common.utils.AlertDialogBuilder
import com.innomalist.taxi.common.utils.AlertDialogBuilder.show
import com.innomalist.taxi.common.utils.AlerterHelper
import com.innomalist.taxi.common.utils.LoadingDialog
import com.innomalist.taxi.driver.Config
import com.innomalist.taxi.driver.R
import com.innomalist.taxi.driver.activities.profile.adapters.DocumentsRecyclerViewAdapter
import com.innomalist.taxi.driver.databinding.ActivityEditProfileBinding
import com.minimal.taxi.driver.GetDriverQuery
import com.minimal.taxi.driver.type.DriverStatus
import com.minimal.taxi.driver.type.Gender
import com.minimal.taxi.driver.type.UpdateDriverInput
import com.yalantis.ucrop.UCrop
import dagger.hilt.android.AndroidEntryPoint
import org.json.JSONObject
import java.io.*
import java.net.HttpURLConnection
import java.net.URL
import kotlin.math.min

@AndroidEntryPoint
class ProfileActivity : BaseActivity() {
    lateinit var binding: ActivityEditProfileBinding
    private val viewModel: ProfileViewModel by viewModels()
    var imageToUpload = ImageToUpload.Profile
    var documents: ArrayList<GetDriverQuery.Document> = arrayListOf()
    var profilePicture: GetDriverQuery.Media? = null
    var documentsRecyclerViewAdapter: DocumentsRecyclerViewAdapter? = null
    private val permissionStorage = 2
    private val permissionCameraRequest = 3


    enum class ImageToUpload {
        Profile, Document
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = DataBindingUtil.setContentView(this, R.layout.activity_edit_profile)
        val adapter = ArrayAdapter(
            this,
            android.R.layout.simple_dropdown_item_1line,
            resources.getStringArray(R.array.genders)
        )
        binding.genderAutocomplete.setAdapter(adapter)
        binding.profileImage.setOnClickListener(onProfileImageClicked)
        initializeToolbar("")
        toolbar!!.setHomeAsUpIndicator(R.drawable.ic_close)

        val linearLayoutManager =
            LinearLayoutManager(this@ProfileActivity, RecyclerView.HORIZONTAL, false)
        binding.documents.layoutManager = linearLayoutManager
        documentsRecyclerViewAdapter = DocumentsRecyclerViewAdapter(documents) { }
        binding.documents.adapter = documentsRecyclerViewAdapter
        listenLiveData()
        viewModel.getProfile()
    }

    private fun listenLiveData() {
        this.viewModel.updateResult.observe(this) {
            when (it) {
                is ViewState.Error -> {
                    LoadingDialog.hide()
                    AlerterHelper.showError(this, it.message)
                }
                is ViewState.Loading -> {
                    LoadingDialog.display(this)
                }
                is ViewState.Success -> {
                    LoadingDialog.hide()
                    show(
                        this,
                        if(resources.getBoolean(R.bool.testing_mode))
                            getString(R.string.driver_register_success_message_testing) else
                        getString(R.string.driver_register_success_message),
                        AlertDialogBuilder.DialogButton.OK,
                        AlertDialogEvent {
                            setResult(Activity.RESULT_OK)
                            if(resources.getBoolean(R.bool.testing_mode))
                                finish()
                            else
                                finishAffinity()
                        })
                }
            }
        }
        this.viewModel.profile.observe(this) {
            when (it) {
                is ViewState.Error -> {}
                is ViewState.Loading -> {}
                is ViewState.Success -> {
                    binding.user = it.value
                    if (it.value!!.status == DriverStatus.SoftReject) binding.textNote.text =
                        getString(
                            R.string.soft_reject_notice,
                            it.value!!.softRejectionNote
                        ) else binding.layoutNote.visibility = View.GONE
                    documents = ArrayList(it.value!!.documents)
                    documentsRecyclerViewAdapter =
                        DocumentsRecyclerViewAdapter(documents.toList()) { }
                    binding.documents.adapter = documentsRecyclerViewAdapter
                    profilePicture = it.value!!.media
                    profilePicture?.address?.let {
                        Glide.with(this@ProfileActivity).load(Config.Backend + it)
                            .into(binding.profileImage)
                    }

                }
            }
        }
    }

    override fun onCreateOptionsMenu(menu: Menu): Boolean {
        menuInflater.inflate(R.menu.actionbar_save, menu)
        return super.onCreateOptionsMenu(menu)
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        var failed = false
        if (binding.firstNameTextLayout.editText!!.text.toString().isEmpty()) {
            binding.firstNameTextLayout.error = getString(R.string.error_field_empty)
            failed = true
        } else {
            binding.firstNameTextLayout.isErrorEnabled = false
        }
        if (binding.lastNameTextLayout.editText!!.text.toString().isEmpty()) {
            binding.lastNameTextLayout.error = getString(R.string.error_field_empty)
            failed = true
        } else {
            binding.lastNameTextLayout.isErrorEnabled = false
        }
//        if (binding.carColorTextLayout.editText!!.text.toString().isEmpty()) {
//            binding.carColorTextLayout.error = getString(R.string.error_field_empty)
//            failed = true
//        } else {
//            binding.carColorTextLayout.isErrorEnabled = false
//        }
        if (binding.plateNumTextLayout.editText!!.text.toString().isEmpty()) {
            binding.plateNumTextLayout.error = getString(R.string.error_field_empty)
            failed = true
        } else {
            binding.plateNumTextLayout.isErrorEnabled = false
        }
        if (binding.carYearTextLayout.editText!!.text.toString().isEmpty()) {
            binding.carYearTextLayout.error = getString(R.string.error_field_empty)
            failed = true
        } else {
            binding.carYearTextLayout.isErrorEnabled = false
        }
        if (binding.certificateTextLayout.editText!!.text.toString().isEmpty()) {
            binding.certificateTextLayout.error = getString(R.string.error_field_empty)
            failed = true
        } else {
            binding.certificateTextLayout.isErrorEnabled = false
        }
        if (binding.accountNumberTextLayout.editText!!.text.toString().isEmpty()) {
            binding.accountNumberTextLayout.error = getString(R.string.error_field_empty)
            failed = true
        } else {
            binding.accountNumberTextLayout.isErrorEnabled = false
        }
        if (binding.addressTextLayout.editText!!.text.toString().isEmpty()) {
            binding.addressTextLayout.error = getString(R.string.error_field_empty)
            failed = true
        } else {
            binding.addressTextLayout.isErrorEnabled = false
        }
        if (binding.emailTextLayout.editText!!.text.toString().isEmpty()) {
            binding.emailTextLayout.error = getString(R.string.error_email_invalid)
            failed = true
        } else {
            binding.emailTextLayout.isErrorEnabled = false
        }
        if (failed) return false
        if (documents.isEmpty()) {
            show(this, getString(R.string.alert_upload_documents), event = null)
            return false
        }
        val gender = when(binding.genderAutocomplete.listSelection) {
            0 -> Gender.Male
            1 -> Gender.Female
            else -> null
        }
        this.viewModel.updateProfile(
            input = UpdateDriverInput(
                firstName = Optional.presentIfNotNull(binding.firstNameTextLayout.editText!!.text.toString()),
                lastName = Optional.presentIfNotNull(binding.lastNameTextLayout.editText!!.text.toString()),
                email = Optional.presentIfNotNull(binding.emailTextLayout.editText?.text?.toString()),
                gender = Optional.presentIfNotNull(gender),
                accountNumber = Optional.presentIfNotNull(binding.accountNumberTextLayout.editText!!.text.toString()),
                address = Optional.presentIfNotNull(binding.addressTextLayout.editText!!.text.toString()),
                bankName = Optional.presentIfNotNull(binding.bankNameTextLayout.editText!!.text.toString()),
                bankSwift = Optional.presentIfNotNull(binding.bankSwiftTextLayout.editText!!.text.toString()),
                bankRoutingNumber = Optional.presentIfNotNull(binding.bankRoutingTextLayout.editText!!.text.toString()),
                carPlate = Optional.presentIfNotNull(binding.plateNumTextLayout.editText!!.text.toString()),
                carProductionYear = Optional.presentIfNotNull(
                    binding.carYearTextLayout.editText!!.text.toString().toInt()
                ),
                certificateNumber = Optional.presentIfNotNull(binding.certificateTextLayout.editText!!.text.toString()),
                documents = Optional.presentIfNotNull(listOf()),
                status = Optional.presentIfNotNull(DriverStatus.PendingApproval),
                mediaId = Optional.presentIfNotNull(profilePicture?.id?.toDouble())
            ), documentIds = documents.map { it.id }.toList()
        )
        return super.onOptionsItemSelected(item)
    }

    private var onProfileImageClicked: View.OnClickListener = View.OnClickListener {
        imageToUpload = ImageToUpload.Profile
        openPicker()
    }

    private val imagePickerLaunder = registerImagePicker {
        val image = it.first()
        val destinationUri = Uri.fromFile(File(cacheDir, "p.jpg"))
        val options = UCrop.Options()
        options.setStatusBarColor(ContextCompat.getColor(this, R.color.black))
        options.setToolbarColor(ContextCompat.getColor(this, R.color.black))
        options.setToolbarWidgetColor(ContextCompat.getColor(this, R.color.white))
        val uCrop = UCrop.of(Uri.fromFile(File(image.path)), destinationUri).withOptions(options)
        if (imageToUpload == ImageToUpload.Profile) {
            uCrop.withAspectRatio(1f, 1f)
                .withMaxResultSize(200, 200)
        }
        uCrop.start(this@ProfileActivity)
    }

    private fun openPicker() {
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
                // If request is cancelled, the result arrays are empty.
                if (grantResults.isNotEmpty() && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                    openPicker()
                } else {
                    show(this@ProfileActivity, getString(R.string.prompt_storage_rw), event = null)
                }
            }
            permissionCameraRequest -> {
                if(grantResults.isNotEmpty())
                    openPicker()
            }
        }
    }

    public override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (resultCode == Activity.RESULT_OK && requestCode == UCrop.REQUEST_CROP) {
            val resultUri = UCrop.getOutput(data!!) ?: return
            LoadingDialog.display(this)
            when (imageToUpload) {
                ImageToUpload.Profile -> UploadDocument().execute(resultUri.path)
                ImageToUpload.Document -> UploadDocument().execute(resultUri.path)
            }
        } else if (resultCode == UCrop.RESULT_ERROR) try {
            throw UCrop.getError(data!!)!!
        } catch (throwable: Throwable) {
            throwable.printStackTrace()
        }
    }

    fun onUploadDocument(view: View?) {
        imageToUpload = ImageToUpload.Document
        openPicker()
    }

    private inner class UploadDocument : AsyncTask<String, Void, String>() {
        override fun doInBackground(vararg params: String): String {
            return try {
                val conn: HttpURLConnection?
                val dos: DataOutputStream?
                val lineEnd = "\r\n"
                val twoHyphens = "--"
                val boundary = "*****"
                var bytesRead: Int
                var bytesAvailable: Int
                var bufferSize: Int
                val buffer: ByteArray
                val maxBufferSize = 1024 * 1024
                val sourceFile = File(params[0])
                if (sourceFile.isFile) {
                        val upLoadServerUri =
                            if (imageToUpload == ImageToUpload.Profile) "${Config.Backend}upload_profile" else "${Config.Backend}upload_document"
                        val fileName = "doc.jpg"
                        val fileInputStream = FileInputStream(sourceFile)
                        val url = URL(upLoadServerUri)
                        conn = url.openConnection() as HttpURLConnection
                        conn.doInput = true
                        conn.doOutput = true
                        conn.useCaches = false
                        conn.requestMethod = "POST"
                        conn.setRequestProperty("Connection", "Keep-Alive")
                        conn.setRequestProperty("ENCTYPE", "multipart/form-data")
                        conn.setRequestProperty(
                            "Content-Type",
                            "multipart/form-data;boundary=$boundary"
                        )
                        conn.setRequestProperty("Authorization", "Bearer ${preferences.token}")
                        dos = DataOutputStream(conn.outputStream)
                        dos.writeBytes(twoHyphens + boundary + lineEnd)
                        dos.writeBytes("Content-Disposition: form-data; name=\"file\";filename=\"$fileName\"$lineEnd")
                        dos.writeBytes(lineEnd)
                        bytesAvailable = fileInputStream.available()
                        bufferSize = min(bytesAvailable, maxBufferSize)
                        buffer = ByteArray(bufferSize)
                        bytesRead = fileInputStream.read(buffer, 0, bufferSize)
                        while (bytesRead > 0) {
                            dos.write(buffer, 0, bufferSize)
                            bytesAvailable = fileInputStream.available()
                            bufferSize = min(bytesAvailable, maxBufferSize)
                            bytesRead = fileInputStream.read(buffer, 0, bufferSize)
                        }
                        dos.writeBytes(lineEnd)
                        dos.writeBytes(twoHyphens + boundary + twoHyphens + lineEnd)
                        val serverResponseCode = conn.responseCode
                        fileInputStream.close()
                        dos.flush()
                        dos.close()
                        if (serverResponseCode == 200) {
                            val br = BufferedReader(InputStreamReader(conn.inputStream))
                            val sb = StringBuilder()
                            var output: String?
                            while (br.readLine().also { output = it } != null) {
                                sb.append(output)
                                return sb.toString()
                            }
                            "OK"
                        } else {
                            "FAILED"
                        }
                } else {
                    "FAILED"
                }
            } catch (ex: Exception) {
                ex.printStackTrace()
                "FAILED"
            }
        }

        override fun onPostExecute(result: String) {
            LoadingDialog.hide()
            if (result == "FAILED") {
                show(this@ProfileActivity, "Failed to Upload", event = null)
                return
            }
            val address = JSONObject(result).getString("address")
            val id = JSONObject(result).getString("id")
            when (imageToUpload) {
                ImageToUpload.Profile -> Glide.with(this@ProfileActivity).load(Config.Backend + address)
                    .into(binding.profileImage)
                ImageToUpload.Document -> {
                    documents.add(GetDriverQuery.Document(id, address))
                    documentsRecyclerViewAdapter =
                        DocumentsRecyclerViewAdapter(documents.toList()) { }
                    binding.documents.adapter = documentsRecyclerViewAdapter
                }
            }
        }

        override fun onPreExecute() {}
        override fun onProgressUpdate(vararg values: Void) {}
    }
}