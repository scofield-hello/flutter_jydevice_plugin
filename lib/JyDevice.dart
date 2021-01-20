import 'dart:async';

import 'package:flutter/services.dart';

class JyDeviceInfo {
  String brand;
  String model;
  int androidSdkInt;
  String serialNumber;

  JyDeviceInfo({this.brand, this.model, this.androidSdkInt, this.serialNumber});
}

class JyDevice {
  static const MethodChannel _channel = const MethodChannel('JyDevice');

  static Future<JyDeviceInfo> get deviceInfo async {
    final dynamic result = await _channel.invokeMethod('getDeviceInfo');
    return JyDeviceInfo(
        brand: result['brand'],
        model: result['model'],
        androidSdkInt: result['androidSdkInt'],
        serialNumber: result['serialNumber']);
  }
}
