plugins {
    id("com.android.application")
    id("com.google.gms.google-services")
    id("com.google.firebase.crashlytics")
    kotlin("android")
    kotlin("kapt")
    id("com.apollographql.apollo3")
    id("dagger.hilt.android.plugin")
    id("kotlin-android")
}

android {
    compileSdk = 31
    buildToolsVersion = "31.0.0"
    defaultConfig {
        applicationId = "com.minimal.taxi.driver"
        minSdk = 21
        targetSdk = 30
        versionCode = 100
        versionName = "4.0.4"
    }
    apollo {
        schemaFile.set(file("./src/main/graphql/schema.graphqls"))
        packageName.set("com.minimal.taxi.driver")
        customScalarsMapping.set(mapOf(
            "Timestamp" to "java.util.Date"
        ))
    }
    signingConfigs {
//        release {
//            storeFile file(RELEASE_STORE_FILE)
//            storePassword RELEASE_STORE_PASSWORD
//            keyAlias RELEASE_KEY_ALIAS
//            keyPassword RELEASE_KEY_PASSWORD
//        }
//        buildTypes {
//            getByName("release") {
//                signingConfig signingConfigs.release
//            }
//        }
    }
    buildTypes {
        getByName("debug") {
            configure<com.google.firebase.crashlytics.buildtools.gradle.CrashlyticsExtension> {
                mappingFileUploadEnabled = false
            }
        }
        getByName("release") {
            isMinifyEnabled = false
            proguardFiles(getDefaultProguardFile("proguard-android.txt"), "proguard-rules.pro")
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
    api(project(":common"))
    val hiltVersion = "2.40.1"

    api("com.diogobernardino:williamchart:3.11.0")
    kapt("com.google.dagger:hilt-compiler:$hiltVersion")
    implementation("com.google.dagger:hilt-android:$hiltVersion")
}
kapt {
    correctErrorTypes = true
}
hilt {
    enableAggregatingTask = true
}