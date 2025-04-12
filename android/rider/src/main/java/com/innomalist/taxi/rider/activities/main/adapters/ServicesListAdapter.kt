package com.innomalist.taxi.rider.activities.main.adapters

import android.view.LayoutInflater
import android.view.MotionEvent
import android.view.ViewGroup
import androidx.recyclerview.selection.ItemDetailsLookup
import androidx.recyclerview.selection.SelectionTracker
import androidx.recyclerview.widget.RecyclerView
import com.bumptech.glide.Glide
import com.innomalist.taxi.rider.Config
import com.innomalist.taxi.rider.databinding.ItemServiceBinding
import com.minimal.taxi.rider.CalculateFareMutation
import java.text.NumberFormat
import java.util.*

class ServicesListAdapter(private val services: List<CalculateFareMutation.Service1>,
                          private var currency: String) : RecyclerView.Adapter<ServicesListAdapter.ViewHolder>() {
    var tracker: SelectionTracker<Long>? = null

    init {
        setHasStableIds(true)
    }

    class ViewHolder(var binding: ItemServiceBinding) : RecyclerView.ViewHolder(binding.root) {
        fun bind(service: CalculateFareMutation.Service1, currency: String, selected: Boolean = false) {
            binding.item = service
            Glide.with(binding.image).load(Config.Backend + service.media.address).into(binding.image)
            binding.rootView.alpha = if (selected) 1.0f else 0.7f
            updatePrice(service, currency)
            binding.executePendingBindings()
        }

        fun getItemDetails(): ItemDetailsLookup.ItemDetails<Long> = object : ItemDetailsLookup.ItemDetails<Long>() {
            override fun getSelectionKey(): Long {
                return itemId
            }

            override fun getPosition(): Int {
                return adapterPosition
            }

            override fun inSelectionHotspot(e: MotionEvent): Boolean {
                return true
            }
        }

        private fun updatePrice(service: CalculateFareMutation.Service1, currency: String) {
            val formatter: NumberFormat = NumberFormat.getCurrencyInstance()
            formatter.currency = Currency.getInstance(currency)
            val cost: Double = service.cost
            binding.textCost.text = formatter.format(cost)
        }
    }

    override fun getItemId(position: Int): Long {
        return services[position].id.toLong()
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val layoutInflater = LayoutInflater.from(parent.context)
        val itemBinding = ItemServiceBinding.inflate(layoutInflater, parent, false)
        itemBinding.textCost.isSelected = true
        return ViewHolder(itemBinding)
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        val service = services[position]
        tracker?.let {
            holder.bind(service, currency ,it.isSelected(service.id.toLong()))
        }
    }

    override fun getItemCount(): Int {
        return services.size
    }

}