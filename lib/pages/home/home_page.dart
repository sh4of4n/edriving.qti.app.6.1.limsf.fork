import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:edriving_qti_app/component/profile.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:edriving_qti_app/common_library/services/location.dart';
import 'package:edriving_qti_app/common_library/services/model/provider_model.dart';
import 'package:edriving_qti_app/common_library/services/repository/auth_repository.dart';
import 'package:edriving_qti_app/common_library/services/repository/etesting_repository.dart';
import 'package:edriving_qti_app/common_library/services/repository/kpp_repository.dart';
import 'package:edriving_qti_app/common_library/utils/app_localizations.dart';
import 'package:edriving_qti_app/common_library/utils/custom_dialog.dart';
import 'package:edriving_qti_app/services/response.dart';
import 'package:edriving_qti_app/utils/constants.dart';
import 'package:edriving_qti_app/utils/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../router.gr.dart';
import 'home_module.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final authRepo = AuthRepo();
  final kppRepo = KppRepo();
  final localStorage = LocalStorage();
  final primaryColor = ColorConstant.primaryColor;
  // String _username = '';
  var studentEnrollmentData;
  var feed;
  final myImage = ImagesConstant();
  // get location
  Location location = Location();
  final geolocator = Geolocator();

  String instituteLogo = '';
  bool isLogoLoaded = false;

  String? groupId;
  String? carNo;
  String? plateNo;
  String? dbCode;

  TextStyle textStyle = const TextStyle(fontWeight: FontWeight.bold);

  final etestingRepo = EtestingRepo();
  final customDialog = CustomDialog();
  final RegExp removeBracket =
      RegExp("\\[(.*?)\\]", multiLine: true, caseSensitive: true);

  @override
  void initState() {
    super.initState();
    _openHiveBoxes();
    _setLocale();
    _getVehInfo();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> processQrCodeResult(
      {required Barcode scanData,
      required selectedCandidate,
      required String qNo}) async {
    try {
      await context.router.push(
        ConfirmCandidateInfo(
          part3Type: 'RPK',
          nric: selectedCandidate.nricNo,
          candidateName: selectedCandidate.fullname,
          qNo: selectedCandidate.queueNo,
          groupId: selectedCandidate.groupId,
          testDate: selectedCandidate.testDate,
          testCode: selectedCandidate.testCode,
          icPhoto: selectedCandidate.icPhotoFilename != null &&
                  selectedCandidate.icPhotoFilename.isNotEmpty
              ? selectedCandidate.icPhotoFilename
                  .replaceAll(removeBracket, '')
                  .split('\r\n')[0]
              : '',
        ),
      );
    } catch (e) {
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
    }
  }

  _setLocale() async {
    String? locale = await localStorage.getLocale();

    if (locale == 'en') {
      Provider.of<LanguageModel>(context, listen: false).selectedLanguage(
          AppLocalizations.of(context)!.translate('english_lbl'));
    } else {
      Provider.of<LanguageModel>(context, listen: false).selectedLanguage(
          AppLocalizations.of(context)!.translate('malay_lbl'));
    }
  }

  _openHiveBoxes() async {
    await Hive.openBox('telcoList');
    await Hive.openBox('serviceList');
    // await Hive.openBox('emergencyContact');
  }

  _getVehInfo() async {
    String? getGroupId = await localStorage.getEnrolledGroupId();
    String? getCarNo = await localStorage.getCarNo();
    String? getPlateNo = await localStorage.getPlateNo();
    String? getDbCode = await localStorage.getMerchantDbCode();

    setState(() {
      groupId = getGroupId;
      carNo = getCarNo;
      plateNo = getPlateNo;
      dbCode = getDbCode;
    });
  }

  vehInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60.0),
      child: Table(
        children: [
          TableRow(
            children: [
              const Text('Group ID'),
              Text(groupId ?? '', style: textStyle),
            ],
          ),
          TableRow(
            children: [
              const Text('Car No'),
              Text(carNo ?? '', style: textStyle),
            ],
          ),
          TableRow(
            children: [
              const Text('Plate No'),
              Text(plateNo ?? '', style: textStyle),
            ],
          ),
          TableRow(
            children: [
              const Text('Permit No'),
              Text(dbCode ?? '', style: textStyle),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white,
            primaryColor,
          ],
          stops: [0.45, 0.65],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('eDriving QTI'),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.grey,
          elevation: 0,
          actions: <Widget>[
            IconButton(
              onPressed: () => context.router.push(
                const ProfileTab(),
              ),
              icon: const Icon(Icons.settings),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                ProfileWidget(),
                const Text(
                  'Ujian Memandu Bahagian III',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                vehInfo(),
                const SizedBox(
                  height: 16.0,
                ),
                HomeModule(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow[100],
                      ),
                      onPressed: () async {
                        var scanData =
                            await context.router.push(QrScannerRoute());
                        if (scanData != null) {
                          EasyLoading.show(
                            maskType: EasyLoadingMaskType.black,
                          );

                          try {
                            String? plateNo = await localStorage.getPlateNo();
                            Response result =
                                await etestingRepo.isCurrentCallingCalon(
                              plateNo: plateNo ?? '',
                              partType: 'RPK',
                              nricNo: jsonDecode(scanData.toString())['Table1']
                                  [0]['nric_no'],
                            );
                            await EasyLoading.dismiss();
                            if (!result.isSuccess) {
                              EasyLoading.show(
                                maskType: EasyLoadingMaskType.black,
                              );
                              Response result2 =
                                  await etestingRepo.isCurrentInProgressCalon(
                                plateNo: plateNo ?? '',
                                partType: 'RPK',
                                nricNo:
                                    jsonDecode(scanData.toString())['Table1'][0]
                                        ['nric_no'],
                              );
                              await EasyLoading.dismiss();
                              if (!result2.isSuccess) {
                                await showDialog(
                                  context: context,
                                  barrierDismissible:
                                      false, // user must tap button!
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('JPJ QTO'),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: const <Widget>[
                                            Text(
                                                'Calon ini tidak mengambil ujian'),
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
                              } else {
                                await context.router.push(
                                  RpkPartIII(
                                    qNo: result.data[0].queueNo,
                                    nric: result.data[0].nricNo,
                                    rpkName: result.data[0].fullname,
                                    testDate: result.data[0].testDate,
                                    groupId: result.data[0].groupId,
                                    testCode: result.data[0].testCode,
                                    vehNo: await localStorage.getPlateNo(),
                                    skipUpdateRpkJpjTestStart: true,
                                  ),
                                );
                              }
                            } else {
                              await context.router.push(
                                ConfirmCandidateInfo(
                                  part3Type: 'RPK',
                                  nric: result.data[0].nricNo,
                                  candidateName: result.data[0].fullname,
                                  qNo: result.data[0].queueNo,
                                  groupId: result.data[0].groupId,
                                  testDate: result.data[0].testDate,
                                  testCode: result.data[0].testCode,
                                  icPhoto:
                                      result.data[0].icPhotoFilename != null &&
                                              result.data[0].icPhotoFilename
                                                  .isNotEmpty
                                          ? result.data[0].icPhotoFilename
                                              .replaceAll(removeBracket, '')
                                              .split('\r\n')[0]
                                          : '',
                                ),
                              );
                            }
                          } catch (e) {
                            await EasyLoading.dismiss();
                            customDialog.show(
                              barrierDismissable: false,
                              context: context,
                              content: AppLocalizations.of(context)!
                                  .translate('invalid_qr'),
                              customActions: [
                                TextButton(
                                  onPressed: () {
                                    context.router.pop();
                                  },
                                  child: Text('Ok'),
                                ),
                              ],
                              type: DialogType.GENERAL,
                            );

                            return;
                          }
                        }
                      },
                      child: const Text(
                        'Calon Semasa',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow[100],
                      ),
                      onPressed: () {
                        context.router.push(GetVehicleInfo(type: 'Jalan Raya'));
                      },
                      child: Text(
                        AppLocalizations.of(context)!.translate('change_car'),
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                // InkWell(
                //   onTap: () =>
                //       context.router.push(GetVehicleInfo(type: 'Jalan Raya')),
                //   child: Text(
                //       AppLocalizations.of(context)!.translate('change_car')),
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow[100],
                      ),
                      onPressed: () {
                        context.router.replace(HomeSelect());
                      },
                      child: Text(
                        AppLocalizations.of(context)!
                            .translate('change_bahagian'),
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                /* Expanded(
                  child: GestureDetector(
                    onTap: () {
                      return showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return LanguageOptions();
                        },
                      );
                    },
                    child: Consumer<LanguageModel>(
                      builder: (context, lang, child) {
                        return Text(
                          '${AppLocalizations.of(context).translate('language_lbl')} ${lang.language}',
                          style: TextStyle(
                              fontSize: 56.sp, fontWeight: FontWeight.w500),
                        );
                      },
                    ),
                  ),
                ), */
                //LimitedBox(maxHeight: ScreenUtil().setHeight(30)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
