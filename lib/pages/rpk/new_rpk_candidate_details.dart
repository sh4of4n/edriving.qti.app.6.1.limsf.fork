import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:edriving_qti_app/common_library/services/repository/auth_repository.dart';
import 'package:edriving_qti_app/common_library/services/repository/epandu_repository.dart';
import 'package:edriving_qti_app/common_library/services/repository/etesting_repository.dart';
import 'package:edriving_qti_app/common_library/services/response.dart';
import 'package:edriving_qti_app/common_library/utils/app_localizations.dart';
import 'package:edriving_qti_app/common_library/utils/custom_button.dart';
import 'package:edriving_qti_app/common_library/utils/custom_dialog.dart';
import 'package:edriving_qti_app/component/profile.dart';
import 'package:edriving_qti_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:edriving_qti_app/utils/local_storage.dart';
import 'package:edriving_qti_app/utils/mykad_verify.dart';
import 'package:nfc_manager/nfc_manager.dart';

import '../../router.gr.dart';

@RoutePage()
class NewRpkCandidateDetails extends StatefulWidget {
  const NewRpkCandidateDetails({super.key});

  @override
  State<NewRpkCandidateDetails> createState() => _NewRpkCandidateDetailsState();
}

class _NewRpkCandidateDetailsState extends State<NewRpkCandidateDetails> {
  final localStorage = LocalStorage();
  String barcode = "";
  final primaryColor = ColorConstant.primaryColor;
  final myImage = ImagesConstant();
  final authRepo = AuthRepo();
  final epanduRepo = EpanduRepo();
  final etestingRepo = EtestingRepo();
  final customDialog = CustomDialog();
  final textStyle = TextStyle(
    fontSize: 80.sp,
    color: Colors.black,
  );

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool iconVisible = true;
  String? qNo = '';
  String? nric = '';
  String? name = '';
  String? kewarganegaraan = '';
  String testDate = '';
  String? groupId = '';
  String? testCode = '';
  String? vehNo = '';
  String? merchantNo = '';
  String icPhoto = '';
  var owners;
  List<dynamic>? candidateList = [];
  var selectedCandidate;

  ValueNotifier<dynamic> nfcResult = ValueNotifier(null);
  String cardNo = '';

  bool isLoading = false;
  int success = 0;

  final RegExp removeBracket =
      RegExp("\\[(.*?)\\]", multiLine: true, caseSensitive: true);

  @override
  void initState() {
    super.initState();

    getPart3AvailableToCallJpjTestList();
  }

  autoCallRpkJpjTestByCourseCode() async {
    EasyLoading.show(
      maskType: EasyLoadingMaskType.black,
    );

    Response vehicleResult =
        await etestingRepo.isVehicleAvailableByUserId(plateNo: vehNo ?? '');

    if (vehicleResult.data != 'True') {
      EasyLoading.dismiss();
      if (!mounted) return;
      await showDialog(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('JPJ QTO APP'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(vehicleResult.message ?? ''),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );

      await context.router.pushAndPopUntil(GetVehicleInfo(type: 'RPK'),
          predicate: (r) => false);
      return;
    }

    Response result = await epanduRepo.autoCallRpkJpjTestByCourseCode(
      vehNo: (await localStorage.getPlateNo() ?? ''),
    );

    await EasyLoading.dismiss();
    if (result.isSuccess) {
      getSelectedCandidateInfo(result.data[0]);
    } else {
      if (!mounted) return;
      customDialog.show(
        context: context,
        content: result.message,
        type: DialogType.INFO,
      );
    }
  }

  getPart3AvailableToCallJpjTestList() async {
    EasyLoading.show(
      maskType: EasyLoadingMaskType.black,
    );

    vehNo = await localStorage.getPlateNo();

    EasyLoading.show(
      maskType: EasyLoadingMaskType.black,
    );
    var vehicleResult =
        await etestingRepo.isVehicleAvailableByUserId(plateNo: vehNo ?? '');

    if (vehicleResult.data != 'True') {
      EasyLoading.dismiss();
      if (!mounted) return;
      await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('JPJ QTO APP'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(vehicleResult.message ?? ''),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      if (!mounted) return;
      await context.router.pushAndPopUntil(GetVehicleInfo(type: 'RPK'),
          predicate: (r) => false);
    }

    var result2 = await etestingRepo.getOwnerIdCategoryList();
    if (result2.isSuccess) {
      owners = result2.data;
    }

    // if (result.isSuccess) {
    //   setState(() {
    //     candidateList = result.data;
    //   });
    //   for (var element in result.data) {
    //     if (element.rpkStartDate != null) {
    //       EasyLoading.dismiss();
    //       await context.router.replace(
    //         RpkPartIII(
    //           qNo: element.queueNo,
    //           nric: element.nricNo,
    //           rpkName: element.fullname,
    //           testDate: element.testDate,
    //           groupId: element.groupId,
    //           testCode: element.testCode,
    //           vehNo: vehNo,
    //           skipUpdateRpkJpjTestStart: true,
    //         ),
    //       );
    //       return;
    //     }

    //     if (element.rpkCalling == 'true') {
    //       EasyLoading.dismiss();
    //       await context.router.push(
    //         ConfirmCandidateInfo(
    //           part3Type: 'RPK',
    //           nric: element.nricNo,
    //           candidateName: element.fullname,
    //           qNo: element.queueNo,
    //           groupId: element.groupId,
    //           testDate: element.testDate,
    //           testCode: element.testCode,
    //           icPhoto: element.icPhotoFilename != null &&
    //                   element.icPhotoFilename.isNotEmpty
    //               ? element.icPhotoFilename
    //                   .replaceAll(removeBracket, '')
    //                   .split('\r\n')[0]
    //               : '',
    //         ),
    //       );
    //       return;
    //     }
    //   }
    // } else {
    //   if (mounted) {
    //     customDialog.show(
    //       context: context,
    //       content: result.message,
    //       type: DialogType.INFO,
    //     );
    //   }
    // }
    EasyLoading.dismiss();
  }

  getSelectedCandidateInfo(candidate) {
    setState(() {
      selectedCandidate = candidate;
      nric = candidate.nricNo;
      name = candidate.fullname;
      for (var owner in owners) {
        if (owner.ownerCat == candidate.ownerCat) {
          kewarganegaraan = owner.ownerCatDesc;
        }
      }
      icPhoto = candidate.icPhotoFilename != null &&
              candidate.icPhotoFilename.isNotEmpty
          ? candidate.icPhotoFilename
              .replaceAll(removeBracket, '')
              .split('\r\n')[0]
          : '';
      groupId = candidate.groupId;
      qNo = candidate.queueNo;
    });
  }

  compareCandidateInfo({
    required String testCode,
    required String groupId,
    required String testDate,
  }) async {
    // var merchantNo = selectedCandidate.merchantNo;
    // var testCode = selectedCandidate.testCode;
    // var groupId = selectedCandidate.groupId;
    // var testDate = selectedCandidate.testDate;

    if (this.groupId == groupId && this.testCode == testCode) {
      if (success == 0) {
        // await callPart3JpjTest();
      }
      context.router
          .push(
        ConfirmCandidateInfo(
          part3Type: 'RPK',
          nric: nric,
          candidateName: name,
          qNo: qNo,
          groupId: this.groupId,
          testDate: testDate,
          testCode: this.testCode,
          icPhoto: icPhoto,
        ),
      )
          .then((value) {
        // cancelCallPart3JpjTest();
        print(value);
        if (value.toString() == 'refresh') {
          setState(() {
            success = 0;
            candidateList!.clear();
            selectedCandidate = null;
            name = '';
            kewarganegaraan = '';
            icPhoto = '';
            nric = '';
            this.groupId = '';
            qNo = '';
          });
        }
      });

      // if (this.testCode == testCode) {
      // } else {
      //   for (int i = 0; i < candidateList!.length; i += 1) {
      //     if (candidateList![i].testCode == this.testCode) {
      //       customDialog.show(
      //         barrierDismissable: false,
      //         context: context,
      //         content:
      //             AppLocalizations.of(context)!.translate('record_not_matched'),
      //         customActions: <Widget>[
      //           TextButton(
      //             child:
      //                 Text(AppLocalizations.of(context)!.translate('yes_lbl')),
      //             onPressed: () async {
      //               context.router.pop();

      //               setState(() {
      //                 name = candidateList![i].fullname;
      //                 qNo = candidateList![i].queueNo;
      //                 for (var owner in owners) {
      //                   if (owner.ownerCat == candidateList![i].ownerCat) {
      //                     kewarganegaraan = owner.ownerCatDesc;
      //                   }
      //                 }
      //                 icPhoto = candidateList![i].icPhotoFilename != null &&
      //                         candidateList![i].icPhotoFilename.isNotEmpty
      //                     ? candidateList![i]
      //                         .icPhotoFilename
      //                         .replaceAll(removeBracket, '')
      //                         .split('\r\n')[0]
      //                     : '';
      //               });

      //               if (success > 0)
      //                 Future.wait([
      //                   cancelCallPart3RpkTest(),
      //                   callPart3JpjTest(type: 'SKIP'),
      //                 ]);
      //               else
      //                 await callPart3JpjTest(type: 'SKIP');

      //               context.router
      //                   .push(
      //                 ConfirmCandidateInfo(
      //                   part3Type: 'RPK',
      //                   nric: this.nric,
      //                   candidateName: this.name,
      //                   qNo: this.qNo,
      //                   groupId: this.groupId,
      //                   testDate: testDate,
      //                   testCode: this.testCode,
      //                   icPhoto: icPhoto,
      //                 ),
      //               )
      //                   .then((value) {
      //                 print(value);
      //                 cancelCallPart3RpkTest(type: 'SKIP');
      //               });

      //               // cancelCallPart3JpjTest();

      //               // callPart3JpjTest();
      //             },
      //           ),
      //           TextButton(
      //             child:
      //                 Text(AppLocalizations.of(context)!.translate('no_lbl')),
      //             onPressed: () => context.router.pop(),
      //           ),
      //         ],
      //         type: DialogType.GENERAL,
      //       );

      //       break;
      //     } else if (i + 1 == candidateList!.length) {
      //       customDialog.show(
      //         context: context,
      //         content: AppLocalizations.of(context)!
      //             .translate('qr_candidate_not_found'),
      //         type: DialogType.INFO,
      //       );
      //     }
      //   }
      // }
    } else {
      customDialog.show(
        barrierDismissable: false,
        context: context,
        content: AppLocalizations.of(context)!
            .translate('record_not_matched_reject'),
        type: DialogType.WARNING,
      );
    }
  }

  Future<void> callPart3JpjTest({type}) async {
    var testCode = selectedCandidate.testCode;
    var groupId = selectedCandidate.groupId;
    // var testDate = selectedCandidate.testDate;

    // setState(() {
    //   isLoading = true;
    // });
    EasyLoading.show(
      maskType: EasyLoadingMaskType.black,
    );

    var result = await epanduRepo.callRpkJpjTestByCourseCode(
      vehNo: vehNo,
      groupId: type == 'SKIP' ? this.groupId : groupId,
      testCode: type == 'SKIP' ? this.testCode : testCode,
      icNo: nric,
    );

    if (result.isSuccess) {
      success += 1;

      if (type == 'MANUAL') {
        if (!mounted) return;
        customDialog.show(
          context: context,
          content: AppLocalizations.of(context)!.translate('call_successful'),
          type: DialogType.SUCCESS,
        );
      }
    } else {
      if (!mounted) return;
      customDialog.show(
        context: context,
        barrierDismissable: false,
        content: result.message,
        onPressed: () {
          context.router.pop();
          // .then((value) => getPart3AvailableToCallJpjTestList());
        },
        type: DialogType.INFO,
      );
    }

    // setState(() {
    //   isLoading = false;
    // });
    EasyLoading.dismiss();
  }

  Future<void> cancelCallPart3RpkTest({type}) async {
    var testCode = selectedCandidate.testCode;
    var groupId = selectedCandidate.groupId;

    EasyLoading.show(
      maskType: EasyLoadingMaskType.black,
    );

    var result = await epanduRepo.cancelCallRpkJpjTest(
      part3Type: 'JALAN RAYA',
      groupId: type == 'SKIP' ? this.groupId : groupId,
      testCode: type == 'SKIP' ? this.testCode : testCode,
      icNo: nric,
    );
    await EasyLoading.dismiss();
    if (result.isSuccess) {
      // context.router.pop();
      if (type == 'MANUAL') {
        if (!mounted) return;
        await showDialog<void>(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('JPJ QTO'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(AppLocalizations.of(context)!
                        .translate('call_cancelled')),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Ok'),
                  onPressed: () {
                    context.router.pop();
                  },
                ),
              ],
            );
          },
        );
      }

      setState(() {
        success = 0;
        candidateList!.clear();
        selectedCandidate = null;
        name = '';
        kewarganegaraan = '';
        icPhoto = '';
        nric = '';
        this.groupId = '';
        qNo = '';

        // if (type != 'HOME') getPart3AvailableToCallJpjTestList();
      });
    } else {
      await EasyLoading.dismiss();
      setState(() {
        success = 0;
        candidateList!.clear();
        selectedCandidate = null;
        name = '';
        kewarganegaraan = '';
        icPhoto = '';
        nric = '';
        this.groupId = '';
        qNo = '';
      });
      if (result.message == 'You not yet call this student.') {
        if (!mounted) return;
        context.router.pop();
      } else {
        if (mounted) {
          customDialog.show(
            context: context,
            content: result.message,
            type: DialogType.WARNING,
          );
        }
      }
    }
  }

  @override
  void reassemble() {
    super.reassemble();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<bool> _onWillPop() async {
    EasyLoading.dismiss();
    if (qNo != '') {
      CustomDialog().show(
        context: context,
        title: Text(AppLocalizations.of(context)!.translate('warning_title')),
        content: AppLocalizations.of(context)!.translate('confirm_exit_desc'),
        customActions: <Widget>[
          TextButton(
            child: Text(AppLocalizations.of(context)!.translate('yes_lbl')),
            onPressed: () async {
              await context.router.pop();
              await cancelCallPart3RpkTest(type: 'HOME');
            },
          ),
          TextButton(
            child: Text(AppLocalizations.of(context)!.translate('no_lbl')),
            onPressed: () {
              context.router.pop();
            },
          ),
        ],
        type: DialogType.GENERAL,
      );
      return false;
    }
    // context.router.pop();
    return true;
  }

  Future<void> processQrCodeResult({
    required BuildContext context,
    required String scanData,
    required selectedCandidate,
    required String qNo,
  }) async {
    try {
      await EasyLoading.show(
        maskType: EasyLoadingMaskType.black,
      );

      if (isJson(scanData.toString())) {
        groupId = jsonDecode(scanData.toString())['Table1'][0]['group_id'];
        nric = jsonDecode(scanData.toString())['Table1'][0]['nric_no'];
        testCode = jsonDecode(scanData.toString())['Table1'][0]['test_code'];
      } else {
        Response decryptQrcode = await etestingRepo.decryptQrcode(
          qrcodeJson: scanData.toString(),
        );

        if (!decryptQrcode.isSuccess) {
          await EasyLoading.dismiss();
          if (!mounted) return;
          await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context2) {
              return AlertDialog(
                title: const Text('JPJ QTO APP'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text(decryptQrcode.message ?? ''),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.of(context2).pop();
                    },
                  ),
                ],
              );
            },
          );
          return;
        }
        groupId = decryptQrcode.data[0].groupId;
        nric = decryptQrcode.data[0].nricNo;
        testCode = decryptQrcode.data[0].testCode;
      }
    } catch (e) {
      await EasyLoading.dismiss();
      if (!mounted) return;
      customDialog.show(
        barrierDismissable: false,
        context: context,
        content: AppLocalizations.of(context)!.translate('invalid_qr'),
        customActions: [
          TextButton(
            onPressed: () {
              context.router.pop();
            },
            child: const Text('Ok'),
          ),
        ],
        type: DialogType.GENERAL,
      );
    } finally {
      await EasyLoading.dismiss();
    }

    if (!mounted) return;
    String? verifyType = await showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return SimpleDialog(
          title: const Text('Verify By'),
          children: [
            ListTile(
              title: const Text('NFC'),
              onTap: () {
                context.router.pop('NFC');
              },
            ),
            ListTile(
              title: const Text('MyKad with fingerprint'),
              onTap: () {
                context.router.pop('MyKad');
              },
            ),
          ],
        );
      },
    );

    if (verifyType! == 'NFC') {
      bool nfcAvailable = await NfcManager.instance.isAvailable();
      if (!nfcAvailable) {
        return;
      }
      if (!mounted) return;
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Ready to Scan'),
            content: const Text('Hold your device near the item'),
            actions: [
              TextButton(
                child: const Text('Cancel'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        },
      );

      await NfcManager.instance.startSession(
        onDiscovered: (NfcTag tag) async {
          nfcResult.value = tag.data;

          Ndef? ndef = Ndef.from(tag);
          final languageCodeLength =
              ndef!.cachedMessage!.records[0].payload.first;
          final textBytes = ndef.cachedMessage!.records[0].payload
              .sublist(1 + languageCodeLength);
          NfcManager.instance.stopSession();
          cardNo = utf8.decode(textBytes);
          print(cardNo);
          // showCalonInfo();

          Response<String> isSkipFingerPrintResult =
              await etestingRepo.isSkipFingerPrint(cardNo: cardNo);
          if (isSkipFingerPrintResult.data! == 'False') {
            Response<String?> getFingerPrintByCardNoResult =
                await etestingRepo.getFingerPrintByCardNo(cardNo: cardNo);
            print('object2');
          }
          print('object');
        },
        onError: (dynamic error) {
          print('Error during NFC session: $error');
          return error;
        },
      );
    } else {
      try {
        await MyCardVerify().onCreate();
        await EasyLoading.dismiss();
        if (!mounted) return;
        bool? dialogResult = await showDialog<bool>(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context2) {
                return AlertDialog(
                  title: const Text('MyKad Authentication'),
                  content: const Text('Please insert student MyKad.'),
                  actions: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextButton(
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text(
                              'MyKad is inserted',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          onPressed: () async {
                            try {
                              await EasyLoading.show(
                                  maskType: EasyLoadingMaskType.black,
                                  status:
                                      'Reading personal information in MyKad...');
                              final myKadNric =
                                  await MyCardVerify().onReadMyKad();
                              if (myKadNric != nric) {
                                throw PlatformException(
                                    message:
                                        'Student IC is not same as MyKad IC',
                                    code: '');
                              }
                              await MyCardVerify().onFingerprintVerify();
                              await EasyLoading.show(
                                  maskType: EasyLoadingMaskType.black,
                                  status:
                                      'Please place student thumb on the fingerprint reader...');
                              final fpResult =
                                  await MyCardVerify().onFingerprintVerify2();
                              if (fpResult ==
                                  'Fingerprint matches fingerprint in MyKad') {
                                await EasyLoading.dismiss();
                                if (!context2.mounted) return;
                                context2.router.pop(true);
                              }
                            } on PlatformException catch (e) {
                              if (context2.mounted) {
                                Navigator.of(context2).pop();
                              }
                              SnackBar snackBar = SnackBar(
                                content: Text(e.message ?? ''),
                                backgroundColor: Colors.red,
                              );
                              if (!context2.mounted) return;
                              ScaffoldMessenger.of(context2)
                                  .showSnackBar(snackBar);
                            } finally {
                              await EasyLoading.dismiss();
                            }
                          },
                        ),
                        TextButton(
                          child: const Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context2).pop();
                          },
                        ),
                      ],
                    ),
                  ],
                );
              },
            ) ??
            false;
        if (!dialogResult) {
          return;
        }
      } on PlatformException catch (e) {
        SnackBar snackBar = SnackBar(
          content: Text(e.message ?? ''),
          backgroundColor: Colors.red,
        );
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } finally {
        await EasyLoading.dismiss();
      }
    }
  }

  showCalonInfo() {
    setState(
      () {
        iconVisible = true;
        if (qNo!.isNotEmpty) {
          compareCandidateInfo(
            groupId: selectedCandidate.groupId,
            testCode: selectedCandidate.testCode,
            testDate: selectedCandidate.testDate,
          );
        } else {
          nric = '';
          groupId = '';
          testCode = '';
          customDialog.show(
            barrierDismissable: false,
            context: context,
            content: AppLocalizations.of(context)!.translate('scan_again'),
            type: DialogType.INFO,
          );
        }
      },
    );
  }

  bool isJson(String str) {
    try {
      json.decode(str);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Calling'),
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
              icon: const Icon(Icons.info_outline),
              tooltip: AppLocalizations.of(context)!
                  .translate('select_queue_tooltip'),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          label: const Text('Scan QR Code'),
          onPressed: () async {
            var scanData = await context.router.push(const QrScannerRoute());
            if (scanData != null) {
              if (!mounted) return;
              processQrCodeResult(
                context: context,
                scanData: scanData.toString(),
                selectedCandidate: selectedCandidate,
                qNo: qNo!,
              );
            }
          },
          icon: const Icon(Icons.qr_code_scanner),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(
            bottom: 70,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  const ProfileWidget(),
                  selectedCandidate == null
                      ? ElevatedButton(
                          onPressed: () {
                            autoCallRpkJpjTestByCourseCode();
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(150, 150),
                            backgroundColor: Colors.green,
                            shape: const CircleBorder(),
                          ),
                          child: const Text(
                            'Panggil Calon',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      : const SizedBox(),
                  icPhoto == ''
                      ? const SizedBox()
                      : CachedNetworkImage(
                          imageUrl: icPhoto,
                          height: 200,
                        ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 150.w,
                      vertical: 8.0,
                    ),
                    child: Row(
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Queue No',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                qNo!,
                                style: textStyle,
                              ),
                              const Text(
                                'No. ID',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                nric!,
                                style: textStyle,
                              ),
                              const Text(
                                'Nama',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                name!,
                                style: textStyle,
                              ),
                              const Text(
                                'Kategori ID',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                kewarganegaraan ?? '',
                                style: textStyle,
                              ),
                              const Text(
                                'Kelas',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                groupId!,
                                style: textStyle,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 150.w),
                  //   child: Table(
                  //     // border: TableBorder.all(),
                  //     columnWidths: {0: FractionColumnWidth(.30)},
                  //     children: [
                  //       /* TableRow(
                  //     children: [
                  //       Padding(
                  //         padding: EdgeInsets.symmetric(vertical: 10.h),
                  //         child: Text('Q-NO',
                  //             textAlign: TextAlign.center, style: textStyle),
                  //       ),
                  //       Padding(
                  //         padding: EdgeInsets.symmetric(vertical: 10.h),
                  //         child: Text(qNo, style: textStyle),
                  //       ),
                  //     ],
                  //   ), */

                  //       TableRow(children: [
                  //         Padding(
                  //           padding: EdgeInsets.symmetric(vertical: 10.h),
                  //           child: Text('NRIC', style: textStyle),
                  //         ),
                  //         Padding(
                  //           padding: EdgeInsets.symmetric(vertical: 10.h),
                  //           child: Text(nric!, style: textStyle),
                  //         ),
                  //       ]),
                  //       TableRow(children: [
                  //         Padding(
                  //           padding: EdgeInsets.symmetric(vertical: 10.h),
                  //           child: Text('NAMA', style: textStyle),
                  //         ),
                  //         Padding(
                  //           padding: EdgeInsets.symmetric(vertical: 10.h),
                  //           child: Text(name!, style: textStyle),
                  //         ),
                  //       ]),
                  //       TableRow(children: [
                  //         Padding(
                  //           padding: EdgeInsets.symmetric(vertical: 10.h),
                  //           child: Text('KEWARGANEGARAAN',
                  //               overflow: TextOverflow.ellipsis,
                  //               style: textStyle),
                  //         ),
                  //         Padding(
                  //           padding: EdgeInsets.symmetric(vertical: 10.h),
                  //           child: Text(kewarganegaraan!, style: textStyle),
                  //         ),
                  //       ]),
                  //     ],
                  //   ),
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
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
                                      child: Text(AppLocalizations.of(context)!
                                          .translate('yes_lbl')),
                                      onPressed: () async {
                                        await context.router.pop();
                                        cancelCallPart3RpkTest(type: 'MANUAL');
                                      },
                                    ),
                                    TextButton(
                                      child: Text(AppLocalizations.of(context)!
                                          .translate('no_lbl')),
                                      onPressed: () {
                                        context.router.pop();
                                      },
                                    ),
                                  ],
                                  type: DialogType.GENERAL,
                                );
                              } else {
                                customDialog.show(
                                  context: context,
                                  content:
                                      'Please press the Panggil Calon button to call the candidate.',
                                  type: DialogType.INFO,
                                );
                              }
                            },
                            buttonColor: Colors.blue,
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
                            icon: const Icon(Icons.info_outline),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              // Visibility(
              //   visible: iconVisible,
              //   child: Padding(
              //     padding: const EdgeInsets.all(16.0),
              //     child: Container(
              //       color: Colors.grey.shade200,
              //       width: double.infinity,
              //       height: 500,
              //       child: IconButton(
              //         onPressed: () {
              //           setState(() {
              //             isVisible = true;
              //             iconVisible = false;
              //           });
              //         },
              //         iconSize: 150,
              //         icon: const Icon(Icons.camera_alt),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
