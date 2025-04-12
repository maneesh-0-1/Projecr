package com.innomalist.taxi.driver.activities.transactions

import android.os.Bundle
import androidx.activity.viewModels
import androidx.databinding.DataBindingUtil
import androidx.recyclerview.widget.LinearLayoutManager
import com.innomalist.taxi.common.R
import com.innomalist.taxi.common.ViewState
import com.innomalist.taxi.common.activities.transactions.adapters.TransactionsRecyclerViewAdapter
import com.innomalist.taxi.common.components.BaseActivity
import com.innomalist.taxi.common.databinding.ActivityTransactionsBinding
import com.innomalist.taxi.driver.activities.transactions.TransactionViewModel
import com.tylersuehr.esr.ContentItemLoadingStateFactory
import com.tylersuehr.esr.EmptyStateRecyclerView
import com.tylersuehr.esr.ImageTextStateDisplay
import dagger.hilt.android.AndroidEntryPoint

@AndroidEntryPoint
class TransactionsActivity : BaseActivity() {
    lateinit var binding: ActivityTransactionsBinding
    private val viewModel: TransactionViewModel by viewModels()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = DataBindingUtil.setContentView(this@TransactionsActivity, R.layout.activity_transactions)
        initializeToolbar(R.string.drawer_transactions)
        binding.recyclerView.setStateDisplay(EmptyStateRecyclerView.STATE_LOADING, ContentItemLoadingStateFactory.newListLoadingState(this))
        binding.recyclerView.setStateDisplay(EmptyStateRecyclerView.STATE_EMPTY, ImageTextStateDisplay(this, R.drawable.empty_state, getString(R.string.empty_state_title), getString(R.string.empty_state_message)))
        binding.recyclerView.setStateDisplay(EmptyStateRecyclerView.STATE_ERROR, ImageTextStateDisplay(this, R.drawable.empty_state, getString(R.string.empty_state_error_title), getString(R.string.empty_state_error_message)))
        listenLiveData()
        this.viewModel.syncTransactions()
    }

    private fun listenLiveData() {
        this.viewModel.transactions.observe(this) {
            when(it) {
                is ViewState.Error -> binding.recyclerView.invokeState(EmptyStateRecyclerView.STATE_ERROR)
                is ViewState.Loading -> binding.recyclerView.invokeState(EmptyStateRecyclerView.STATE_LOADING)
                is ViewState.Success -> {
                    val items = it.value ?: return@observe
                    if (items.isEmpty()) {
                        binding.recyclerView.invokeState(EmptyStateRecyclerView.STATE_EMPTY)
                        return@observe
                    }
                    binding.recyclerView.invokeState(EmptyStateRecyclerView.STATE_OK)
                    val transactionsRecyclerViewAdapter = TransactionsRecyclerViewAdapter(items, this)
                    val llm = LinearLayoutManager(this@TransactionsActivity)
                    llm.orientation = LinearLayoutManager.VERTICAL
                    binding.recyclerView.setHasFixedSize(true)
                    binding.recyclerView.layoutManager = llm
                    binding.recyclerView.adapter = transactionsRecyclerViewAdapter
                }
            }
        }
    }
}