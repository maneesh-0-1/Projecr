package com.innomalist.taxi.driver.di

import com.innomalist.taxi.driver.activities.chargeAccount.WalletActivityViewModel
import com.innomalist.taxi.driver.activities.chargeAccount.repository.WalletRepository
import com.innomalist.taxi.driver.activities.chargeAccount.repository.WalletRepositoryImpl
import com.innomalist.taxi.driver.activities.chat.repository.ChatRepository
import com.innomalist.taxi.driver.activities.chat.repository.ChatRepositoryImpl
import com.innomalist.taxi.driver.activities.main.repository.MainActivityRepository
import com.innomalist.taxi.driver.activities.main.repository.MainActivityRepositoryImpl
import com.innomalist.taxi.driver.activities.profile.repository.ProfileRepository
import com.innomalist.taxi.driver.activities.profile.repository.ProfileRepositoryImpl
import com.innomalist.taxi.driver.activities.splash.repository.LoginRepository
import com.innomalist.taxi.driver.activities.splash.repository.LoginRepositoryImpl
import com.innomalist.taxi.driver.activities.statistics.repository.StatisticsRepository
import com.innomalist.taxi.driver.activities.statistics.repository.StatisticsRepositoryImpl
import com.innomalist.taxi.driver.activities.transactions.repository.TransactionsRepository
import com.innomalist.taxi.driver.activities.transactions.repository.TransactionsRepositoryImpl
import com.innomalist.taxi.driver.activities.travel.repository.TravelRepository
import com.innomalist.taxi.driver.activities.travel.repository.TravelRepositoryImpl
import com.innomalist.taxi.driver.activities.travels.repository.OrderHistoryRepository
import com.innomalist.taxi.driver.activities.travels.repository.OrderHistoryRepositoryImpl
import com.innomalist.taxi.driver.activities.waitingForPayment.repository.WaitingForPaymentRepository
import com.innomalist.taxi.driver.activities.waitingForPayment.repository.WaitingForPaymentRepositoryImpl
import dagger.Binds
import dagger.Module
import dagger.hilt.InstallIn
import dagger.hilt.android.components.ViewModelComponent
import dagger.hilt.android.scopes.ViewModelScoped

@Module
@InstallIn(ViewModelComponent::class)
abstract class ViewModelModule {
    @Binds
    @ViewModelScoped
    abstract fun bindLogin(repo: LoginRepositoryImpl): LoginRepository

    @Binds
    @ViewModelScoped
    abstract fun bindMain(repo: MainActivityRepositoryImpl): MainActivityRepository

    @Binds
    @ViewModelScoped
    abstract fun bindWallet(repo: WalletRepositoryImpl): WalletRepository

    @Binds
    @ViewModelScoped
    abstract fun bindChat(repo: ChatRepositoryImpl): ChatRepository

    @Binds
    @ViewModelScoped
    abstract fun bindProfile(repo: ProfileRepositoryImpl): ProfileRepository

    @Binds
    @ViewModelScoped
    abstract fun bindStatistics(repo: StatisticsRepositoryImpl): StatisticsRepository

    @Binds
    @ViewModelScoped
    abstract fun bindTransactions(repo: TransactionsRepositoryImpl): TransactionsRepository

    @Binds
    @ViewModelScoped
    abstract fun bindTravel(repo: TravelRepositoryImpl): TravelRepository

    @Binds
    @ViewModelScoped
    abstract fun bindOrderHistory(repo: OrderHistoryRepositoryImpl): OrderHistoryRepository

    @Binds
    @ViewModelScoped
    abstract fun bindWaitingForPayment(repo: WaitingForPaymentRepositoryImpl): WaitingForPaymentRepository

    @Binds
    @ViewModelScoped
    abstract fun bindLocation(repo: LocationRepositoryImpl): LocationRepository
}