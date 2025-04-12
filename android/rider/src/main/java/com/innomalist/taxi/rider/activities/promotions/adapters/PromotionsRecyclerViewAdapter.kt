package com.innomalist.taxi.rider.activities.promotions.adapters

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.innomalist.taxi.common.utils.daysUntil
import com.innomalist.taxi.rider.R
import com.innomalist.taxi.rider.databinding.ItemPromotionBinding
import com.minimal.taxi.rider.GetAnnouncementsQuery
import java.util.*

class PromotionsRecyclerViewAdapter(private val promotions: List<GetAnnouncementsQuery.Edge>) : RecyclerView.Adapter<PromotionsRecyclerViewAdapter.ViewHolder>() {

    class ViewHolder(var binding: ItemPromotionBinding) : RecyclerView.ViewHolder(binding.root) {
        fun bind(promotion: GetAnnouncementsQuery.Edge) {
            binding.item = promotion.node
            binding.textLeft.text = itemView.context.getString(R.string.coupon_days_left, promotion.node.expireAt.daysUntil())
            binding.executePendingBindings()
        }
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val layoutInflater = LayoutInflater.from(parent.context)
        val itemBinding = ItemPromotionBinding.inflate(layoutInflater, parent, false)
        return ViewHolder(itemBinding)
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        val promotion = promotions[position]
        holder.bind(promotion)
    }

    override fun getItemCount(): Int {
        return promotions.size
    }
}