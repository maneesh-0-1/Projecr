package com.innomalist.taxi.rider.activities.transactions.adapters

import android.content.Context
import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.innomalist.taxi.rider.databinding.ItemTransactionBinding
import com.minimal.taxi.rider.TransactionsQuery
import java.text.NumberFormat
import java.text.SimpleDateFormat
import java.util.*

class TransactionsRecyclerViewAdapter(private val transactions: List<TransactionsQuery.Node>) : RecyclerView.Adapter<TransactionsRecyclerViewAdapter.ViewHolder>() {
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val layoutInflater = LayoutInflater.from(parent.context)
        val itemBinding = ItemTransactionBinding.inflate(layoutInflater, parent, false)
        return ViewHolder(itemBinding)
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        val transaction = transactions[position]
        holder.bind(transaction)
    }

    override fun getItemCount(): Int {
        return transactions.size
    }

    class ViewHolder(var binding: ItemTransactionBinding) : RecyclerView.ViewHolder(binding.root) {
        fun bind(transaction: TransactionsQuery.Node) {
            binding.item = transaction
            val format: NumberFormat = NumberFormat.getCurrencyInstance()
            format.currency = Currency.getInstance(transaction.currency)
            binding.textAmount.text = format.format(transaction.amount)
            //TODO: Better localization
            binding.textTitle.text = transaction.action.rawValue
            binding.titleDay.text = SimpleDateFormat("dd", Locale.getDefault()).format(transaction.createdAt)
            binding.titleMonth.text = SimpleDateFormat("MMM", Locale.getDefault()).format(transaction.createdAt)
            binding.executePendingBindings()
        }

    }

}

