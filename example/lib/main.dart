import 'dart:async';

import 'package:JyDevice/JyDevice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  JyDeviceInfo _deviceInfo;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    JyDeviceInfo deviceInfo;
    try {
      deviceInfo = await JyDevice.deviceInfo;
    } on PlatformException {
      deviceInfo = null;
    }
    if (!mounted) return;

    setState(() {
      _deviceInfo = deviceInfo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: ${_deviceInfo?.serialNumber ?? "UNKNOWN"}\n'),
        ),
      ),
    );
  }
}
