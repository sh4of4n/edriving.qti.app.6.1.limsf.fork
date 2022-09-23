import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:edriving_qti_app/common_library/services/location.dart';
import 'package:edriving_qti_app/common_library/services/model/provider_model.dart';
import 'package:edriving_qti_app/common_library/services/repository/auth_repository.dart';
import 'package:edriving_qti_app/common_library/services/repository/kpp_repository.dart';
import 'package:edriving_qti_app/common_library/utils/app_localizations.dart';
import 'package:edriving_qti_app/utils/constants.dart';
import 'package:edriving_qti_app/utils/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../../router.gr.dart';
import 'home_icon.dart';

class HomePageRpk extends StatefulWidget {
  @override
  _HomePageRpkState createState() => _HomePageRpkState();
}

class _HomePageRpkState extends State<HomePageRpk> {
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

  TextStyle textStyle = TextStyle(fontWeight: FontWeight.bold);
  final imageConstant = ImagesConstant();

  @override
  void initState() {
    super.initState();

    //_openHiveBoxes();
    // getStudentInfo();
    //_getCurrentLocation();
    //_getDiProfile();
    //_getActiveFeed();

    _openHiveBoxes();
    _setLocale();
    _getVehInfo();
  }

  @override
  void dispose() {
    // positionStream.cancel();
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
              Text('Group ID'),
              Text(groupId ?? '', style: textStyle),
            ],
          ),
          TableRow(
            children: [
              Text('Car No'),
              Text(carNo ?? '', style: textStyle),
            ],
          ),
          TableRow(
            children: [
              Text('Plate No'),
              Text(plateNo ?? '', style: textStyle),
            ],
          ),
          TableRow(
            children: [
              Text('Permit No'),
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
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.grey,
          elevation: 0,
          actions: <Widget>[
            IconButton(
              onPressed: () => context.router.push(
                ProfileTab(),
              ),
              icon: Icon(Icons.settings),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                Text(
                  'Ujian Memandu Bahagian II',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                vehInfo(),
                // HomeModule(),
                HomeIcon(
                  component: RpkCandidateDetails(),
                  image: imageConstant.kppIcon,
                  name: 'RPK',
                ),
                // InkWell(
                //   onTap: () => context.router.push(GetVehicleInfo(
                //     type: 'RPK'
                //   )),
                //   child: Text(
                //       AppLocalizations.of(context)!.translate('change_car')),
                // )

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.yellow[100],
                      ),
                      onPressed: () {
                        context.router.push(GetVehicleInfo(type: 'RPK'));
                      },
                      child: Text(
                        AppLocalizations.of(context)!.translate('change_car'),
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.yellow[100],
                      ),
                      onPressed: () {
                        context.router.replace(HomeSelect());
                      },
                      child: Text(
                        AppLocalizations.of(context)!
                            .translate('change_bahagian'),
                        style: TextStyle(
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

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      SizedBox(
        height: ScreenUtil().setHeight(30),
      ),
      SizedBox(height: ScreenUtil().setHeight(80)),
      HomeIcon(
        component: RpkCandidateDetails(),
        image: imageConstant.kppIcon,
        name: 'RPK',
      ),
      SizedBox(height: ScreenUtil().setHeight(100)),
    ]);
  }
}
