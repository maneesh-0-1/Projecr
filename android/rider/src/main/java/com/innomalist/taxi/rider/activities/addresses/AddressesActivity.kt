package com.innomalist.taxi.rider.activities.addresses

import android.os.Bundle
import android.view.Menu
import android.view.MenuItem
import androidx.activity.viewModels
import androidx.databinding.DataBindingUtil
import androidx.recyclerview.widget.LinearLayoutManager
import com.google.android.gms.maps.model.LatLng
import com.innomalist.taxi.common.ViewState
import com.innomalist.taxi.common.components.BaseActivity
import com.innomalist.taxi.common.interfaces.AlertDialogEvent
import com.innomalist.taxi.common.utils.AlertDialogBuilder
import com.innomalist.taxi.common.utils.AlertDialogBuilder.DialogResult
import com.innomalist.taxi.common.utils.AlertDialogBuilder.show
import com.innomalist.taxi.common.utils.LocationHelper.Companion.doubleArrayToLatLng
import com.innomalist.taxi.rider.R
import com.innomalist.taxi.rider.activities.addresses.adapters.AddressesRecyclerViewAdapter
import com.innomalist.taxi.rider.activities.addresses.adapters.AddressesRecyclerViewAdapter.OnAddressItemInteractionListener
import com.innomalist.taxi.rider.activities.addresses.fragments.EditAddressDialog
import com.innomalist.taxi.rider.databinding.ActivityAddressesBinding
import com.tylersuehr.esr.ContentItemLoadingStateFactory
import com.tylersuehr.esr.EmptyStateRecyclerView
import com.tylersuehr.esr.ImageTextStateDisplay
import dagger.hilt.android.AndroidEntryPoint

@AndroidEntryPoint
class AddressesActivity : BaseActivity() {
    private val viewModel: AddressesActivityViewModel by viewModels()
    lateinit var binding: ActivityAddressesBinding
    var currentLocation: LatLng? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = DataBindingUtil.setContentView(this@AddressesActivity, R.layout.activity_addresses)
        if(intent.getDoubleArrayExtra("currentLocation") != null) {
            currentLocation = doubleArrayToLatLng(intent.getDoubleArrayExtra("currentLocation")!!)
        }
        initializeToolbar(getString(R.string.drawer_favorite_locations))
        binding.recyclerView.setStateDisplay(EmptyStateRecyclerView.STATE_LOADING, ContentItemLoadingStateFactory.newListLoadingState(this))
        binding.recyclerView.setStateDisplay(EmptyStateRecyclerView.STATE_EMPTY, ImageTextStateDisplay(this, com.innomalist.taxi.common.R.drawable.empty_state, getString(com.innomalist.taxi.common.R.string.empty_state_title), getString(com.innomalist.taxi.common.R.string.empty_state_message)))
        binding.recyclerView.setStateDisplay(EmptyStateRecyclerView.STATE_ERROR, ImageTextStateDisplay(this, com.innomalist.taxi.common.R.drawable.empty_state, getString(com.innomalist.taxi.common.R.string.empty_state_error_title), getString(com.innomalist.taxi.common.R.string.empty_state_error_message)))
        binding.recyclerView.invokeState(EmptyStateRecyclerView.STATE_LOADING)
        listenForLiveData()
        this.viewModel.getAddresses()

    }

    private fun listenForLiveData() {
        this.viewModel.addresses.observe(this) {
            when(it) {
                is ViewState.Loading -> {
                    binding.recyclerView.invokeState(EmptyStateRecyclerView.STATE_LOADING)
                }

                is ViewState.Success -> {
                    val addresses = it.value?.data?.riderAddresses ?: return@observe
                    if (addresses.isEmpty()) {
                        binding.recyclerView.invokeState(EmptyStateRecyclerView.STATE_EMPTY)
                        return@observe
                    }
                    binding.recyclerView.invokeState(EmptyStateRecyclerView.STATE_OK)
                    val addressesRecyclerViewAdapter = AddressesRecyclerViewAdapter(addresses, object : OnAddressItemInteractionListener {
                        override fun onEdit(id: String) {
                            showEditAddressDialog(id)
                        }

                        override fun onDelete(id: String) {
                            show(this@AddressesActivity, getString(R.string.question_delete_address), AlertDialogBuilder.DialogButton.OK_CANCEL, AlertDialogEvent { result: DialogResult ->
                                run {
                                    if (result == DialogResult.OK) {
                                        viewModel.deleteAddress(id)
                                    }
                                }
                            })
                        }
                    })
                    val llm = LinearLayoutManager(this@AddressesActivity)
                    llm.orientation = LinearLayoutManager.VERTICAL
                    llm.isAutoMeasureEnabled = false
                    binding.recyclerView.setHasFixedSize(true)
                    binding.recyclerView.layoutManager = llm
                    binding.recyclerView.adapter = addressesRecyclerViewAdapter
                }
                is ViewState.Error -> {}
            }
        }
    }

    override fun onCreateOptionsMenu(menu: Menu): Boolean {
        menuInflater.inflate(R.menu.actionbar_add, menu)
        return super.onCreateOptionsMenu(menu)
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        //address.location = currentLocation
        showEditAddressDialog(id = null)
        return super.onOptionsItemSelected(item)
    }

    fun showEditAddressDialog(id: String?) {
        val fm = supportFragmentManager
        val editNameDialogFragment: EditAddressDialog = EditAddressDialog.newInstance(id)
        editNameDialogFragment.show(fm, "fragment_edit_name")
    }
}