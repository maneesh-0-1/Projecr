package com.innomalist.taxi.rider.activities.travels.adapters

import android.content.Context
import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.innomalist.taxi.common.utils.DistanceFormatter
import com.innomalist.taxi.rider.databinding.ItemTravelBinding
import com.minimal.taxi.rider.fragment.HistoryOrderItem
import java.text.NumberFormat
import java.text.SimpleDateFormat
import java.util.*

class TravelsRecyclerViewAdapter(private val context: Context, private val requests: List<HistoryOrderItem.Edge>, private val listener: OnTravelItemInteractionListener) : RecyclerView.Adapter<TravelsRecyclerViewAdapter.ViewHolder>() {
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val layoutInflater = LayoutInflater.from(parent.context)
        val itemBinding = ItemTravelBinding.inflate(layoutInflater, parent, false)
        return ViewHolder(itemBinding)
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        val request = requests[position]
        holder.bind(request.node, listener, context)
    }

    override fun getItemCount(): Int {
        return requests.size
    }

    interface OnTravelItemInteractionListener {
        fun onHideTravel(request: HistoryOrderItem.Node)
        fun onWriteComplaint(request: HistoryOrderItem.Node)
    }

    class ViewHolder(var binding: ItemTravelBinding) : RecyclerView.ViewHolder(binding.root) {
        fun bind(request: HistoryOrderItem.Node, listener: OnTravelItemInteractionListener, context: Context) {
            binding.item = request
            //binding.buttonHideTravel.setOnClickListener { listener.onHideTravel(request) }
            binding.buttonComplaint.setOnClickListener { listener.onWriteComplaint(request) }
            binding.textFrom.isSelected = true
            binding.textTo.isSelected = true
            binding.textRequestDate.text = SimpleDateFormat("MMM d, yyyy", Locale.getDefault()).format(request.createdOn)
            binding.textRequestTime.text = SimpleDateFormat("hh:mm aaa", Locale.getDefault()).format(request.createdOn)
            if (request.finishTimestamp != null) {
                binding.textFinishDate.text = SimpleDateFormat("MMM d, yyyy", Locale.getDefault()).format(request.finishTimestamp)
                binding.textFinishTime.text = SimpleDateFormat("hh:mm aaa", Locale.getDefault()).format(request.finishTimestamp)
            }
            val format: NumberFormat = NumberFormat.getCurrencyInstance()
            format.currency = Currency.getInstance(request.currency)
            binding.textDetailsCost.text = format.format(request.costAfterCoupon)
            binding.textDetailsDistance.text = DistanceFormatter.format(request.distanceBest)
            /*var mapUrl = "https://maps.googleapis.com/maps/api/staticmap?size=600x400&language=${Locale.getDefault().displayLanguage}&${request.points.joinToString("&") { "markers=color:blue|label:${request.points.indexOf(it) + 1}|${it.latitude},${it.longitude}" }}&key=${context.getString(R.string.google_maps_key)}"
            if (request.log != null && request.log!!.isNotEmpty()) mapUrl += "&path=weight:3|color:orange|enc:" + request.log
            request.imageUrl = mapUrl*/
            val res = context.resources
            //TODO: Map status to correct values
            binding.textStatus.text = request.status.rawValue
            binding.executePendingBindings()
        }

    }

}