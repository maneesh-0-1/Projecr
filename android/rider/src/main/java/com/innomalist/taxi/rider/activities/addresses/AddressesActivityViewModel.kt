package com.innomalist.taxi.rider.activities.addresses

import android.util.Log
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.apollographql.apollo3.api.ApolloResponse
import com.apollographql.apollo3.exception.ApolloException
import com.google.android.gms.maps.model.LatLng
import com.innomalist.taxi.common.ViewState
import com.innomalist.taxi.rider.activities.addresses.repository.AddressesRepository
import com.innomalist.taxi.rider.di.LocationRepository
import com.minimal.taxi.rider.CreateAddressMutation
import com.minimal.taxi.rider.DeleteAddressMutation
import com.minimal.taxi.rider.GetAddressesQuery
import com.minimal.taxi.rider.UpdateAddressMutation
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class AddressesActivityViewModel @Inject() constructor(private val repository: AddressesRepository, private val locationRepository: LocationRepository): ViewModel() {
    private val _addresses by lazy { MutableLiveData<ViewState<ApolloResponse<GetAddressesQuery.Data>>>() }
    val addresses: LiveData<ViewState<ApolloResponse<GetAddressesQuery.Data>>>
        get() = _addresses

    private val _updateAddressResult by lazy { MutableLiveData<ViewState<ApolloResponse<UpdateAddressMutation.Data>>>() }
    val updateAddressResult: LiveData<ViewState<ApolloResponse<UpdateAddressMutation.Data>>>
        get() = _updateAddressResult

    private val _createAddressResult by lazy { MutableLiveData<ViewState<ApolloResponse<CreateAddressMutation.Data>>>() }
    val createAddressResult: LiveData<ViewState<ApolloResponse<CreateAddressMutation.Data>>>
        get() = _createAddressResult

    private val _deleteAddressResult by lazy { MutableLiveData<ViewState<ApolloResponse<DeleteAddressMutation.Data>>>() }
    val deleteAddressResult: LiveData<ViewState<ApolloResponse<DeleteAddressMutation.Data>>>
        get() = _deleteAddressResult

    private val _currentLocation by lazy { MutableLiveData<LatLng?>() }
    val currentLocation: LiveData<LatLng?>
        get() = _currentLocation

    fun getAddresses() = viewModelScope.launch {
        _addresses.postValue(ViewState.Loading())
        try {
            val response = repository.getAddresses()
            _addresses.postValue(ViewState.Success(response))
        } catch (e: ApolloException) {
            Log.e("ApolloException", "Failure", e)
            _addresses.postValue(ViewState.Error("ApolloException Occurred. Check Logs for details"))
        }
    }

    fun createAddress(title: String, details: String, location: LatLng) = viewModelScope.launch {
        _createAddressResult.postValue(ViewState.Loading())
        try {
            val response = repository.createAddress(title, details, location)
            _createAddressResult.postValue(ViewState.Success(response))
            getAddresses()
        } catch (e: ApolloException) {
            Log.e("ApolloException", "Failure", e)
            _createAddressResult.postValue(ViewState.Error("ApolloException Occurred. Check Logs for details"))
        }
    }

    fun updateAddress(id: String, title: String, details: String, location: LatLng) = viewModelScope.launch {
        _updateAddressResult.postValue(ViewState.Loading())
        try {
            val response = repository.updateAddress(id, title, details, location)
            _updateAddressResult.postValue(ViewState.Success(response))
            getAddresses()
        } catch (e: ApolloException) {
            Log.e("ApolloException", "Failure", e)
            _updateAddressResult.postValue(ViewState.Error("ApolloException Occurred. Check Logs for details"))
        }
    }

    fun deleteAddress(id: String) = viewModelScope.launch {
        _deleteAddressResult.postValue(ViewState.Loading())
        try {
            val response = repository.deleteAddress(id)
            _deleteAddressResult.postValue(ViewState.Success(response))
            getAddresses()
        } catch (e: ApolloException) {
            Log.e("ApolloException", "Failure", e)
            _deleteAddressResult.postValue(ViewState.Error("ApolloException Occurred. Check Logs for details"))
        }
    }

    fun getCurrentLocation() = viewModelScope.launch {
        val location = locationRepository.getCurrentLocation()
        location?.let {
            _currentLocation.postValue(LatLng(it.latitude, it.longitude))
        }
    }
}