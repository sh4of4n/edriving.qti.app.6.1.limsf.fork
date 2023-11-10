import 'package:auto_route/auto_route.dart';
import 'package:edriving_qti_app/utils/mykad_verify.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
          ElevatedButton(
            onPressed: () {
              getBatteryLevel();
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
        ],
      ),
    );
  }
}