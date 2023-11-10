import 'package:flutter/services.dart';
class MyCardVerify {
  static const platform = MethodChannel('samples.flutter.dev/battery');
  Future<String> onCreate() async {
    try {
      final result = await platform.invokeMethod('onCreate');
      return result.toString();
    } on PlatformException catch (e) {
      throw PlatformException(message: e.message, code: '');
    }
  }
  Future<String> onReadMyKad() async {
    try {
      final result = await platform.invokeMethod('onReadMyKad');
      return result.toString();
    } on PlatformException catch (e) {
      throw PlatformException(message: e.message, code: '');
    }
  }
  Future<String> onFingerprintVerify() async {
    try {
      final result = await platform.invokeMethod('onFingerprintVerify');
      return result.toString();
    } on PlatformException catch (e) {
      throw PlatformException(message: e.message, code: '');
    }
  }
  Future<String> onFingerprintVerify2() async {
    try {
      final result = await platform.invokeMethod('onFingerprintVerify2');
      return result.toString();
    } on PlatformException catch (e) {
      throw PlatformException(message: e.message, code: '');
    }
  }
}