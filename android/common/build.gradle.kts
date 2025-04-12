plugins {
    id("com.android.library")
    kotlin("android")
    kotlin("kapt")
}

android {
    compileSdk = 31
    buildToolsVersion = "30.0.3"
    defaultConfig {
        minSdk = 21
        targetSdk = 30
    }
    buildTypes {
        getByName("release") {
            isMinifyEnabled = false
            proguardFiles(getDefaultProguardFile("proguard-android-optimize.txt"), "proguard-rules.pro")
        }
    }
    buildFeatures {
        dataBinding = true
    }
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_1_8
        targetCompatibility = JavaVersion.VERSION_1_8
    }
    kotlinOptions {
        jvmTarget = "1.8"
    }
}

dependencies {

    val lifecycleVersion = "2.4.0"
    //Lifecycle components
    api("androidx.lifecycle:lifecycle-runtime-ktx:2.4.0")
    api("androidx.lifecycle:lifecycle-viewmodel-ktx:$lifecycleVersion")
    implementation("androidx.lifecycle:lifecycle-livedata-ktx:$lifecycleVersion")
    implementation("androidx.lifecycle:lifecycle-viewmodel-savedstate:$lifecycleVersion")
    implementation("androidx.lifecycle:lifecycle-common-java8:$lifecycleVersion")
    implementation("androidx.lifecycle:lifecycle-reactivestreams-ktx:$lifecycleVersion")

    // Apollo GraphQL
    val apolloVer = "3.0.0-beta03"
    api("com.apollographql.apollo3:apollo-runtime:$apolloVer")
    api("com.apollographql.apollo3:apollo-normalized-cache:$apolloVer")
    api("com.apollographql.apollo3:apollo-normalized-cache-sqlite:$apolloVer")
    api("com.apollographql.apollo3:apollo-adapters:$apolloVer")

    api("androidx.recyclerview:recyclerview-selection:1.1.0")
    api("androidx.constraintlayout:constraintlayout:2.1.2")
    api("com.google.android.material:material:1.4.0")
    api("com.google.android.gms:play-services-maps:18.0.0")
    api("com.google.android.gms:play-services-location:18.0.0")
    api(platform("com.google.firebase:firebase-bom:28.4.0"))
    api("com.google.firebase:firebase-messaging-ktx")
    api("com.google.firebase:firebase-analytics-ktx")
    api("com.google.firebase:firebase-crashlytics-ktx")
    api("com.firebaseui:firebase-ui-auth:8.0.0")
    api("com.google.maps.android:android-maps-utils:2.3.0")
    api("io.github.medyo:android-about-page:2.0.0")
    api("de.psdev.licensesdialog:licensesdialog:2.2.0")
    api("com.github.tylersuehr7:empty-state-recyclerview:1.0.4")
    api("com.github.yalantis:ucrop:2.2.7")
    api("com.github.esafirm:android-image-picker:3.0.0-beta1")
    api("com.github.bumptech.glide:glide:4.12.0")
    api("com.github.tapadoo:alerter:7.2.4")
    api("com.github.vitalyster:Chatkit:dependency_updates-SNAPSHOT")
    api("com.github.MAXDeliveryNG:slideview:1.1.1")
    api("com.airbnb.android:lottie:4.2.2")
    api("androidx.preference:preference-ktx:1.1.1")
    api("androidx.core:core-ktx:1.7.0")
    api("org.jetbrains.kotlin:kotlin-stdlib:1.6.0")
    api("org.jetbrains.kotlin:kotlin-reflect:1.6.0")
    api("org.jetbrains.kotlin:kotlin-script-runtime:1.6.0")

    val coroutinesVer = "1.5.2"
    api("org.jetbrains.kotlinx:kotlinx-coroutines-core:$coroutinesVer")
    api("org.jetbrains.kotlinx:kotlinx-coroutines-android:$coroutinesVer")
    api("org.jetbrains.kotlinx:kotlinx-coroutines-play-services:$coroutinesVer")

    api("com.android.volley:volley:1.2.1")

    api("com.google.dagger:hilt-android:2.40.1")
}

