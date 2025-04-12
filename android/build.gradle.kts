buildscript {
    val kotlinVersion = "1.6.0"
    repositories {
        maven { url = uri("https://maven.google.com") }
        google()
        mavenCentral()
        maven { url = uri("https://plugins.gradle.org/m2/") }
    }
    dependencies {
        classpath("com.android.tools.build:gradle:7.0.4")
        classpath("com.google.gms:google-services:4.3.10")
        classpath("com.google.firebase:firebase-crashlytics-gradle:2.8.0")
        classpath("com.google.dagger:hilt-android-gradle-plugin:2.40.1")
        classpath("com.apollographql.apollo3:apollo-gradle-plugin:3.0.0-beta03")
        classpath("org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlinVersion")
    }
}

allprojects {
    repositories {
        maven { url = uri("https://maven.google.com") }
        mavenCentral()
        google()
        maven { url = uri("https://jitpack.io") }
    }
}
tasks.register("clean", Delete::class) {
    delete(rootProject.buildDir)
}
