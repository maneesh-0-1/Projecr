package com.innomalist.taxi.driver.activities.profile

import android.util.Log
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.apollographql.apollo3.exception.ApolloException
import com.innomalist.taxi.common.ViewState
import com.innomalist.taxi.driver.activities.profile.repository.ProfileRepository
import com.minimal.taxi.driver.GetDriverQuery
import com.minimal.taxi.driver.UpdateDriverProfileMutation
import com.minimal.taxi.driver.type.UpdateDriverInput
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class ProfileViewModel @Inject() constructor(
    private val repository: ProfileRepository
): ViewModel() {
    private val _profile by lazy { MutableLiveData<ViewState<GetDriverQuery.Driver>>() }
    val profile: LiveData<ViewState<GetDriverQuery.Driver>>
        get() = _profile

    private val _updateResult by lazy { MutableLiveData<ViewState<UpdateDriverProfileMutation.UpdateOneDriver>>() }
    val updateResult: LiveData<ViewState<UpdateDriverProfileMutation.UpdateOneDriver>>
        get() = _updateResult

    fun getProfile() = viewModelScope.launch {
        _profile.postValue(ViewState.Loading())
        try {
            val response = repository.getProfile().data?.driver ?: throw Exception("Profile Not Found")
            _profile.postValue(ViewState.Success(response))
        } catch (e: ApolloException) {
            Log.e("ApolloException", "Failure", e)
            _profile.postValue(ViewState.Error("ApolloException Occurred. Check Logs for details"))
        }
    }

    fun updateProfile(input: UpdateDriverInput, documentIds: List<String>) = viewModelScope.launch {
        _updateResult.postValue(ViewState.Loading())
        val profileId = _profile.value?.value?.id ?: throw Exception("Driver not loaded yet.")
        try {
            val response = repository.updateProfile(UpdateDriverProfileMutation(driverId = profileId, driverUpdate = input, relationIds = documentIds))
            _updateResult.postValue(ViewState.Success(response.dataOrThrow.updateOneDriver))
        } catch (e: ApolloException) {
            Log.e("ApolloException", "Failure", e)
            _updateResult.postValue(ViewState.Error("ApolloException Occurred. Check Logs for details"))
        }
    }
}