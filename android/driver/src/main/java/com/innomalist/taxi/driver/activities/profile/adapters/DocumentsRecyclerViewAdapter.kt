package com.innomalist.taxi.driver.activities.profile.adapters

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.bumptech.glide.Glide
import com.innomalist.taxi.driver.Config
import com.innomalist.taxi.driver.activities.profile.IDocumentEvent
import com.innomalist.taxi.driver.databinding.ItemDocumentBinding
import com.minimal.taxi.driver.GetDriverQuery

class DocumentsRecyclerViewAdapter(var documents: List<GetDriverQuery.Document>, val listener: IDocumentEvent) : RecyclerView.Adapter<DocumentsRecyclerViewAdapter.ViewHolder>() {

    class ViewHolder(var binding: ItemDocumentBinding) : RecyclerView.ViewHolder(binding.root) {
        fun bind(media: GetDriverQuery.Document, listener: IDocumentEvent) {
            Glide.with(binding.image).load(Config.Backend + media.address).into(binding.image)
            binding.image.setOnClickListener { listener.onClicked(media) }
            binding.executePendingBindings()
        }

    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val layoutInflater = LayoutInflater.from(parent.context)
        val itemBinding = ItemDocumentBinding.inflate(layoutInflater, parent, false)
        return ViewHolder(itemBinding)
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        val media = documents[position]
        holder.bind(media, listener)
    }

    override fun getItemCount(): Int {
        return documents.size
    }


}