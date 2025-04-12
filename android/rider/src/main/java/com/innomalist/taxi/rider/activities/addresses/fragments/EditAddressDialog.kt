package com.innomalist.taxi.rider.activities.addresses.fragments

import android.Manifest
import android.app.Dialog
import android.content.DialogInterface
import android.content.pm.PackageManager
import android.os.Bundle
import android.text.Editable
import android.text.TextWatcher
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import androidx.appcompat.app.AlertDialog
import androidx.core.app.ActivityCompat
import androidx.databinding.DataBindingUtil
import androidx.fragment.app.DialogFragment
import androidx.fragment.app.activityViewModels
import com.google.android.gms.maps.CameraUpdateFactory
import com.google.android.gms.maps.GoogleMap
import com.google.android.gms.maps.OnMapReadyCallback
import com.google.android.gms.maps.SupportMapFragment
import com.google.android.gms.maps.model.LatLng
import com.innomalist.taxi.rider.R
import com.innomalist.taxi.rider.activities.addresses.AddressesActivityViewModel
import com.innomalist.taxi.rider.databinding.FragmentEditAddressBinding
import com.minimal.taxi.rider.GetAddressesQuery

class EditAddressDialog : DialogFragment(), OnMapReadyCallback {
    private val viewModel: AddressesActivityViewModel by activityViewModels()
    lateinit var binding: FragmentEditAddressBinding
    private var address: GetAddressesQuery.RiderAddress? = null
    var googleMap: GoogleMap? = null
    var mapFragment: SupportMapFragment? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        if (arguments != null) {
            val id = requireArguments().getString(ARG_ADDRESS_ID)
            if(id != null) {
                viewModel.addresses.value?.value?.data?.riderAddresses?.first { it.id == id }?.let { lAddress ->
                    address = lAddress
                    googleMap?.animateCamera(CameraUpdateFactory.newLatLngZoom(LatLng(lAddress.location.lat, lAddress.location.lng), 16f))
                }
            } else {
                this.viewModel.getCurrentLocation()
            }
        }
        listenLiveData()
    }

    private fun listenLiveData() {
        this.viewModel.currentLocation.observe(this) {
            it?.let { location ->
                googleMap?.animateCamera(CameraUpdateFactory.newLatLngZoom(location, 16f))
            }
        }
    }

    private fun onCreateDialogView(inflater: LayoutInflater?): View {
        binding = DataBindingUtil.inflate(inflater!!, R.layout.fragment_edit_address, null, false)
        binding.address = address
        return binding.root
    }

    override fun onCreateDialog(savedInstanceState: Bundle?): Dialog {
        val alertDialogBuilder = AlertDialog.Builder(requireActivity())
        if (address != null) alertDialogBuilder.setTitle(R.string.edit_address_dialog_title) else alertDialogBuilder.setTitle(R.string.add_address_dialog_title)
        val view = onCreateDialogView(requireActivity().layoutInflater)
        onViewCreated(view, null)
        alertDialogBuilder.setView(view)
        mapFragment = requireActivity().supportFragmentManager.findFragmentById(R.id.map) as SupportMapFragment?
        mapFragment!!.getMapAsync(this)
        binding.textTitle.addTextChangedListener(object : TextWatcher {
            override fun onTextChanged(s: CharSequence, start: Int, before: Int, count: Int) {
                val dialog = dialog as AlertDialog?
                dialog!!.getButton(AlertDialog.BUTTON_POSITIVE).isEnabled = s.toString().trim { it <= ' ' }.isNotEmpty()
            }

            override fun beforeTextChanged(s: CharSequence, start: Int, count: Int, after: Int) {}
            override fun afterTextChanged(s: Editable) {}
        })
        alertDialogBuilder.setPositiveButton(R.string.alert_ok) { _: DialogInterface?, _: Int ->
            if(address != null) {
                viewModel.updateAddress(address!!.id, binding.textTitle.text.toString(), binding.textAddress.text.toString(), googleMap!!.cameraPosition.target)
            } else {
                viewModel.createAddress(binding.textTitle.text.toString(), binding.textAddress.text.toString(), googleMap!!.cameraPosition.target)
            }
        }
        alertDialogBuilder.setNegativeButton(R.string.alert_cancel) { dialog: DialogInterface?, _: Int ->
            dialog?.dismiss()
        }
        return alertDialogBuilder.create()
    }

    override fun onPause() {
        if (mapFragment != null && activity != null) requireActivity().supportFragmentManager.beginTransaction().remove(mapFragment!!).commitAllowingStateLoss()
        super.onPause()
    }

    override fun onResume() {
        super.onResume()
        val dialog = dialog as AlertDialog?
        dialog!!.getButton(AlertDialog.BUTTON_POSITIVE).isEnabled = false
    }

    override fun onMapReady(googleMap: GoogleMap) {
        this.googleMap = googleMap
        if (ActivityCompat.checkSelfPermission(
                requireContext(),
                Manifest.permission.ACCESS_FINE_LOCATION
            ) != PackageManager.PERMISSION_GRANTED && ActivityCompat.checkSelfPermission(
                requireContext(),
                Manifest.permission.ACCESS_COARSE_LOCATION
            ) != PackageManager.PERMISSION_GRANTED
        ) {
            return
        }
        googleMap.isMyLocationEnabled = true
        if (address != null) googleMap.animateCamera(CameraUpdateFactory.newLatLngZoom(LatLng(address!!.location.lat, address!!.location.lng), 16f))
    }


    companion object {
        private const val ARG_ADDRESS_ID = "address_id"
        fun newInstance(id: String?): EditAddressDialog {
            try {
                val fragment = EditAddressDialog()
                val args = Bundle()
                if(id != null) args.putString(ARG_ADDRESS_ID, id)
                fragment.arguments = args
                return fragment
            } catch (exception: Exception) {
                Log.e("unable to start dialog", exception.stackTrace.toString())
                return EditAddressDialog()
            }


        }
    }
}