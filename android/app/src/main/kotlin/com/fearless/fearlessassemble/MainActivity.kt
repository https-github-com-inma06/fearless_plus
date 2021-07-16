package com.fearless.fearlessassemble

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build.*

class MainActivity : FlutterActivity() {
  private val CHANNEL = "atanasio.dev/method"

  override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)
    MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->

      when (call.method) {
        "getBatteryLevel" -> {
          val batteryLevel = getBatteryLevel()
          if (batteryLevel != -1) result.success(batteryLevel)
          else result.error("UNAVAILABLE", "Battery level not available.", null)
        }
        "getAndroidVersion" -> {
          val androidVersionCode = getAndroidVersion()
          if (androidVersionCode != null) result.success(androidVersionCode)
          else result.error("UNAVAILABLE", "Android Version not available.", null)
        }
        "getAndroidModelName" -> {
          val modelName = getAndroidModelName()
          if (modelName != null) result.success(modelName)
          else result.error("UNAVAILABLE", "Android deviceName not available.", null)
        }
        else -> result.notImplemented()
      }
    }
  }

  private fun getBatteryLevel(): Int {
    val batteryLevel: Int

    if (VERSION.SDK_INT >= VERSION_CODES.LOLLIPOP) {
      val batteryManager = getSystemService(Context.BATTERY_SERVICE) as BatteryManager
      batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
    } else {
      val intent = ContextWrapper(applicationContext).registerReceiver(null, IntentFilter(Intent.ACTION_BATTERY_CHANGED))
      batteryLevel = intent!!.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100 / intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
    }

    return batteryLevel
  }

  private fun getAndroidVersion(): String {
    return VERSION.RELEASE
  }

  private fun getAndroidModelName(): String {
    return MODEL
  }


}
