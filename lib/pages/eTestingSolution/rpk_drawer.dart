import 'package:auto_route/auto_route.dart';
import 'package:edriving_qti_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:edriving_qti_app/common_library/utils/app_localizations.dart';
import '../../router.gr.dart';

@RoutePage(name: 'RpkDrawer')
class RpkDrawer extends StatelessWidget {
  final image = ImagesConstant();

  RpkDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(
                height: ScreenUtil().setHeight(60),
              ),
              Wrap(
                children: <Widget>[
                  Text(
                    AppLocalizations.of(context)!.translate('instructor_name'),
                  ),
                  const Text('YEOH SAN JIEK'),
                ],
              ),
              const Wrap(
                children: <Widget>[
                  Text('    IC NO : '),
                  Text('960529075175'),
                ],
              ),
              const Divider(),
              SizedBox(height: ScreenUtil().setHeight(40)),
              Table(
                columnWidths: const {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(2),
                },
                children: [
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          image: DecorationImage(
                            image: AssetImage(image.feedSample),
                            fit: BoxFit.cover,
                          ),
                        ),
                        width: ScreenUtil().setWidth(380),
                        height: ScreenUtil().setWidth(380),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: <Widget>[
                            const Text('YEOH SAN JIEK '),
                            SizedBox(height: ScreenUtil().setHeight(20)),
                            const Text('960529075175'),
                          ],
                        ),
                      ),
                    ),
                  ]),
                ],
              ),
              SizedBox(height: ScreenUtil().setHeight(30)),
              const Divider(),
              SizedBox(height: ScreenUtil().setHeight(30)),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: <Widget>[
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text('PBH 5555')),
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Permit No')),
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Route No')),
                      Align(
                          alignment: Alignment.centerLeft,
                          child:
                              Text(DateTime.now().toString().substring(0, 10))),
                    ],
                  ),
                ),
              ),
            ],
          ),
          ElevatedButton(
            child: Text(
              AppLocalizations.of(context)!.translate('start_lbl'),
            ),
            onPressed: () {
              context.router.push(const RsmRpkTabs());
            },
          ),
        ],
      ),
    );
  }
}
