package com.innomalist.taxi.rider.activities.profile

import android.util.Log
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.apollographql.apollo3.api.ApolloResponse
import com.apollographql.apollo3.exception.ApolloException
import com.innomalist.taxi.common.ViewState
import com.innomalist.taxi.rider.activities.profile.repository.ProfileRepository
import com.minimal.taxi.rider.GetRiderQuery
import com.minimal.taxi.rider.UpdateProfileMutation
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class ProfileActivityViewModel @Inject() constructor(
    private val repository: ProfileRepository
): ViewModel() {
    private val _profile by lazy { MutableLiveData<ViewState<ApolloResponse<GetRiderQuery.Data>>>() }
    val profile: LiveData<ViewState<ApolloResponse<GetRiderQuery.Data>>>
        get() = _profile

    private val _updateResult by lazy { MutableLiveData<ViewState<ApolloResponse<UpdateProfileMutation.Data>>>() }
    val updateResult: LiveData<ViewState<ApolloResponse<UpdateProfileMutation.Data>>>
        get() = _updateResult

    fun getProfile() = viewModelScope.launch {
        _profile.postValue(ViewState.Loading())
        try {
            val response = repository.getProfile()
            _profile.postValue(ViewState.Success(response))
        } catch (e: ApolloException) {
            Log.e("ApolloException", "Failure", e)
            _profile.postValue(ViewState.Error("ApolloException Occurred. Check Logs for details"))
        }
    }

    fun updateProfile(input: UpdateProfileMutation) = viewModelScope.launch {
        _updateResult.postValue(ViewState.Loading())
        try {
            val response = repository.updateProfile(input)
            _updateResult.postValue(ViewState.Success(response))
        } catch (e: ApolloException) {
            Log.e("ApolloException", "Failure", e)
            _updateResult.postValue(ViewState.Error("ApolloException Occurred. Check Logs for details"))
        }
    }
}