package com.innomalist.taxi.driver.activities.splash

import android.util.Log
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.apollographql.apollo3.api.ApolloResponse
import com.apollographql.apollo3.exception.ApolloException
import com.innomalist.taxi.common.ViewState
import com.innomalist.taxi.driver.activities.splash.repository.LoginRepository
import com.minimal.taxi.driver.LoginMutation
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class SplashActivityViewModel @Inject() constructor(
    private val repository: LoginRepository
): ViewModel() {
    private val _loginResult by lazy { MutableLiveData<ViewState<ApolloResponse<LoginMutation.Data>>>() }
    val loginResult: LiveData<ViewState<ApolloResponse<LoginMutation.Data>>>
        get() = _loginResult

    fun login(firebaseToken: String) = viewModelScope.launch {
        _loginResult.postValue(ViewState.Loading())
        try {
            val response = repository.login(firebaseToken)
            _loginResult.postValue(ViewState.Success(response))
        } catch(e: ApolloException) {
            Log.e("ApolloException", "Failure", e)
            _loginResult.postValue(ViewState.Error("ApolloException Occurred. Check Logs for details"))
        }
    }
}