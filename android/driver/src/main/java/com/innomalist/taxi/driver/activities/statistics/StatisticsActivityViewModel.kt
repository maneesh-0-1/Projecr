package com.innomalist.taxi.driver.activities.statistics

import android.util.Log
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.apollographql.apollo3.exception.ApolloException
import com.innomalist.taxi.common.ViewState
import com.innomalist.taxi.driver.activities.statistics.repository.StatisticsRepository
import com.minimal.taxi.driver.GetStatsQuery
import com.minimal.taxi.driver.type.TimeQuery
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.launch
import java.lang.Exception
import javax.inject.Inject

@HiltViewModel
class StatisticsActivityViewModel @Inject() constructor(
    private val repository: StatisticsRepository
): ViewModel() {
    private val _stats by lazy { MutableLiveData<ViewState<GetStatsQuery.GetStats>>() }
    val stats: LiveData<ViewState<GetStatsQuery.GetStats>>
        get() = _stats

    fun syncStats(timeFrame: TimeQuery) = viewModelScope.launch {
        _stats.postValue(ViewState.Loading())
        try {
            val response = repository.getStats(timeFrame)
            val stats = response.data?.getStats ?: throw Exception()
            _stats.postValue(ViewState.Success(stats))
        } catch (e: ApolloException) {
            Log.e("ApolloException", "Failure", e)
            _stats.postValue(ViewState.Error("ApolloException Occurred. Check Logs for details"))
        }
    }
}