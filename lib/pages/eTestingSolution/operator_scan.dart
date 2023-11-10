import 'package:auto_route/auto_route.dart';
// import 'package:barcode_scan/barcode_scan.dart';
import 'package:edriving_qti_app/common_library/services/repository/auth_repository.dart';
import 'package:edriving_qti_app/utils/constants.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:edriving_qti_app/common_library/utils/app_localizations.dart';
import '../../router.gr.dart';

@RoutePage(name: 'OperatorScanQR')
class OperatorScanQR extends StatefulWidget {
  const OperatorScanQR({super.key});

  @override
  _OperatorScanQRState createState() => _OperatorScanQRState();
}

class _OperatorScanQRState extends State<OperatorScanQR> {
  String barcode = "";
  final primaryColor = ColorConstant.primaryColor;
  final myImage = ImagesConstant();
  final authRepo = AuthRepo();
  String? dropdownValue = 'PNU 5555';
  final iconText = TextStyle(
    fontSize: ScreenUtil().setSp(60),
    color: Colors.black,
  );

  /* Future _scan() async {
    try {
      String barcode = (await BarcodeScanner.scan()) as String;
      setState(() => this.barcode = barcode);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          this.barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => this.barcode = 'Unknown error: $e');
      }
    } on FormatException {
      setState(() =>
      this.barcode =
      'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                width: ScreenUtil().setWidth(1000),
                child: DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Padding(
                    padding: EdgeInsets.only(left: 120),
                    child: Icon(Icons.arrow_downward),
                  ),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.black),
                  underline: Container(
                    height: 2,
                    color: primaryColor,
                  ),
                  onTap: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);

                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                  },
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: <String>['PNU 5555', 'PPP 4444', 'PPP1234', 'PRR 5555']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Center(child: Text(value)),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(200),
              ),
              SizedBox(
                width: ScreenUtil().setWidth(1000),
                child: ElevatedButton(
                  onPressed: () {
                    context.router.push(RpkDrawer());
                    //Navigator.pushNamed(context, RsmRpkTab);
                  },
                  child: Text(
                    AppLocalizations.of(context)!.translate('scan_lbl'),
                    style: (const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(50),
              ),
              const Text('OR'),
              SizedBox(
                height: ScreenUtil().setHeight(50),
              ),
              Center(
                child: Wrap(
                  children: <Widget>[
                    SizedBox(
                      width: ScreenUtil().setWidth(800),
                      height: ScreenUtil().setHeight(400),
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(
                              left: 15, bottom: 11, top: 11, right: 15),
                          hintText: AppLocalizations.of(context)!
                              .translate('enter_student_ic'),
                        ),
                      ),
                    ),
                    Container(
                      child: Card(
                        color: Colors.grey[300],
                        child: IconButton(
                          onPressed: () {
                            context.router.push(RpkDrawer());
                            //Navigator.pushNamed(context, RsmRpkTab);
                          },
                          icon: const Icon(Icons.arrow_forward),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
