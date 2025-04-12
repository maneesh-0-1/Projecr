package com.innomalist.taxi.rider.activities.main

import android.util.Log
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.apollographql.apollo3.api.ApolloResponse
import com.apollographql.apollo3.exception.ApolloException
import com.google.android.gms.maps.model.LatLng
import com.innomalist.taxi.common.ViewState
import com.innomalist.taxi.rider.activities.main.repository.MainActivityRepository
import com.innomalist.taxi.rider.activities.profile.repository.ProfileRepository
import com.minimal.taxi.rider.*
import com.minimal.taxi.rider.fragment.BasicProfile
import com.minimal.taxi.rider.fragment.CurrentOrder
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class MainActivityViewModel @Inject constructor(
    private val repository: MainActivityRepository,
    private val profileRepository: ProfileRepository
): ViewModel() {
    private val _driversLocation by lazy { MutableLiveData<ViewState<ApolloResponse<GetDriversLocationQuery.Data>>>() }
    val driversLocation: LiveData<ViewState<ApolloResponse<GetDriversLocationQuery.Data>>>
        get() = _driversLocation

    private val _fareResult by lazy { MutableLiveData<ViewState<ApolloResponse<CalculateFareMutation.Data>>>() }
    val fareResult: LiveData<ViewState<ApolloResponse<CalculateFareMutation.Data>>>
        get() = _fareResult

    private val _requestService by lazy { MutableLiveData<ViewState<ApolloResponse<CreateOrderMutation.Data>>>() }
    val requestService: LiveData<ViewState<ApolloResponse<CreateOrderMutation.Data>>>
        get() = _requestService

    private val _addresses by lazy { MutableLiveData<ViewState<ApolloResponse<GetAddressesQuery.Data>>>()}
    val addresses: LiveData<ViewState<ApolloResponse<GetAddressesQuery.Data>>>
        get() = _addresses

    private val _currentOrder by lazy { MutableLiveData<ViewState<CurrentOrder?>>() }
    val currentOrder: LiveData<ViewState<CurrentOrder?>>
        get() = _currentOrder

    private val _profile by lazy { MutableLiveData<BasicProfile>() }
    val profile: LiveData<BasicProfile>
        get() = _profile

    fun fetchDriversLocation(location: LatLng) = viewModelScope.launch {
        _driversLocation.postValue(ViewState.Loading())
        try {
            val response = repository.getDriversInArea(location)
            _driversLocation.postValue(ViewState.Success(response))
        } catch (e: ApolloException) {
            Log.e("ApolloException", "Failure", e)
            _driversLocation.postValue(ViewState.Error("ApolloException Occurred. Check Logs for details"))
        }
    }

    fun fetchProfile() = viewModelScope.launch {
        val profile = profileRepository.getProfile().data?.rider?.basicProfile ?: return@launch
        _profile.postValue(profile)
    }

    fun calculateFare(points: List<LatLng>) = viewModelScope.launch {
        _fareResult.postValue(ViewState.Loading())
        try {
            val response = repository.getFare(points)
            _fareResult.postValue(ViewState.Success(response))
        } catch(e: ApolloException) {
            Log.e("ApolloException", "Failure", e)
            _fareResult.postValue(ViewState.Error("ApolloException Occurred. Check Logs for details"))
        }
    }

    fun requestService(points: List<LatLng>, serviceId: Int, intervalMinutes: Int, addresses: List<String>) = viewModelScope.launch {
        _requestService.postValue(ViewState.Loading())
        try {
            val response = repository.requestService(serviceId, points, intervalMinutes, addresses)
            _requestService.postValue(ViewState.Success(response))
        } catch(e: ApolloException) {
            Log.e("ApolloException", "Failure", e)
            _requestService.postValue(ViewState.Error("ApolloException Occurred. Check Logs for details"))
        }
    }

    fun getAddresses() = viewModelScope.launch {
        _addresses.postValue(ViewState.Loading())
        try {
            val response = repository.getAddresses()
            _addresses.postValue(ViewState.Success(response))
        } catch(e: ApolloException) {
            Log.e("ApolloException", "Failure", e)
            _addresses.postValue(ViewState.Error("ApolloException Occurred. Check Logs for details"))
        }
    }

    fun getCurrentOrder() = viewModelScope.launch {
        _currentOrder.postValue(ViewState.Loading())
        try {
            val response = repository.getCurrentRequest().data?.currentOrderWithLocation?.order?.currentOrder
            _currentOrder.postValue(ViewState.Success(response))
        } catch(e: ApolloException) {
            Log.e("ApolloException", "Failure", e)
            _currentOrder.postValue(ViewState.Error("ApolloException Occurred. Check Logs for details"))
        }
    }
}