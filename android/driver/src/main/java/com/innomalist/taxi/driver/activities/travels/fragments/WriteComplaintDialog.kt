package com.innomalist.taxi.common.activities.travels.fragments

import android.app.Dialog
import android.content.Context
import android.content.DialogInterface
import android.os.Bundle
import android.text.Editable
import android.text.TextWatcher
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.appcompat.app.AlertDialog
import androidx.databinding.DataBindingUtil
import androidx.fragment.app.DialogFragment
import androidx.fragment.app.activityViewModels
import com.innomalist.taxi.driver.R
import com.innomalist.taxi.driver.activities.travels.OrderHistoryViewModel
import com.innomalist.taxi.driver.databinding.DialogWriteComplaintBinding

class WriteComplaintDialog : DialogFragment() {
    lateinit var binding: DialogWriteComplaintBinding
    private val viewModel: OrderHistoryViewModel by activityViewModels()

    fun onCreateDialogView(inflater: LayoutInflater?, container: ViewGroup?, savedInstanceState: Bundle?): View {
        binding = DataBindingUtil.inflate(inflater!!, R.layout.dialog_write_complaint, container, false)
        return binding.root
    }

    override fun onCreateDialog(savedInstanceState: Bundle?): Dialog {
        val alertDialogBuilder = AlertDialog.Builder(requireActivity())
        alertDialogBuilder.setTitle(R.string.write_complaint)
        val view = onCreateDialogView(requireActivity().layoutInflater, null, null)
        onViewCreated(view, null)
        alertDialogBuilder.setView(view)
        binding.textContent.addTextChangedListener(object : TextWatcher {
            override fun onTextChanged(s: CharSequence, start: Int, before: Int, count: Int) {
                val dialog = dialog as AlertDialog?
                dialog!!.getButton(AlertDialog.BUTTON_POSITIVE).isEnabled = s.toString().trim { it <= ' ' }.isNotEmpty()
            }

            override fun beforeTextChanged(s: CharSequence, start: Int, count: Int, after: Int) {}
            override fun afterTextChanged(s: Editable) {}
        })
        alertDialogBuilder.setPositiveButton(getString(R.string.alert_ok)) { _: DialogInterface?, _: Int ->
            val orderId =
                arguments?.getString(ARG_REQUEST_ID) ?: throw Exception("Internal error")
            this.viewModel.writeComplaint(orderId, binding.textSubject.text.toString(), binding.textContent.text.toString())
            dialog?.dismiss()
        }
        alertDialogBuilder.setNegativeButton(getString(R.string.alert_cancel)) { _: DialogInterface?, _: Int ->
            dialog?.dismiss()
        }
        return alertDialogBuilder.create()
    }

    companion object {
        private const val ARG_REQUEST_ID = "request"
        fun newInstance(id: String): WriteComplaintDialog {
            val fragment = WriteComplaintDialog()
            val args = Bundle()
            args.putString(ARG_REQUEST_ID, id)
            fragment.arguments = args
            return fragment
        }
    }
}