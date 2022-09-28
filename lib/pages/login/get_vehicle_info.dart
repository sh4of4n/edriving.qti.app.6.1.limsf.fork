import 'dart:convert';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:edriving_qti_app/common_library/utils/app_localizations.dart';
import 'package:edriving_qti_app/common_library/utils/custom_button.dart';
import 'package:edriving_qti_app/common_library/utils/custom_dialog.dart';
import 'package:edriving_qti_app/common_library/utils/uppercase_formatter.dart';
import 'package:edriving_qti_app/utils/local_storage.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../router.gr.dart';

class GetVehicleInfo extends StatefulWidget {
  final String type;
  GetVehicleInfo({Key? key, required this.type}) : super(key: key);

  @override
  _GetVehicleInfoState createState() => _GetVehicleInfoState();
}

class _GetVehicleInfoState extends State<GetVehicleInfo> {
  final _formKey = GlobalKey<FormState>();
  final localStorage = LocalStorage();
  final customDialog = CustomDialog();
  final groupIdController = TextEditingController();
  final plateNoController = TextEditingController();
  final carNoController = TextEditingController();
  final merchantNoController = TextEditingController();
  final groupIdFocus = FocusNode();
  final plateNoFocus = FocusNode();
  final carNoFocus = FocusNode();
  final merchantNoFocus = FocusNode();

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? qrController;
  bool showCameraIcon = true;
  bool showQR = false;

  @override
  void initState() {
    super.initState();

    //getSavedInfo();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      qrController?.pauseCamera();
    } else if (Platform.isIOS) {
      qrController?.resumeCamera();
    }
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 200.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Colors.red,
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: scanArea,
      ),
    );
  }

  Future<void> _onQRViewCreated(QRViewController qrController) async {
    setState(() {
      this.qrController = qrController;
    });
    await qrController.resumeCamera();
    qrController.scannedDataStream.listen((scanData) async {
      await qrController.pauseCamera();

      try {
        setState(() {
          groupIdController.text =
              jsonDecode(scanData.code!)['Table1'][0]['group_id'];
          carNoController.text =
              jsonDecode(scanData.code!)['Table1'][0]['car_no'];
          plateNoController.text =
              jsonDecode(scanData.code!)['Table1'][0]['plate_no'];
          merchantNoController.text =
              jsonDecode(scanData.code!)['Table1'][0]['merchant_no'];
          showCameraIcon = true;
          showQR = false;
        });
      } catch (e) {
        customDialog.show(
          barrierDismissable: true,
          context: context,
          content: AppLocalizations.of(context)!.translate('invalid_qr'),
          customActions: [
            TextButton(
              onPressed: () {
                context.router.pop();

                qrController.resumeCamera();
              },
              child: Text('Ok'),
            ),
          ],
          type: DialogType.GENERAL,
        );
      }
    });
  }

  @override
  void dispose() {
    groupIdController.dispose();
    plateNoController.dispose();
    carNoController.dispose();
    groupIdFocus.dispose();
    plateNoFocus.dispose();
    carNoFocus.dispose();
    qrController?.dispose();
    super.dispose();
  }

  getSavedInfo() async {
    groupIdController.text = await localStorage.getEnrolledGroupId() ?? '';
    plateNoController.text = await localStorage.getPlateNo() ?? '';
    carNoController.text = await localStorage.getCarNo() ?? '';
    merchantNoController.text = await localStorage.getMerchantDbCode() ?? '';
  }

  _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      FocusScope.of(context).requestFocus(new FocusNode());

      localStorage.saveEnrolledGroupId(groupIdController.text);
      localStorage.saveCarNo(carNoController.text.replaceAll(' ', ''));
      localStorage.savePlateNo(plateNoController.text.replaceAll(' ', ''));
      localStorage
          .saveMerchantDbCode(merchantNoController.text.replaceAll(' ', ''));
      localStorage.saveType(widget.type);
      if (widget.type == "RPK") {
        context.router.pushAndPopUntil(HomePageRpk(), predicate: (r) => false);
      } else if (widget.type == "Jalan Raya") {
        context.router.pushAndPopUntil(Home(), predicate: (r) => false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Get Vehicle Info'),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    width: 1300.w,
                    margin: EdgeInsets.symmetric(vertical: 30.h),
                    child: TextFormField(
                      inputFormatters: [UpperCaseTextFormatter()],
                      focusNode: groupIdFocus,
                      controller: groupIdController,
                      decoration: InputDecoration(
                        labelText: 'Group ID',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            WidgetsBinding.instance.addPostFrameCallback(
                                (_) => groupIdController.clear());
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Group ID is required.';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    width: 1300.w,
                    margin: EdgeInsets.symmetric(vertical: 30.h),
                    child: TextFormField(
                      inputFormatters: [UpperCaseTextFormatter()],
                      focusNode: carNoFocus,
                      controller: carNoController,
                      decoration: InputDecoration(
                        labelText: 'Car No',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            WidgetsBinding.instance.addPostFrameCallback(
                                (_) => carNoController.clear());
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Car no is required.';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    width: 1300.w,
                    margin: EdgeInsets.symmetric(vertical: 30.h),
                    child: TextFormField(
                      inputFormatters: [UpperCaseTextFormatter()],
                      focusNode: plateNoFocus,
                      controller: plateNoController,
                      decoration: InputDecoration(
                        labelText: 'Plate No',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            WidgetsBinding.instance.addPostFrameCallback(
                                (_) => plateNoController.clear());
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Plate no is required.';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    width: 1300.w,
                    margin: EdgeInsets.symmetric(vertical: 30.h),
                    child: TextFormField(
                      inputFormatters: [UpperCaseTextFormatter()],
                      focusNode: merchantNoFocus,
                      controller: merchantNoController,
                      decoration: InputDecoration(
                        labelText: 'Permit No',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            WidgetsBinding.instance.addPostFrameCallback(
                                (_) => merchantNoController.clear());
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Permit No is required.';
                        }
                        return null;
                      },
                    ),
                  ),
                  Visibility(
                    visible: showQR,
                    child: Container(
                      width: 300,
                      height: 300,
                      child: _buildQrView(context),
                    ),
                  ),
                  Visibility(
                    visible: showCameraIcon,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 100.h),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            showQR = true;
                            showCameraIcon = false;
                          });
                        },
                        iconSize: 250,
                        icon: Icon(Icons.camera_alt),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 30.h),
                    child: CustomButton(
                      onPressed: _submit,
                      buttonColor: Color(0xffdd0e0e),
                      title: 'Save',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
