package com.delivery.client.di

import com.innomalist.taxi.rider.activities.addresses.repository.AddressesRepository
import com.innomalist.taxi.rider.activities.addresses.repository.AddressesRepositoryImpl
import com.innomalist.taxi.rider.activities.chargeAccount.repository.WalletRepository
import com.innomalist.taxi.rider.activities.chargeAccount.repository.WalletRepositoryImpl
import com.innomalist.taxi.rider.activities.chat.repository.ChatRepository
import com.innomalist.taxi.rider.activities.chat.repository.ChatRepositoryImpl
import com.innomalist.taxi.rider.activities.main.repository.MainActivityRepository
import com.innomalist.taxi.rider.activities.main.repository.MainActivityRepositoryImpl
import com.innomalist.taxi.rider.activities.profile.repository.ProfileRepository
import com.innomalist.taxi.rider.activities.profile.repository.ProfileRepositoryImpl
import com.innomalist.taxi.rider.activities.promotions.repository.PromotionsRepository
import com.innomalist.taxi.rider.activities.promotions.repository.PromotionsRepositoryImpl
import com.innomalist.taxi.rider.activities.splash.repository.LoginRepository
import com.innomalist.taxi.rider.activities.splash.repository.LoginRepositoryImpl
import com.innomalist.taxi.rider.activities.transactions.repository.TransactionsRepository
import com.innomalist.taxi.rider.activities.transactions.repository.TransactionsRepositoryImpl
import com.innomalist.taxi.rider.activities.travel.repository.TravelRepository
import com.innomalist.taxi.rider.activities.travel.repository.TravelRepositoryImpl
import com.innomalist.taxi.rider.activities.travels.repository.OrderHistoryRepository
import com.innomalist.taxi.rider.activities.travels.repository.OrderHistoryRepositoryImpl
import com.innomalist.taxi.rider.di.LocationRepository
import com.innomalist.taxi.rider.di.LocationRepositoryImpl
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
    abstract fun bindMain(repo: MainActivityRepositoryImpl): MainActivityRepository

    @Binds
    @ViewModelScoped
    abstract fun bindSplash(repo: LoginRepositoryImpl): LoginRepository

    @Binds
    @ViewModelScoped
    abstract fun bindCharge(repo: WalletRepositoryImpl): WalletRepository

    @Binds
    @ViewModelScoped
    abstract fun bindChat(repo: ChatRepositoryImpl): ChatRepository

    @Binds
    @ViewModelScoped
    abstract fun bindLooking(repo: TravelRepositoryImpl): TravelRepository

    @Binds
    @ViewModelScoped
    abstract fun bindProfile(repo: ProfileRepositoryImpl): ProfileRepository

    @Binds
    @ViewModelScoped
    abstract fun bindPromotions(repo: PromotionsRepositoryImpl): PromotionsRepository

    @Binds
    @ViewModelScoped
    abstract fun bindTransactions(repo: TransactionsRepositoryImpl): TransactionsRepository

    @Binds
    @ViewModelScoped
    abstract fun bindOrderHistory(repo: OrderHistoryRepositoryImpl): OrderHistoryRepository

    @Binds
    @ViewModelScoped
    abstract fun bindAddresses(repo: AddressesRepositoryImpl): AddressesRepository

    @Binds
    @ViewModelScoped
    abstract fun bindLocation(repo: LocationRepositoryImpl): LocationRepository
}