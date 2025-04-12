package com.innomalist.taxi.driver.di

import android.content.Context
import com.innomalist.taxi.driver.ClientAPI
import com.innomalist.taxi.common.utils.MyPreferenceManager
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.qualifiers.ApplicationContext
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

@Module
@InstallIn(SingletonComponent::class)
class RepoModule {
    @Singleton
    @Provides
    fun provideWebService(@ApplicationContext appContext: Context) = ClientAPI(appContext)

    @Singleton
    @Provides
    fun providePreferenceManager(@ApplicationContext appContext: Context) = MyPreferenceManager(appContext)

    @Singleton
    @Provides
    fun provideLocationService(@ApplicationContext appContext: Context) = LocationProvider(appContext)
}