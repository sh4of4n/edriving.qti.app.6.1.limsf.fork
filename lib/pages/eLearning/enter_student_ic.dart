import 'package:auto_route/auto_route.dart';
// import 'package:barcode_scan/barcode_scan.dart';
import 'package:edriving_qti_app/common_library/services/repository/auth_repository.dart';
import 'package:edriving_qti_app/utils/constants.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:edriving_qti_app/common_library/utils/app_localizations.dart';
import '../../router.gr.dart';

class LearningEnterStudentIC extends StatefulWidget {
  @override
  _LearningEnterStudentICState createState() => _LearningEnterStudentICState();
}

class _LearningEnterStudentICState extends State<LearningEnterStudentIC> {
  String barcode = "";
  final primaryColor = ColorConstant.primaryColor;
  final myImage = ImagesConstant();
  final authRepo = AuthRepo();
  final _formKey = GlobalKey<FormState>();
  final _ic = TextEditingController();

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
      setState(() => this.barcode =
          'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Container(
                  width: ScreenUtil().setWidth(1000),
                  child: ElevatedButton(
                    onPressed: () {
                      context.router.push(
                        StartLearning(studentIC: _ic.text),
                      );
                      //Navigator.pushNamed(context, RsmRpkTab);
                    },
                    child: Text(
                      AppLocalizations.of(context)!.translate('scan_lbl'),
                      style: (TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(50),
                ),
                Text('OR'),
                SizedBox(
                  height: ScreenUtil().setHeight(50),
                ),
                Center(
                  child: Wrap(
                    children: <Widget>[
                      Container(
                        width: ScreenUtil().setWidth(800),
                        height: ScreenUtil().setHeight(400),
                        child: TextFormField(
                          controller: _ic,
                          decoration: new InputDecoration(
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 11, right: 15),
                            hintText: AppLocalizations.of(context)!
                                .translate('ic_lbl'),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppLocalizations.of(context)!
                                  .translate('ic_required_msg');
                            }
                            return null;
                          },
                          onSaved: (value) {
                            if (value != _ic.text) {
                              _ic.text = value!;
                            }
                          },
                        ),
                      ),
                      Container(
                        child: Card(
                          color: Colors.grey[300],
                          child: IconButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                context.router.push(
                                  StartLearning(studentIC: _ic.text),
                                );
                              }
                            },
                            icon: Icon(Icons.arrow_forward),
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
      ),
    );
  }
}
