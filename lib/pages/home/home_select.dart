import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:edriving_qti_app/common_library/services/repository/etesting_repository.dart';
import 'package:edriving_qti_app/common_library/utils/app_localizations.dart';
import 'package:edriving_qti_app/utils/constants.dart';
import 'package:auto_route/auto_route.dart';
import 'package:edriving_qti_app/utils/local_storage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../router.gr.dart';
import '../rpk/list_part_iii.dart';
import 'home_icon.dart';

class HomeSelect extends StatefulWidget {
  HomeSelect({Key? key}) : super(key: key);

  @override
  _HomeSelectState createState() => _HomeSelectState();
}

class _HomeSelectState extends State<HomeSelect> {
  final imageConstant = ImagesConstant();
  final primaryColor = ColorConstant.primaryColor;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final localStorage = LocalStorage();
  final etestingRepo = EtestingRepo();

  @override
  void initState() {
    super.initState();
    checkMySikapVehicle();
  }

  Future<void> checkMySikapVehicle() async {
    EasyLoading.show();
    bool isCheck = await localStorage.getMySikapVehicle();
    if (!isCheck) {
      var result = await etestingRepo.getMySikapVehicleListByStatus(status: '');
      EasyLoading.dismiss();
      if (result.isSuccess && result.data != null) {
        await localStorage.saveMySikapVehicle(true);
        await showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('eDriving QTI App'),
            content: Text(AppLocalizations.of(context)!
                .translate('vehicle_download_success')),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    } else {
      EasyLoading.dismiss();
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
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.grey,
          elevation: 0,
          actions: <Widget>[
            // IconButton(
            //   onPressed: () => context.router.push(
            //     CheckListRoute(),
            //   ),
            //   icon: Icon(Icons.check),
            // ),
            IconButton(
              onPressed: () => context.router.push(
                const ProfileTab(),
                // RuleRoute(),
              ),
              icon: const Icon(Icons.settings),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20),
              Column(
                children: [
                  HomeIcon(
                    component: CheckListRoute(),
                    image: imageConstant.checkList,
                    name: AppLocalizations.of(context)!.translate('checklist'),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Ink(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15.0),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      offset: Offset(1.0, 2.0),
                                      blurRadius: 5.0,
                                      spreadRadius: 2.0,
                                    ),
                                  ],
                                ),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(15.0),
                                  onTap: () {
                                    // context.router
                                    //     .push(GetVehicleInfo(type: 'RPK'));
                                  },
                                  child: SizedBox(
                                    // padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
                                    width: ScreenUtil().setWidth(650),
                                    height: ScreenUtil().setHeight(650),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Center(
                                          child: Image.asset(
                                            imageConstant.kppIcon,
                                            width: ScreenUtil().setWidth(450),
                                            height: ScreenUtil().setHeight(450),
                                          ),
                                        ),
                                        const SizedBox(height: 10.0),
                                        Text(
                                          'RPK',
                                          style: TextStyle(
                                            fontSize: ScreenUtil().setSp(60),
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              HomeIcon(
                                component: GetVehicleInfo(type: 'Jalan Raya'),
                                image: imageConstant.kppIcon,
                                name: 'Bahagian III',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
