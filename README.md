# JyDevice

A new flutter plugin project.

## Getting Started

```dart
import 'package:JyDevice/JyDevice.dart';

JyDeviceInfo deviceInfo = await JyDevice.deviceInfo;

print(deviceInfo.brand)
print(deviceInfo.model)
print(deviceInfo.serialNumber)
print(deviceInfo.androidSdkInt)

```