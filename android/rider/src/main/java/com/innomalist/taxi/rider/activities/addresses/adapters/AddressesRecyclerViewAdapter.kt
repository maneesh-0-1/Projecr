package com.innomalist.taxi.rider.activities.addresses.adapters

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.innomalist.taxi.rider.databinding.ItemAddressBinding
import com.minimal.taxi.rider.GetAddressesQuery

class AddressesRecyclerViewAdapter(private val addresses: List<GetAddressesQuery.RiderAddress>, private val listener: OnAddressItemInteractionListener) : RecyclerView.Adapter<AddressesRecyclerViewAdapter.ViewHolder>() {

    class ViewHolder(var binding: ItemAddressBinding) : RecyclerView.ViewHolder(binding.root) {
        fun bind(address: GetAddressesQuery.RiderAddress, listener: OnAddressItemInteractionListener) {
            binding.address = address
            binding.buttonEdit.setOnClickListener { listener.onEdit(address.id) }
            binding.buttonDelete.setOnClickListener { listener.onDelete(address.id) }
            binding.executePendingBindings()
        }
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val layoutInflater = LayoutInflater.from(parent.context)
        val itemBinding = ItemAddressBinding.inflate(layoutInflater, parent, false)
        return ViewHolder(itemBinding)
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        val address = addresses[position]
        holder.bind(address, listener)
    }

    override fun getItemCount(): Int {
        return addresses.size
    }

    interface OnAddressItemInteractionListener {
        fun onEdit(id: String)
        fun onDelete(id: String)
    }

}