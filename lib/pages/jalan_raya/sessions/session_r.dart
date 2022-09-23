import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:edriving_qti_app/common_library/services/model/provider_model.dart';
import 'package:edriving_qti_app/common_library/utils/app_localizations.dart';
import 'package:edriving_qti_app/utils/constants.dart';
import 'package:edriving_qti_app/utils/local_storage.dart';
import 'package:edriving_qti_app/pages/eTestingSolution/custom_expansion_tile.dart'
    as custom;
import 'package:provider/provider.dart';

class SessionR extends StatefulWidget {
  // final Function() notifyParent;
  SessionR({Key? key}) : super(key: key);

  @override
  _SessionRState createState() => _SessionRState();
}

class _SessionRState extends State<SessionR> {
  final localStorage = LocalStorage();

  int rpk1 = 0,
      rpk2 = 0,
      rpk3 = 0,
      rpk4 = 0,
      rpk5 = 0,
      rpk6 = 0,
      rpk7 = 0,
      rpk8 = 0,
      rpk9 = 0,
      rpk10 = 0,
      rpk11 = 0,
      rpk12 = 0,
      rpk13 = 0,
      rpk14 = 0,
      rpk15 = 0,
      rpk16 = 0,
      rpk17 = 0,
      rpk18 = 0,
      rpk19 = 0,
      rpk20 = 0,
      rpk21 = 0,
      rpk22 = 0,
      rpk23 = 0,
      rpk24 = 0;
  bool? checkAll = false;

  @override
  Widget build(BuildContext context) {
    int rpkMark = context.watch<JrSessionModel>().rpkMark;

    return Stack(
      children: <Widget>[
        custom.ExpansionTile(
          title: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              AppLocalizations.of(context)!.translate('jr_session_r'),
              style:
                  (TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            ),
          ),
          headerBackgroundColor: ColorConstant.primaryColor,
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  AppLocalizations.of(context)!
                      .translate('part3_session_r_bold_lbl1'),
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Divider(
              height: 1.0,
              color: Colors.grey[400],
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (rpk1 == 1) {
                    rpk1 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultRpk(rpk1: 0);
                  } else {
                    rpk1 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultRpk(rpk1: 1);
                  }
                });
              },
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(10.0),
                  1: FlexColumnWidth(1.5),
                },
                children: [
                  TableRow(children: [
                    Container(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, bottom: 10, top: 10),
                            child: Text(AppLocalizations.of(context)!
                                .translate('part3_session_r1')),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12, top: 8),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('$rpk1'),
                        )),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Divider(
              height: 1.0,
              color: Colors.grey[400],
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (rpk2 == 1) {
                    rpk2 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultRpk(rpk2: 0);
                  } else {
                    rpk2 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultRpk(rpk2: 1);
                  }
                });
              },
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(10.0),
                  1: FlexColumnWidth(1.5),
                },
                children: [
                  TableRow(children: [
                    Container(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, bottom: 10, top: 10),
                            child: Text(AppLocalizations.of(context)!
                                .translate('part3_session_r2')),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12, top: 8),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('$rpk2'),
                        )),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Divider(
              height: 1.0,
              color: Colors.grey[400],
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (rpk3 == 1) {
                    rpk3 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultRpk(rpk3: 0);
                  } else {
                    rpk3 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultRpk(rpk3: 1);
                  }
                });
              },
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(ScreenUtil().setSp(10)),
                  1: FlexColumnWidth(ScreenUtil().setSp(1.5)),
                },
                children: [
                  TableRow(children: [
                    Container(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, bottom: 10, top: 10),
                            child: Text(AppLocalizations.of(context)!
                                .translate('part3_session_r3')),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12, top: 8),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('$rpk3'),
                        )),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Divider(
              height: 1.0,
              color: Colors.grey[400],
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (rpk4 == 1) {
                    rpk4 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultRpk(rpk4: 0);
                  } else {
                    rpk4 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultRpk(rpk4: 1);
                  }
                });
              },
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(ScreenUtil().setSp(10)),
                  1: FlexColumnWidth(ScreenUtil().setSp(1.5)),
                },
                children: [
                  TableRow(children: [
                    Container(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, bottom: 10, top: 10),
                            child: Text(AppLocalizations.of(context)!
                                .translate('part3_session_r4')),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12, top: 8),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('$rpk4'),
                        )),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Divider(
              height: 1.0,
              color: Colors.grey[400],
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (rpk5 == 1) {
                    rpk5 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultRpk(rpk5: 0);
                  } else {
                    rpk5 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultRpk(rpk5: 1);
                  }
                });
              },
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(ScreenUtil().setSp(10)),
                  1: FlexColumnWidth(ScreenUtil().setSp(1.5)),
                },
                children: [
                  TableRow(children: [
                    Container(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, bottom: 10, top: 10),
                            child: Text(AppLocalizations.of(context)!
                                .translate('part3_session_r5')),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12, top: 8),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('$rpk5'),
                        )),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Divider(
              height: 1.0,
              color: Colors.grey[400],
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (rpk6 == 1) {
                    rpk6 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultRpk(rpk6: 0);
                  } else {
                    rpk6 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultRpk(rpk6: 1);
                  }
                });
              },
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(ScreenUtil().setSp(10)),
                  1: FlexColumnWidth(ScreenUtil().setSp(1.5)),
                },
                children: [
                  TableRow(children: [
                    Container(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, bottom: 10, top: 10),
                            child: Text(AppLocalizations.of(context)!
                                .translate('part3_session_r6')),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12, top: 8),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('$rpk6'),
                        )),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Divider(
              height: 1.0,
              color: Colors.grey[400],
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (rpk7 == 1) {
                    rpk7 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultRpk(rpk7: 0);
                  } else {
                    rpk7 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultRpk(rpk7: 1);
                  }
                });
              },
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(ScreenUtil().setSp(10)),
                  1: FlexColumnWidth(ScreenUtil().setSp(1.5)),
                },
                children: [
                  TableRow(children: [
                    Container(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, bottom: 10, top: 10),
                            child: Text(AppLocalizations.of(context)!
                                .translate('part3_session_r7')),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12, top: 8),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('$rpk7'),
                        )),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Divider(
              height: 1.0,
              color: Colors.grey[400],
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (rpk8 == 1) {
                    rpk8 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultRpk(rpk8: 0);
                  } else {
                    rpk8 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultRpk(rpk8: 1);
                  }
                });
              },
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(ScreenUtil().setSp(10)),
                  1: FlexColumnWidth(ScreenUtil().setSp(1.5)),
                },
                children: [
                  TableRow(children: [
                    Container(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, bottom: 10, top: 10),
                            child: Text(AppLocalizations.of(context)!
                                .translate('part3_session_r8')),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12, top: 8),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('$rpk8'),
                        )),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Divider(
              height: 1.0,
              color: Colors.grey[400],
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (rpk9 == 1) {
                    rpk9 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultRpk(rpk9: 0);
                  } else {
                    rpk9 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultRpk(rpk9: 1);
                  }
                });
              },
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(ScreenUtil().setSp(10)),
                  1: FlexColumnWidth(ScreenUtil().setSp(1.5)),
                },
                children: [
                  TableRow(children: [
                    Container(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, bottom: 10, top: 10),
                            child: Text(AppLocalizations.of(context)!
                                .translate('part3_session_r9')),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12, top: 8),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('$rpk9'),
                        )),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Divider(
              height: 1.0,
              color: Colors.grey[400],
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (rpk10 == 1) {
                    rpk10 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultRpk(rpk10: 0);
                  } else {
                    rpk10 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultRpk(rpk10: 1);
                  }
                });
              },
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(ScreenUtil().setSp(10)),
                  1: FlexColumnWidth(ScreenUtil().setSp(1.5)),
                },
                children: [
                  TableRow(children: [
                    Container(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, bottom: 10, top: 10),
                            child: Text(AppLocalizations.of(context)!
                                .translate('part3_session_r10')),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12, top: 8),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('$rpk10'),
                        )),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Divider(
              height: 1.0,
              color: Colors.grey[400],
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (rpk11 == 1) {
                    rpk11 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultRpk(rpk11: 0);
                  } else {
                    rpk11 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultRpk(rpk11: 1);
                  }
                });
              },
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(ScreenUtil().setSp(10)),
                  1: FlexColumnWidth(ScreenUtil().setSp(1.5)),
                },
                children: [
                  TableRow(children: [
                    Container(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, bottom: 10, top: 10),
                            child: Text(AppLocalizations.of(context)!
                                .translate('part3_session_r11')),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12, top: 8),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('$rpk11'),
                        )),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Divider(
              height: 1.0,
              color: Colors.grey[400],
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (rpk12 == 1) {
                    rpk12 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultRpk(rpk12: 0);
                  } else {
                    rpk12 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultRpk(rpk12: 1);
                  }
                });
              },
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(ScreenUtil().setSp(10)),
                  1: FlexColumnWidth(ScreenUtil().setSp(1.5)),
                },
                children: [
                  TableRow(children: [
                    Container(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, bottom: 10, top: 10),
                            child: Text(AppLocalizations.of(context)!
                                .translate('part3_session_r12')),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12, top: 8),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('$rpk12'),
                        )),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Divider(
              height: 1.0,
              color: Colors.grey[400],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  AppLocalizations.of(context)!
                      .translate('part3_session_r_bold_lbl2'),
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Divider(
              height: 1.0,
              color: Colors.grey[400],
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (rpk13 == 1) {
                    rpk13 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultRpk(rpk13: 0);
                  } else {
                    rpk13 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultRpk(rpk13: 1);
                  }
                });
              },
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(ScreenUtil().setSp(10)),
                  1: FlexColumnWidth(ScreenUtil().setSp(1.5)),
                },
                children: [
                  TableRow(children: [
                    Container(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, bottom: 10, top: 10),
                            child: Text(AppLocalizations.of(context)!
                                .translate('part3_session_r13')),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12, top: 8),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('$rpk13'),
                        )),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Divider(
              height: 1.0,
              color: Colors.grey[400],
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (rpk14 == 1) {
                    rpk14 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultRpk(rpk14: 0);
                  } else {
                    rpk14 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultRpk(rpk14: 1);
                  }
                });
              },
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(ScreenUtil().setSp(10)),
                  1: FlexColumnWidth(ScreenUtil().setSp(1.5)),
                },
                children: [
                  TableRow(children: [
                    Container(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, bottom: 10, top: 10),
                            child: Text(AppLocalizations.of(context)!
                                .translate('part3_session_r14')),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12, top: 8),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('$rpk14'),
                        )),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Divider(
              height: 1.0,
              color: Colors.grey[400],
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (rpk15 == 1) {
                    rpk15 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultRpk(rpk15: 0);
                  } else {
                    rpk15 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultRpk(rpk15: 1);
                  }
                });
              },
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(ScreenUtil().setSp(10)),
                  1: FlexColumnWidth(ScreenUtil().setSp(1.5)),
                },
                children: [
                  TableRow(children: [
                    Container(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, bottom: 10, top: 10),
                            child: Text(AppLocalizations.of(context)!
                                .translate('part3_session_r15')),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12, top: 8),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('$rpk15'),
                        )),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Divider(
              height: 1.0,
              color: Colors.grey[400],
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (rpk16 == 1) {
                    rpk16 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultRpk(rpk16: 0);
                  } else {
                    rpk16 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultRpk(rpk16: 1);
                  }
                });
              },
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(ScreenUtil().setSp(10)),
                  1: FlexColumnWidth(ScreenUtil().setSp(1.5)),
                },
                children: [
                  TableRow(children: [
                    Container(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, bottom: 10, top: 10),
                            child: Text(AppLocalizations.of(context)!
                                .translate('part3_session_r16')),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12, top: 8),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('$rpk16'),
                        )),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Divider(
              height: 1.0,
              color: Colors.grey[400],
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (rpk17 == 1) {
                    rpk17 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultRpk(rpk17: 0);
                  } else {
                    rpk17 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultRpk(rpk17: 1);
                  }
                });
              },
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(ScreenUtil().setSp(10)),
                  1: FlexColumnWidth(ScreenUtil().setSp(1.5)),
                },
                children: [
                  TableRow(children: [
                    Container(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, bottom: 10, top: 10),
                            child: Text(AppLocalizations.of(context)!
                                .translate('part3_session_r17')),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12, top: 8),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('$rpk17'),
                        )),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Divider(
              height: 1.0,
              color: Colors.grey[400],
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (rpk18 == 1) {
                    rpk18 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultRpk(rpk18: 0);
                  } else {
                    rpk18 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultRpk(rpk18: 1);
                  }
                });
              },
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(ScreenUtil().setSp(10)),
                  1: FlexColumnWidth(ScreenUtil().setSp(1.5)),
                },
                children: [
                  TableRow(children: [
                    Container(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, bottom: 10, top: 10),
                            child: Text(AppLocalizations.of(context)!
                                .translate('part3_session_r18')),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12, top: 8),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('$rpk18'),
                        )),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Divider(
              height: 1.0,
              color: Colors.grey[400],
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (rpk19 == 1) {
                    rpk19 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultRpk(rpk19: 0);
                  } else {
                    rpk19 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultRpk(rpk19: 1);
                  }
                });
              },
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(ScreenUtil().setSp(10)),
                  1: FlexColumnWidth(ScreenUtil().setSp(1.5)),
                },
                children: [
                  TableRow(children: [
                    Container(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, bottom: 10, top: 10),
                            child: Text(AppLocalizations.of(context)!
                                .translate('part3_session_r19')),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12, top: 8),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('$rpk19'),
                        )),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Divider(
              height: 1.0,
              color: Colors.grey[400],
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (rpk20 == 1) {
                    rpk20 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultRpk(rpk20: 0);
                  } else {
                    rpk20 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultRpk(rpk20: 1);
                  }
                });
              },
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(ScreenUtil().setSp(10)),
                  1: FlexColumnWidth(ScreenUtil().setSp(1.5)),
                },
                children: [
                  TableRow(children: [
                    Container(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, bottom: 10, top: 10),
                            child: Text(AppLocalizations.of(context)!
                                .translate('part3_session_r20')),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12, top: 8),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('$rpk20'),
                        )),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Divider(
              height: 1.0,
              color: Colors.grey[400],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  AppLocalizations.of(context)!
                      .translate('part3_session_r_bold_lbl3'),
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Divider(
              height: 1.0,
              color: Colors.grey[400],
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (rpk21 == 1) {
                    rpk21 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultRpk(rpk21: 0);
                  } else {
                    rpk21 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultRpk(rpk21: 1);
                  }
                });
              },
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(ScreenUtil().setSp(10)),
                  1: FlexColumnWidth(ScreenUtil().setSp(1.5)),
                },
                children: [
                  TableRow(children: [
                    Container(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, bottom: 10, top: 10),
                            child: Text(AppLocalizations.of(context)!
                                .translate('part3_session_r21')),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12, top: 8),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('$rpk21'),
                        )),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Divider(
              height: 1.0,
              color: Colors.grey[400],
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (rpk22 == 1) {
                    rpk22 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultRpk(rpk22: 0);
                  } else {
                    rpk22 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultRpk(rpk22: 1);
                  }
                });
              },
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(ScreenUtil().setSp(10)),
                  1: FlexColumnWidth(ScreenUtil().setSp(1.5)),
                },
                children: [
                  TableRow(children: [
                    Container(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, bottom: 10, top: 10),
                            child: Text(AppLocalizations.of(context)!
                                .translate('part3_session_r22')),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12, top: 8),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('$rpk22'),
                        )),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Divider(
              height: 1.0,
              color: Colors.grey[400],
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (rpk23 == 1) {
                    rpk23 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultRpk(rpk23: 0);
                  } else {
                    rpk23 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultRpk(rpk23: 1);
                  }
                });
              },
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(ScreenUtil().setSp(10)),
                  1: FlexColumnWidth(ScreenUtil().setSp(1.5)),
                },
                children: [
                  TableRow(children: [
                    Container(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, bottom: 10, top: 10),
                            child: Text(AppLocalizations.of(context)!
                                .translate('part3_session_r23')),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12, top: 8),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('$rpk23'),
                        )),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Divider(
              height: 1.0,
              color: Colors.grey[400],
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (rpk24 == 1) {
                    rpk24 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultRpk(rpk24: 0);
                  } else {
                    rpk24 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultRpk(rpk24: 1);
                  }
                });
              },
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(ScreenUtil().setSp(10)),
                  1: FlexColumnWidth(ScreenUtil().setSp(1.5)),
                },
                children: [
                  TableRow(children: [
                    Container(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, bottom: 10, top: 10),
                            child: Text(AppLocalizations.of(context)!
                                .translate('part3_session_r24')),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12, top: 8),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('$rpk24'),
                        )),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Divider(
              height: 1.0,
              color: Colors.grey[400],
            ),
          ],
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 25, top: 5),
            child: Wrap(
              children: <Widget>[
                Transform.scale(
                  scale: 1.3,
                  child: Checkbox(
                    checkColor: Colors.black,
                    activeColor: Colors.white,
                    value: checkAll,
                    onChanged: (bool? value) {
                      setState(() {
                        checkAll = value;
                        setState(() {
                          if (value!) {
                            rpk1 = 1;
                            rpk2 = 1;
                            rpk3 = 1;
                            rpk4 = 1;
                            rpk5 = 1;
                            rpk6 = 1;
                            rpk7 = 1;
                            rpk8 = 1;
                            rpk9 = 1;
                            rpk10 = 1;
                            rpk11 = 1;
                            rpk12 = 1;
                            rpk13 = 1;
                            rpk14 = 1;
                            rpk15 = 1;
                            rpk16 = 1;
                            rpk17 = 1;
                            rpk18 = 1;
                            rpk19 = 1;
                            rpk20 = 1;
                            rpk21 = 1;
                            rpk22 = 1;
                            rpk23 = 1;
                            rpk24 = 1;

                            Provider.of<JrSessionModel>(context, listen: false)
                                .setResultRpk(
                              rpk1: 1,
                              rpk2: 1,
                              rpk3: 1,
                              rpk4: 1,
                              rpk5: 1,
                              rpk6: 1,
                              rpk7: 1,
                              rpk8: 1,
                              rpk9: 1,
                              rpk10: 1,
                              rpk11: 1,
                              rpk12: 1,
                              rpk13: 1,
                              rpk14: 1,
                              rpk15: 1,
                              rpk16: 1,
                              rpk17: 1,
                              rpk18: 1,
                              rpk19: 1,
                              rpk20: 1,
                              rpk21: 1,
                              rpk22: 1,
                              rpk23: 1,
                              rpk24: 1,
                            );
                          } else {
                            rpk1 = 0;
                            rpk2 = 0;
                            rpk3 = 0;
                            rpk4 = 0;
                            rpk5 = 0;
                            rpk6 = 0;
                            rpk7 = 0;
                            rpk8 = 0;
                            rpk9 = 0;
                            rpk10 = 0;
                            rpk11 = 0;
                            rpk12 = 0;
                            rpk13 = 0;
                            rpk14 = 0;
                            rpk15 = 0;
                            rpk16 = 0;
                            rpk17 = 0;
                            rpk18 = 0;
                            rpk19 = 0;
                            rpk20 = 0;
                            rpk21 = 0;
                            rpk22 = 0;
                            rpk23 = 0;
                            rpk24 = 0;

                            Provider.of<JrSessionModel>(context, listen: false)
                                .setResultRpk(
                              rpk1: 0,
                              rpk2: 0,
                              rpk3: 0,
                              rpk4: 0,
                              rpk5: 0,
                              rpk6: 0,
                              rpk7: 0,
                              rpk8: 0,
                              rpk9: 0,
                              rpk10: 0,
                              rpk11: 0,
                              rpk12: 0,
                              rpk13: 0,
                              rpk14: 0,
                              rpk15: 0,
                              rpk16: 0,
                              rpk17: 0,
                              rpk18: 0,
                              rpk19: 0,
                              rpk20: 0,
                              rpk21: 0,
                              rpk22: 0,
                              rpk23: 0,
                              rpk24: 0,
                            );
                          }
                        });
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 30, top: 5),
            child: Container(
              child: Text(
                '$rpkMark/24',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
