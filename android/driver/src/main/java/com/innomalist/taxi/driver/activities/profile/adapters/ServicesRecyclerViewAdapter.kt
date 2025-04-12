//package com.innomalist.taxi.driver.activities.profile.adapters
//
//import android.view.LayoutInflater
//import android.view.ViewGroup
//import android.widget.CompoundButton
//import androidx.recyclerview.widget.RecyclerView
//import com.innomalist.taxi.common.models.Service
//import com.innomalist.taxi.driver.databinding.ItemServiceBinding
//
//class ServicesRecyclerViewAdapter(private val services: List<Service>) : RecyclerView.Adapter<ServicesRecyclerViewAdapter.ViewHolder>() {
//
//    class ViewHolder(private var binding: ItemServiceBinding) : RecyclerView.ViewHolder(binding.root) {
//        fun bind(service: Service) {
//            binding.service = service
//            binding.checkbox.setOnCheckedChangeListener { _: CompoundButton?, isChecked: Boolean -> //TODO:DO The service selection here }
//            binding.executePendingBindings()
//        }
//
//    }
//
//    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
//        val layoutInflater = LayoutInflater.from(parent.context)
//        val itemBinding = ItemServiceBinding.inflate(layoutInflater, parent, false)
//        return ViewHolder(itemBinding)
//    }
//
//    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
//        val service = services[position]
//        holder.bind(service, listener)
//    }
//
//    override fun getItemCount(): Int {
//        return services.size
//    }
//}