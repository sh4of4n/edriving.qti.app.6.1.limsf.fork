import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:edriving_qti_app/component/profile.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:edriving_qti_app/common_library/services/location.dart';
import 'package:edriving_qti_app/common_library/services/model/provider_model.dart';
import 'package:edriving_qti_app/common_library/services/repository/auth_repository.dart';
import 'package:edriving_qti_app/common_library/services/repository/etesting_repository.dart';
import 'package:edriving_qti_app/common_library/services/repository/kpp_repository.dart';
import 'package:edriving_qti_app/common_library/utils/app_localizations.dart';
import 'package:edriving_qti_app/common_library/utils/custom_dialog.dart';
import 'package:edriving_qti_app/utils/constants.dart';
import 'package:edriving_qti_app/utils/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../common_library/services/response.dart';
import '../../router.gr.dart';
import 'home_icon.dart';

@RoutePage(name: 'HomePageRpk')
class HomePageRpk extends StatefulWidget {
  const HomePageRpk({super.key});

  @override
  _HomePageRpkState createState() => _HomePageRpkState();
}

class _HomePageRpkState extends State<HomePageRpk> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
  final imageConstant = ImagesConstant();
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
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white,
            primaryColor,
          ],
          stops: const [0.45, 0.65],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('eDriving QTI'),
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
                const ProfileWidget(),
                const Text(
                  'Ujian Memandu Bahagian II',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                vehInfo(),
                // HomeModule(),
                const SizedBox(
                  height: 16.0,
                ),
                HomeIcon(
                  component: const NewRpkCandidateDetails(),
                  image: imageConstant.kppIcon,
                  name: 'RPK',
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow[100],
                      ),
                      onPressed: () async {
                        String? plateNo = await localStorage.getPlateNo();
                        EasyLoading.show(
                          maskType: EasyLoadingMaskType.black,
                        );
                        Response vehicleResult = await etestingRepo
                            .isVehicleAvailableByUserId(plateNo: plateNo ?? '');
                        EasyLoading.dismiss();
                        if (vehicleResult.data != 'True') {
                          if (!mounted) return;
                          await showDialog(
                            context: context,
                            barrierDismissible: false, // user must tap button!
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('JPJ QTI APP'),
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
                          await context.router
                              .push(GetVehicleInfo(type: 'RPK'));
                          return;
                        }
                        if (!mounted) return;
                        var scanData =
                            await context.router.push(QrScannerRoute());
                        if (scanData != null) {
                          EasyLoading.show(
                            maskType: EasyLoadingMaskType.black,
                          );
                          String groupId = '';
                          String nricNo = '';
                          String testCode = '';
                          try {
                            if (isJson(scanData.toString())) {
                              groupId =
                                  jsonDecode(scanData.toString())['Table1'][0]
                                      ['group_id'];
                              nricNo = jsonDecode(scanData.toString())['Table1']
                                  [0]['nric_no'];
                              testCode =
                                  jsonDecode(scanData.toString())['Table1'][0]
                                      ['test_code'];
                            } else {
                              Response decryptQrcode =
                                  await etestingRepo.decryptQrcode(
                                qrcodeJson: scanData.toString(),
                              );
                              if (!decryptQrcode.isSuccess) {
                                EasyLoading.dismiss();
                                if (!mounted) return;
                                await showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('JPJ QTI APP'),
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
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                                EasyLoading.dismiss();
                                return;
                              }
                              groupId = decryptQrcode.data[0].groupId;
                              nricNo = decryptQrcode.data[0].nricNo;
                              testCode = decryptQrcode.data[0].testCode;
                            }
                          } catch (e) {
                            await EasyLoading.dismiss();
                            if (!mounted) return;
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
                                  child: const Text('Ok'),
                                ),
                              ],
                              type: DialogType.GENERAL,
                            );

                            return;
                          }

                          Response result =
                              await etestingRepo.isCurrentCallingCalon(
                            plateNo: plateNo ?? '',
                            partType: 'RPK',
                            nricNo: nricNo,
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
                              nricNo: nricNo,
                            );
                            await EasyLoading.dismiss();
                            if (!result2.isSuccess) {
                              if (!mounted) return;
                              await showDialog(
                                context: context,
                                barrierDismissible:
                                    false, // user must tap button!
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('JPJ QTI'),
                                    content: const SingleChildScrollView(
                                      child: ListBody(
                                        children: <Widget>[
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
                              if (!mounted) return;
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
                            if (!mounted) return;
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
                        context.router.push(GetVehicleInfo(type: 'RPK'));
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

class HomeModule extends StatelessWidget {
  final imageConstant = ImagesConstant();

  HomeModule({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      SizedBox(
        height: ScreenUtil().setHeight(30),
      ),
      SizedBox(height: ScreenUtil().setHeight(80)),
      HomeIcon(
        component: const RpkCandidateDetails(),
        image: imageConstant.kppIcon,
        name: 'RPK',
      ),
      SizedBox(height: ScreenUtil().setHeight(100)),
    ]);
  }
}
