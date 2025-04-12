package com.innomalist.taxi.rider.activities.promotions

import android.os.Bundle
import androidx.activity.viewModels
import androidx.databinding.DataBindingUtil
import androidx.recyclerview.widget.LinearLayoutManager
import com.innomalist.taxi.common.ViewState
import com.innomalist.taxi.common.components.BaseActivity
import com.innomalist.taxi.common.utils.AlerterHelper
import com.innomalist.taxi.rider.R
import com.innomalist.taxi.rider.activities.promotions.adapters.PromotionsRecyclerViewAdapter
import com.innomalist.taxi.rider.databinding.ActivityPromotionsBinding
import com.tylersuehr.esr.ContentItemLoadingStateFactory
import com.tylersuehr.esr.EmptyStateRecyclerView
import com.tylersuehr.esr.ImageTextStateDisplay
import dagger.hilt.android.AndroidEntryPoint
import java.lang.Exception
import java.util.*

@AndroidEntryPoint
class PromotionsActivity : BaseActivity() {
    lateinit var binding: ActivityPromotionsBinding
    private val viewModel: PromotionsActivityViewModel by viewModels()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = DataBindingUtil.setContentView(this@PromotionsActivity, R.layout.activity_promotions)
        initializeToolbar(getString(R.string.drawer_promotions))
        binding.recyclerView.setStateDisplay(EmptyStateRecyclerView.STATE_LOADING, ContentItemLoadingStateFactory.newListLoadingState(this))
        binding.recyclerView.setStateDisplay(EmptyStateRecyclerView.STATE_EMPTY, ImageTextStateDisplay(this, com.innomalist.taxi.common.R.drawable.empty_state, getString(R.string.empty_state_title), getString(R.string.empty_state_message)))
        binding.recyclerView.setStateDisplay(EmptyStateRecyclerView.STATE_ERROR, ImageTextStateDisplay(this, com.innomalist.taxi.common.R.drawable.empty_state, getString(R.string.empty_state_error_title), getString(R.string.empty_state_error_message)))
        binding.recyclerView.invokeState(EmptyStateRecyclerView.STATE_LOADING)
        listenLiveData()
        this.viewModel.getPromotions()
    }

    private fun listenLiveData() {
        this.viewModel.promotions.observe(this) {
            when(it) {
                is ViewState.Error -> AlerterHelper.showError(this, it.message)
                is ViewState.Loading -> binding.recyclerView.invokeState(EmptyStateRecyclerView.STATE_LOADING)
                is ViewState.Success -> {
                    val announcements = it.value?.data?.announcements?.edges ?: throw Exception()
                    if (announcements.isEmpty()) {
                        binding.recyclerView.invokeState(EmptyStateRecyclerView.STATE_EMPTY)
                        return@observe
                    }
                    binding.recyclerView.invokeState(EmptyStateRecyclerView.STATE_OK)
                    val promotionsRecyclerViewAdapter = PromotionsRecyclerViewAdapter(announcements)
                    val llm = LinearLayoutManager(this@PromotionsActivity)
                    llm.orientation = LinearLayoutManager.VERTICAL
                    binding.recyclerView.setHasFixedSize(true)
                    binding.recyclerView.layoutManager = llm
                    binding.recyclerView.adapter = promotionsRecyclerViewAdapter
                }
            }
        }
    }
}

