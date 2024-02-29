import 'dart:async';
import 'dart:developer' as developer;

import 'package:app_settings/app_settings.dart';
import 'package:auto_route/auto_route.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:edriving_qti_app/common_library/utils/custom_dialog.dart';
import 'package:edriving_qti_app/utils/mykad_verify.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  static const platform = MethodChannel('samples.flutter.dev/battery');
// Get battery level.
  String batteryLevel0 = 'Unknown battery level.';

  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  final customDialog = CustomDialog();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  bool isButtonEnabled = true;

  @override
  void initState() {
    super.initState();
    initConnectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e);
      return;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
      isButtonEnabled = _connectionStatus == ConnectivityResult.wifi;
    });
  }

  Future<void> getBatteryLevel() async {
    String batteryLevel;
    try {
      final result = await platform.invokeMethod<int>('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      batteryLevel0 = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  '\n\nNama: MUHAMAD IRFAN ASYRAF BIN USMAN',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 50,
                  ),
                ),
              ),
            ],
          ),
          Text('Connection Status: ${_connectionStatus.toString()} \n'),
          ElevatedButton(
            onPressed: () {
              isButtonEnabled ?
              getBatteryLevel()
              : customDialog.show(
                context: context,
                content: 'Please connect to wifi before proceed',
                title: const Center(
                  child: Icon(
                    Icons.wifi_off,
                    color: Colors.red,
                    size: 140,
                  ),
                ),
                barrierDismissable: false,
                type: DialogType.GENERAL,
                customActions: [
                  TextButton(
                    onPressed: () {
                      AppSettings.openAppSettings(type: AppSettingsType.wifi);
                    },
                    child: const Text('Settings'),
                  ),
                  TextButton(
                    onPressed: () {
                      context.router.pop();
                    },
                    child: const Text('Ok'),
                  ),
                ],
              );
            },
            child: const Text('Get Battery Level'),
          ),
          Text(batteryLevel0),
          ElevatedButton(
            onPressed: () async {
              try {
                String result = await MyCardVerify().onCreate();
                setState(() {
                  batteryLevel0 = result.toString();
                });
              } on PlatformException catch (e) {
                setState(() {
                  batteryLevel0 = "'${e.message}'.";
                });
              }
            },
            child: const Text('onCreate'),
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                final result =
                    await platform.invokeMethod<String>('onReadMyKad');
                setState(() {
                  batteryLevel0 = result.toString();
                });
              } on PlatformException catch (e) {
                setState(() {
                  batteryLevel0 = "'${e.message}'";
                });
              }
            },
            child: const Text('onReadMyKad'),
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                final result =
                    await platform.invokeMethod<String>('onFingerprintVerify');
                setState(() {
                  batteryLevel0 = result.toString();
                });
                if (result ==
                    'Please place your thumb on the fingerprint reader...') {
                  final result = await platform
                      .invokeMethod<String>('onFingerprintVerify2');
                  setState(() {
                    batteryLevel0 = result.toString();
                  });
                }
              } on PlatformException catch (e) {
                setState(() {
                  batteryLevel0 = "'${e.message}'";
                });
              }
            },
            child: const Text('onFingerprintVerify'),
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                final result = await platform.invokeMethod<String>('onCreate2');
                setState(() {
                  batteryLevel0 = result.toString();
                });
              } on PlatformException catch (e) {
                setState(() {
                  batteryLevel0 = "'${e.message}'.";
                });
              }
            },
            child: const Text('onCreate2'),
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                final result = await platform.invokeMethod<String>('enumerate');
                setState(() {
                  batteryLevel0 = result.toString();
                });
              } on PlatformException catch (e) {
                setState(() {
                  batteryLevel0 = "'${e.message}'.";
                });
              }
            },
            child: const Text('enumerate'),
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                final result =
                    await platform.invokeMethod<String>('connection');
                setState(() {
                  batteryLevel0 = result.toString();
                });
              } on PlatformException catch (e) {
                setState(() {
                  batteryLevel0 = "'${e.message}'.";
                });
              }
            },
            child: const Text('connection'),
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                final result =
                    await platform.invokeMethod<String>('morphoDeviceVerifyWithFile');
                setState(() {
                  batteryLevel0 = result.toString();
                });
              } on PlatformException catch (e) {
                setState(() {
                  batteryLevel0 = "'${e.message}'.";
                });
              }
            },
            child: const Text('morphoDeviceVerifyWithFile'),
          ),
        ],
      ),
    );
  }
}
