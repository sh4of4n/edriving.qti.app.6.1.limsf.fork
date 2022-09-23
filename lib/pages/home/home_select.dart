import 'package:flutter/material.dart';
import 'package:edriving_qti_app/common_library/utils/app_localizations.dart';
import 'package:edriving_qti_app/utils/constants.dart';
import 'package:auto_route/auto_route.dart';

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
                ProfileTab(),
                // RuleRoute(),
              ),
              icon: Icon(Icons.settings),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            // height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                Column(
                  children: [
                    HomeIcon(
                      component: CheckListRoute(),
                      image: imageConstant.checkList,
                      name:
                          AppLocalizations.of(context)!.translate('checklist'),
                    ),
                    SizedBox(
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
