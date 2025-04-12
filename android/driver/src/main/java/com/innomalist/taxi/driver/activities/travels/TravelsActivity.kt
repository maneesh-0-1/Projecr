package com.innomalist.taxi.driver.activities.travels

import android.os.Bundle
import androidx.activity.viewModels
import androidx.databinding.DataBindingUtil
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.innomalist.taxi.common.R
import com.innomalist.taxi.common.ViewState
import com.innomalist.taxi.common.activities.travels.adapters.TravelsRecyclerViewAdapter
import com.innomalist.taxi.common.activities.travels.adapters.TravelsRecyclerViewAdapter.OnTravelItemInteractionListener
import com.innomalist.taxi.common.activities.travels.fragments.WriteComplaintDialog
import com.innomalist.taxi.common.components.BaseActivity
import com.innomalist.taxi.common.databinding.ActivityTravelsBinding
import com.innomalist.taxi.common.interfaces.AlertDialogEvent
import com.innomalist.taxi.common.utils.AlertDialogBuilder
import com.innomalist.taxi.common.utils.AlertDialogBuilder.DialogResult
import com.innomalist.taxi.common.utils.AlerterHelper
import com.innomalist.taxi.common.utils.LoadingDialog
import com.minimal.taxi.driver.fragment.HistoryOrderItem
import com.tylersuehr.esr.ContentItemLoadingStateFactory
import com.tylersuehr.esr.EmptyStateRecyclerView
import com.tylersuehr.esr.ImageTextStateDisplay
import dagger.hilt.android.AndroidEntryPoint

@AndroidEntryPoint
class TravelsActivity : BaseActivity() {
    lateinit var binding: ActivityTravelsBinding
    val viewModel: OrderHistoryViewModel by viewModels()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = DataBindingUtil.setContentView(this@TravelsActivity, R.layout.activity_travels)
        initializeToolbar(getString(R.string.drawer_travels))
        listenLiveData()
        binding.recyclerView.setStateDisplay(EmptyStateRecyclerView.STATE_LOADING, ContentItemLoadingStateFactory.newListLoadingState(this))
        binding.recyclerView.setStateDisplay(EmptyStateRecyclerView.STATE_EMPTY, ImageTextStateDisplay(this, R.drawable.empty_state, getString(R.string.empty_state_title), getString(R.string.empty_state_message)))
        binding.recyclerView.setStateDisplay(EmptyStateRecyclerView.STATE_ERROR, ImageTextStateDisplay(this, R.drawable.empty_state, getString(R.string.empty_state_error_title), getString(R.string.empty_state_error_message)))
        binding.recyclerView.invokeState(EmptyStateRecyclerView.STATE_LOADING)
        this.viewModel.syncOrders()

    }

    private fun listenLiveData() {
        this.viewModel.complaintSubmissionResult.observe(this) {
            when(it) {
                is ViewState.Error -> LoadingDialog.hide()
                is ViewState.Loading -> {
                    LoadingDialog.display(this)
                }
                is ViewState.Success -> {
                    LoadingDialog.hide()
                    AlerterHelper.showInfo(this@TravelsActivity, getString(R.string.message_complaint_sent))
                }
            }
        }
        this.viewModel.orders.observe(this) {
            when(it) {
                is ViewState.Error -> binding.recyclerView.invokeState(EmptyStateRecyclerView.STATE_ERROR)
                is ViewState.Loading -> binding.recyclerView.invokeState(EmptyStateRecyclerView.STATE_LOADING)
                is ViewState.Success -> {
                    val orders = it.value?.edges ?: throw Exception("Empty Response")
                    if (orders.isEmpty()) {
                        binding.recyclerView.invokeState(EmptyStateRecyclerView.STATE_EMPTY)
                        return@observe
                    }
                    binding.recyclerView.invokeState(EmptyStateRecyclerView.STATE_OK)
                    val adapter = TravelsRecyclerViewAdapter(this@TravelsActivity, orders, object : OnTravelItemInteractionListener {
                        override fun onHideTravel(request: HistoryOrderItem.Node) {
                            AlertDialogBuilder.show(this@TravelsActivity, getString(R.string.question_hide_travel), AlertDialogBuilder.DialogButton.OK_CANCEL, AlertDialogEvent { result: DialogResult ->
                                if (result != DialogResult.OK) {
                                    return@AlertDialogEvent
                                }
                                //TODO: Hide History item option
//                                HideHistoryItem(request.id!!).execute<EmptyClass> {
//                                    AlerterHelper.showInfo(this@TravelsActivity, getString(R.string.info_travel_hidden))
//                                    refreshRequests()
//                                }
                            })
                        }

                        override fun onWriteComplaint(request: HistoryOrderItem.Node) {
                            val fm = supportFragmentManager
                            WriteComplaintDialog.newInstance(request.id).show(fm, "fragment_complaint")
                        }
                    })
                    val llm = LinearLayoutManager(this@TravelsActivity)
                    llm.orientation = RecyclerView.VERTICAL
                    binding.recyclerView.setHasFixedSize(true)
                    binding.recyclerView.layoutManager = llm
                    binding.recyclerView.adapter = adapter
                }
            }
        }
    }
}