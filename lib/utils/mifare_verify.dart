import 'package:flutter/services.dart';
class MyCardVerify {
  static const platform = MethodChannel('samples.flutter.dev/battery');
  Future<String> onCreate2() async {
    try {
      final result = await platform.invokeMethod('onCreate2');
      return result.toString();
    } on PlatformException catch (e) {
      throw PlatformException(message: e.message, code: '');
    }
  }
  Future<String> enumerate() async {
    try {
      final result = await platform.invokeMethod('enumerate');
      return result.toString();
    } on PlatformException catch (e) {
      throw PlatformException(message: e.message, code: '');
    }
  }
  Future<String> connection() async {
    try {
      final result = await platform.invokeMethod('connection');
      return result.toString();
    } on PlatformException catch (e) {
      throw PlatformException(message: e.message, code: '');
    }
  }
  Future<String> morphoDeviceVerifyWithFile() async {
    try {
      final result = await platform.invokeMethod('morphoDeviceVerifyWithFile');
      return result.toString();
    } on PlatformException catch (e) {
      throw PlatformException(message: e.message, code: '');
    }
  }
}