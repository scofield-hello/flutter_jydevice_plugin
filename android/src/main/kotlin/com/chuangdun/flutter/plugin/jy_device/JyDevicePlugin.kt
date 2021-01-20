package com.chuangdun.flutter.plugin.jy_device

import android.os.Build
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** JyDevicePlugin */
class JyDevicePlugin: FlutterPlugin, MethodCallHandler {

  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "JyDevice")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "getDeviceInfo") {
      val brand = Build.BRAND
      val model = Build.MODEL
      val serialNumber = Build.SERIAL
      val androidSdkInt = Build.VERSION.SDK_INT
      val deviceInfoMap = mutableMapOf<String, Any>()
      deviceInfoMap["brand"] = brand
      deviceInfoMap["model"] = model
      deviceInfoMap["serialNumber"] = serialNumber
      deviceInfoMap["androidSdkInt"] = androidSdkInt
      result.success(deviceInfoMap)
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
