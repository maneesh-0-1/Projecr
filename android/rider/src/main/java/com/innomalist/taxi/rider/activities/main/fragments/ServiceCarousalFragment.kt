package com.innomalist.taxi.rider.activities.main.fragments

import android.content.Context
import android.os.Bundle
import android.view.Gravity
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.fragment.app.activityViewModels
import androidx.recyclerview.selection.SelectionPredicates
import androidx.recyclerview.selection.SelectionTracker
import androidx.recyclerview.selection.StableIdKeyProvider
import androidx.recyclerview.selection.StorageStrategy
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import androidx.recyclerview.widget.SnapHelper
import com.innomalist.taxi.rider.activities.main.MainActivityViewModel
import com.innomalist.taxi.rider.activities.main.adapters.ServiceItemLookup
import com.innomalist.taxi.rider.activities.main.adapters.ServicesListAdapter
import com.innomalist.taxi.rider.ui.gravitySnapHelper.GravitySnapHelper
import com.minimal.taxi.rider.CalculateFareMutation

class ServiceCarousalFragment : Fragment() {
    private val viewModel: MainActivityViewModel by activityViewModels()
    private var services: List<CalculateFareMutation.Service1> = listOf()
    private var currency: String = ""
    private var mListener: OnServicesCarousalFragmentListener? = null
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        if (arguments != null) {
            val categoryId = requireArguments().getString(ARG_CATEGORY_ID)
            this.services = viewModel.fareResult.value?.value?.data?.calculateFare?.services?.first { it.id == categoryId }?.services ?: return
            currency = requireArguments().getString(ARG_CURRENCY, "")
        }
    }

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View {
        val recyclerView = RecyclerView(requireContext())
        recyclerView.layoutManager = LinearLayoutManager(context, LinearLayoutManager.HORIZONTAL, false)
        val snapHelper: SnapHelper = GravitySnapHelper(Gravity.START)
        snapHelper.attachToRecyclerView(recyclerView)
        val adapter = ServicesListAdapter(services, currency)
        recyclerView.adapter = adapter
        val tracker = SelectionTracker.Builder(
                "mySelection",
                recyclerView,
                StableIdKeyProvider(recyclerView),
                ServiceItemLookup(recyclerView),
                StorageStrategy.createLongStorage()
        ).withSelectionPredicate(SelectionPredicates.createSelectSingleAnything()).build()
        tracker.addObserver(object : SelectionTracker.SelectionObserver<Long>() {
            override fun onSelectionChanged() {
                if (tracker.hasSelection()) {
                    mListener?.onServiceSelected(services.first { it.id.toLong() == tracker.selection.first() }, currency)
                } else {
                    mListener?.onServiceSelected(null, currency)
                }
                super.onSelectionChanged()

            }
        })
        if (services.isNotEmpty())
            tracker.select(services.first().id.toLong())
        adapter.tracker = tracker
        return recyclerView
    }

    override fun onAttach(context: Context) {
        super.onAttach(context)
        mListener = if (context is OnServicesCarousalFragmentListener) {
            context
        } else {
            throw RuntimeException("$context must implement OnServicesCarousalFragmentListener")
        }
    }

    override fun onDetach() {
        super.onDetach()
        mListener = null
    }

    interface OnServicesCarousalFragmentListener {
        fun onServiceSelected(service: CalculateFareMutation.Service1?, currency: String)
    }

    companion object {
        private const val ARG_CATEGORY_ID = "categoryId"
        private const val ARG_CURRENCY = "currency"
        fun newInstance(categoryId: String, currency: String): ServiceCarousalFragment {
            val fragment = ServiceCarousalFragment()
            val args = Bundle()
            args.putString(ARG_CATEGORY_ID, categoryId)
            args.putString(ARG_CURRENCY, currency)
            fragment.arguments = args
            return fragment
        }
    }
}