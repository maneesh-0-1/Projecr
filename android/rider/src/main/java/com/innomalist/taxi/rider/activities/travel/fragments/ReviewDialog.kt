package com.innomalist.taxi.rider.activities.travel.fragments

import android.app.Dialog
import android.content.DialogInterface
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.RatingBar
import android.widget.RatingBar.OnRatingBarChangeListener
import androidx.appcompat.app.AlertDialog
import androidx.databinding.DataBindingUtil
import androidx.fragment.app.DialogFragment
import androidx.fragment.app.activityViewModels
import com.innomalist.taxi.rider.R
import com.innomalist.taxi.rider.activities.travel.TravelActivityViewModel
import com.innomalist.taxi.rider.databinding.FragmentReviewBinding
import com.minimal.taxi.rider.SubmitFeedbackMutation

class ReviewDialog : DialogFragment() {
    private val viewModel: TravelActivityViewModel by activityViewModels()
    lateinit var binding: FragmentReviewBinding

    private fun onCreateDialogView(inflater: LayoutInflater?, container: ViewGroup?): View {
        binding = DataBindingUtil.inflate(inflater!!, R.layout.fragment_review, container, false)
        return binding.root
    }

    override fun onCreateDialog(savedInstanceState: Bundle?): Dialog {
        val alertDialogBuilder = AlertDialog.Builder(requireContext())
        alertDialogBuilder.setTitle(R.string.review_dialog_title)
        val view = onCreateDialogView(requireActivity().layoutInflater, null)
        onViewCreated(view, null)
        alertDialogBuilder.setView(view)
        binding.ratingBar.onRatingBarChangeListener = OnRatingBarChangeListener { _: RatingBar?, _: Float, _: Boolean ->
            val dialog = dialog as AlertDialog?
            dialog!!.getButton(AlertDialog.BUTTON_POSITIVE).isEnabled = true
        }
        alertDialogBuilder.setPositiveButton(getString(R.string.alert_ok)) { _: DialogInterface?, _: Int ->
            run {
                val orderId = this.viewModel.currentOrder.value?.value?.id ?: return@run
                viewModel.submitFeedback(
                    SubmitFeedbackMutation(
                    score = binding.ratingBar.rating.toInt() * 20,
                    orderId = orderId,
                    description = binding.reviewText.text.toString()
                )
                )
            }
        }
        return alertDialogBuilder.create()
    }

    companion object {
        fun newInstance(): ReviewDialog { /*Bundle args = new Bundle();
        args.putSerializable(ARG_ADDRESS, param1);
        fragment.setArguments(args);*/
            return ReviewDialog()
        }
    }
}