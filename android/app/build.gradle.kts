plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.mapadefinitivo"
    compileSdk = 35
    ndkVersion = "27.0.12077973" // Requiere NDK 27 por dependencias

    defaultConfig {
        applicationId = "com.example.mapadefinitivo"
        minSdk = 23
        targetSdk = 35
        versionCode = 1
        versionName = "1.0"
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = "11"
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")

            // ⚠️ Desactiva shrink y minify si no estás usando ProGuard u optimización
            isMinifyEnabled = false
            isShrinkResources = false

            // Deja esto como referencia por si luego activas optimización
            // proguardFiles(getDefaultProguardFile("proguard-android-optimize.txt"), "proguard-rules.pro")
        }
    }
}

flutter {
    source = "../.."
}
