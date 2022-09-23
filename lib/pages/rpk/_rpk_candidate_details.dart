import 'dart:convert';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:edriving_qti_app/common_library/services/repository/auth_repository.dart';
import 'package:edriving_qti_app/common_library/services/repository/epandu_repository.dart';
import 'package:edriving_qti_app/common_library/utils/app_localizations.dart';
import 'package:edriving_qti_app/common_library/utils/custom_button.dart';
import 'package:edriving_qti_app/common_library/utils/custom_dialog.dart';
import 'package:edriving_qti_app/common_library/utils/loading_model.dart';
import 'package:edriving_qti_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:edriving_qti_app/utils/local_storage.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../router.gr.dart';

class RpkCandidateDetails extends StatefulWidget {
  @override
  _RpkCandidateDetailsState createState() => _RpkCandidateDetailsState();
}

class _RpkCandidateDetailsState extends State<RpkCandidateDetails> {
  String barcode = "";
  final primaryColor = ColorConstant.primaryColor;
  final localStorage = LocalStorage();
  final myImage = ImagesConstant();
  final authRepo = AuthRepo();
  final epanduRepo = EpanduRepo();
  final customDialog = CustomDialog();
  final textStyle = TextStyle(
    fontSize: 80.sp,
    color: Colors.black,
  );

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? qrController;
  bool iconVisible = true;
  bool isVisible = false;

  var result;
  String? qNo = '';
  String? nric = '';
  String? name = '';
  String? groupId = '';
  String? testCode = '';
  String? vehNo = '';
  String? merchantNo = '';

  List<dynamic>? candidateList = [];
  var selectedCandidate;

  bool isLoading = false;
  int success = 0;

  @override
  void initState() {
    super.initState();

    getPart3AvailableToCallJpjTestList();
  }

  getPart3AvailableToCallJpjTestList() async {
    setState(() {
      isLoading = true;
    });

    String? vehNo = await localStorage.getPlateNo();

    var result =
        await epanduRepo.getRpkAvailableToCallJpjTestList(vehNo: vehNo);

    if (result.isSuccess) {
      setState(() {
        candidateList = result.data;
      });
    } else {
      customDialog.show(
        context: context,
        content: AppLocalizations.of(context)!.translate('no_candidate'),
        type: DialogType.INFO,
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  getSelectedCandidateInfo(queueNo) {
    for (int i = 0; i < candidateList!.length; i += 1) {
      if (candidateList![i].queueNo == queueNo) {
        selectedCandidate = candidateList![i];

        setState(() {
          nric = candidateList![i].nricNo;
          name = candidateList![i].fullname;
        });

        break;
      }
    }
  }

  compareCandidateInfo() async {
    // var merchantNo = selectedCandidate.merchantNo;
    var testCode = selectedCandidate.testCode;
    var groupId = selectedCandidate.groupId;
    var testDate = selectedCandidate.testDate;

    if (this.groupId == groupId) {
      if (this.testCode == testCode) {
        if (success == 0) {
          await callPart3JpjTest();
        }

        context.router
            .push(
          ConfirmCandidateInfo(
            part3Type: 'JALAN RAYA',
            nric: this.nric,
            candidateName: this.name,
            qNo: this.qNo,
            groupId: this.groupId,
            testDate: testDate,
            testCode: this.testCode,
            icPhoto: '',
          ),
        )
            .then((value) {
          cancelCallRpkJpjTest();
        });
      } else {
        customDialog.show(
          barrierDismissable: true,
          context: context,
          content:
              AppLocalizations.of(context)!.translate('record_not_matched'),
          customActions: <Widget>[
            TextButton(
              child: Text(AppLocalizations.of(context)!.translate('yes_lbl')),
              onPressed: () {
                context.router.pop();

                callPart3JpjTest();
              },
            ),
            TextButton(
              child: Text(AppLocalizations.of(context)!.translate('no_lbl')),
              onPressed: () => context.router.pop(),
            ),
          ],
          type: DialogType.GENERAL,
        );
      }
    } else {
      customDialog.show(
        barrierDismissable: true,
        context: context,
        content: AppLocalizations.of(context)!
            .translate('record_not_matched_reject'),
        type: DialogType.WARNING,
      );
    }
  }

  Future<void> callPart3JpjTest({String? type}) async {
    var testCode = selectedCandidate.testCode;
    var groupId = selectedCandidate.groupId;
    var testDate = selectedCandidate.testDate;

    setState(() {
      isLoading = true;
    });

    vehNo = await localStorage.getPlateNo();

    var result = await epanduRepo.callRpkJpjTest(
      vehNo: vehNo,
      part3Type: 'RPK',
      groupId: groupId,
      testCode: testCode,
      icNo: nric,
    );

    if (result.isSuccess) {
      context.router.push(
        ConfirmCandidateInfo(
          part3Type: 'RPK',
          nric: nric,
          candidateName: name,
          qNo: qNo,
          groupId: groupId,
          testDate: testDate,
          testCode: testCode,
          icPhoto: '',
        ),
      );
    } else {
      customDialog.show(
        context: context,
        content: result.message,
        type: DialogType.WARNING,
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  Future<void> cancelCallRpkJpjTest({type}) async {
    var testCode = selectedCandidate.testCode;
    var groupId = selectedCandidate.groupId;

    setState(() {
      isLoading = true;
    });

    var result = await epanduRepo.cancelCallRpkJpjTest(
      part3Type: 'JALAN RAYA',
      groupId: type == 'SKIP' ? this.groupId : groupId,
      testCode: type == 'SKIP' ? this.testCode : testCode,
      icNo: nric,
    );

    if (result.isSuccess) {
      // context.router.pop();
      if (type == 'MANUAL') {
        customDialog.show(
          context: context,
          content: AppLocalizations.of(context)!.translate('call_cancelled'),
          type: DialogType.SUCCESS,
        );
      }

      setState(() {
        candidateList!.clear();
        selectedCandidate = null;

        if (type != 'HOME') getPart3AvailableToCallJpjTestList();
      });
    } else {
      customDialog.show(
        context: context,
        content: result.message,
        type: DialogType.WARNING,
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid && isVisible) {
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

      setState(() {
        try {
          merchantNo = jsonDecode(scanData.code!)['Table1'][0]['merchant_no'];
          testCode = jsonDecode(scanData.code!)['Table1'][0]['test_code'];
          groupId = jsonDecode(scanData.code!)['Table1'][0]['group_id'];
          iconVisible = true;
          isVisible = false;

          if (qNo!.isNotEmpty) {
            compareCandidateInfo();
          } else {
            customDialog.show(
              barrierDismissable: true,
              context: context,
              content: AppLocalizations.of(context)!.translate('scan_again'),
              type: DialogType.INFO,
            );
          }
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

      // await qrController.resumeCamera();
    });
  }

  @override
  void dispose() {
    qrController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.translate('calling')),
        actions: [
          IconButton(
            onPressed: () {
              customDialog.show(
                context: context,
                content: AppLocalizations.of(context)!
                    .translate('select_queue_tooltip'),
                type: DialogType.INFO,
              );
            },
            icon: Icon(Icons.info_outline),
            tooltip:
                AppLocalizations.of(context)!.translate('select_queue_tooltip'),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    SizedBox(height: 50.h),
                    Container(
                      width: 1300.h,
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 0, horizontal: 50.w),
                          labelText: 'Q-NO',
                          labelStyle: TextStyle(
                            fontSize: 80.sp,
                          ),
                          // fillColor: Colors.grey.withOpacity(.25),
                          // filled: true,
                          // prefixIcon: Icon(Icons.edit),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: primaryColor),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        items: candidateList != null
                            ? candidateList!
                                .map<DropdownMenuItem<String>>((dynamic value) {
                                return DropdownMenuItem<String>(
                                  value: value.queueNo,
                                  child: Center(
                                      child: Text(
                                    value.queueNo,
                                    style: TextStyle(
                                      fontSize: 80.sp,
                                    ),
                                  )),
                                );
                              }).toList()
                            : null,
                        onTap: () {
                          FocusScopeNode currentFocus = FocusScope.of(context);

                          if (!currentFocus.hasPrimaryFocus) {
                            currentFocus.unfocus();
                          }
                        },
                        onChanged: (String? newValue) {
                          setState(() {
                            qNo = newValue;
                          });

                          getSelectedCandidateInfo(newValue);
                        },
                      ),
                    ),
                    // Text(
                    //   qNo.isNotEmpty ? qNo : 'Q-NO',
                    //   style: TextStyle(
                    //       fontWeight: FontWeight.bold, fontSize: 250.sp),
                    // ),
                    SizedBox(height: 50.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 150.w),
                      child: Table(
                        // border: TableBorder.all(),
                        columnWidths: {0: FractionColumnWidth(.30)},
                        children: [
                          /* TableRow(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.h),
                            child: Text('Q-NO',
                                textAlign: TextAlign.center, style: textStyle),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.h),
                            child: Text(qNo, style: textStyle),
                          ),
                        ],
                      ), */
                          TableRow(children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: Text('NRIC', style: textStyle),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: Text(nric!, style: textStyle),
                            ),
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: Text('NAMA', style: textStyle),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: Text(name!, style: textStyle),
                            ),
                          ]),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            CustomButton(
                              onPressed: () {
                                if (selectedCandidate != null)
                                  callPart3JpjTest(type: 'MANUAL');
                                else
                                  customDialog.show(
                                    context: context,
                                    content: AppLocalizations.of(context)!
                                        .translate('select_queue_no'),
                                    type: DialogType.INFO,
                                  );
                              },
                              buttonColor: Color(0xffdd0e0e),
                              title: AppLocalizations.of(context)!
                                  .translate('call_btn'),
                            ),
                            IconButton(
                              onPressed: () {
                                customDialog.show(
                                  context: context,
                                  content: AppLocalizations.of(context)!
                                      .translate('call_tooltip'),
                                  type: DialogType.INFO,
                                );
                              },
                              icon: Icon(Icons.info_outline),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            CustomButton(
                              // onPressed: () =>
                              //     cancelCallPart3JpjTest(type: 'MANUAL'),
                              onPressed: () {
                                if (selectedCandidate != null) {
                                  CustomDialog().show(
                                    context: context,
                                    title: Text(AppLocalizations.of(context)!
                                        .translate('warning_title')),
                                    content: AppLocalizations.of(context)!
                                        .translate('confirm_cancel_desc'),
                                    customActions: <Widget>[
                                      TextButton(
                                        child: Text(
                                            AppLocalizations.of(context)!
                                                .translate('yes_lbl')),
                                        onPressed: () {
                                          context.router.pop();
                                          cancelCallRpkJpjTest(type: 'MANUAL');
                                        },
                                      ),
                                      TextButton(
                                        child: Text(
                                            AppLocalizations.of(context)!
                                                .translate('no_lbl')),
                                        onPressed: () {
                                          context.router.pop();
                                        },
                                      ),
                                    ],
                                    type: DialogType.GENERAL,
                                  );
                                } else
                                  customDialog.show(
                                    context: context,
                                    content: AppLocalizations.of(context)!
                                        .translate('select_queue_no'),
                                    type: DialogType.INFO,
                                  );
                              },
                              buttonColor: Color(0xffdd0e0e),
                              title: AppLocalizations.of(context)!
                                  .translate('cancel_btn'),
                            ),
                            IconButton(
                              onPressed: () {
                                customDialog.show(
                                  context: context,
                                  content: AppLocalizations.of(context)!
                                      .translate('cancel_tooltip'),
                                  type: DialogType.INFO,
                                );
                              },
                              icon: Icon(Icons.info_outline),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Visibility(
                  visible: isVisible,
                  child: Expanded(flex: 2, child: _buildQrView(context))),
              Visibility(
                visible: iconVisible,
                child: Expanded(
                  flex: 2,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        isVisible = true;
                        iconVisible = false;

                        // qrController?.resumeCamera();
                      });
                    },
                    iconSize: 150,
                    icon: Icon(Icons.camera_alt),
                  ),
                ),
              ),
            ],
          ),
          LoadingModel(
            isVisible: isLoading,
            color: ColorConstant.primaryColor,
          ),
        ],
      ),
    );
  }
}
