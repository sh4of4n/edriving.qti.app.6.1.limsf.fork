import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:edriving_qti_app/common_library/services/repository/etesting_repository.dart';
import 'package:edriving_qti_app/common_library/utils/app_localizations.dart';
import 'package:edriving_qti_app/utils/constants.dart';
import 'package:auto_route/auto_route.dart';
import 'package:edriving_qti_app/utils/local_storage.dart';

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
          child: Container(
            // height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20),
                Column(
                  children: [
                    HomeIcon(
                      component: CheckListRoute(),
                      image: imageConstant.checkList,
                      name:
                          AppLocalizations.of(context)!.translate('checklist'),
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
                                HomeIcon(
                                  component: GetVehicleInfo(type: 'RPK'),
                                  image: imageConstant.kppIcon,
                                  name: 'RPK',
                                ),
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
      ),
    );
  }
}
