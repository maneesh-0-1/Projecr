import org.gradle.kotlin.dsl.apply
import org.gradle.kotlin.dsl.dependencies
import org.gradle.kotlin.dsl.kotlin
import org.gradle.kotlin.dsl.*
import org.jetbrains.kotlin.config.KotlinCompilerVersion

plugins {
    id("com.android.application")
    id("com.apollographql.apollo3")
    id("dagger.hilt.android.plugin")
    id("com.google.gms.google-services")
    id("com.google.firebase.crashlytics")
    kotlin("android")
    kotlin("kapt")
    id("kotlin-android")
}

android {
    compileSdk = 31
    buildToolsVersion = "31.0.0"
    defaultConfig {
        applicationId = "com.minimal.taxi.rider"
        minSdk = 21
        targetSdk = 30
        versionCode = 100
        versionName = "4.0.4"
    }
    apollo {
        schemaFile.set(file("./src/main/graphql/schema.graphqls"))
        packageName.set("com.minimal.taxi.rider")
        customScalarsMapping.set(mapOf(
            "Timestamp" to "java.util.Date"
        ))
    }

    signingConfigs {
        create("release") {
            keyAlias = "upload"
            keyPassword = "2920847AB"
            storePassword = "2920847AB"
            storeFile = file("../keystore.jks")
        }
    }
    buildTypes {
        getByName("debug") {
            configure<com.google.firebase.crashlytics.buildtools.gradle.CrashlyticsExtension> {
                mappingFileUploadEnabled = false          // to disable mapping file uploads (default=true if minifying)
                nativeSymbolUploadEnabled = true         // to enable NDK symbol file uploading (default=false)
                unstrippedNativeLibsDir = "path/to/libs" // optional override to change the default unstripped native library path, only used in NDK builds
            }
        }
        getByName("release") {
            isMinifyEnabled = false
            proguardFiles(getDefaultProguardFile("proguard-android.txt"), "proguard-rules.pro")
            signingConfig = signingConfigs.getByName("release")
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
    implementation("com.github.Innomalist:floatingsearchview:0.3")
    implementation("com.google.maps.android:places-ktx:1.0.0")
    implementation("com.google.dagger:hilt-android:$hiltVersion")
    kapt("com.google.dagger:hilt-compiler:$hiltVersion")
}
kapt {
    correctErrorTypes = true
}
hilt {
    enableAggregatingTask = true
}