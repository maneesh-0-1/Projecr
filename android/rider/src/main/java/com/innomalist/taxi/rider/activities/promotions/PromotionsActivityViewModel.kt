package com.innomalist.taxi.rider.activities.promotions

import android.util.Log
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.apollographql.apollo3.api.ApolloResponse
import com.apollographql.apollo3.exception.ApolloException
import com.innomalist.taxi.common.ViewState
import com.innomalist.taxi.rider.activities.promotions.repository.PromotionsRepository
import com.minimal.taxi.rider.GetAnnouncementsQuery
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class PromotionsActivityViewModel @Inject() constructor(private val repository: PromotionsRepository): ViewModel() {
    private val _promotions by lazy { MutableLiveData<ViewState<ApolloResponse<GetAnnouncementsQuery.Data>>>() }
    val promotions: LiveData<ViewState<ApolloResponse<GetAnnouncementsQuery.Data>>>
        get() = _promotions

    fun getPromotions() = viewModelScope.launch {
        _promotions.postValue(ViewState.Loading())
        try {
            val response = repository.getPromotions()
            _promotions.postValue(ViewState.Success(response))
        } catch(e: ApolloException) {
            Log.e("ApolloException", "Failure", e)
            _promotions.postValue(ViewState.Error("ApolloException Occurred. Check Logs for details"))
        }
    }
}