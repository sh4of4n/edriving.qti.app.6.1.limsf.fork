import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:edriving_qti_app/common_library/services/model/provider_model.dart';
import 'package:edriving_qti_app/utils/constants.dart';
import 'package:edriving_qti_app/utils/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:edriving_qti_app/common_library/utils/app_localizations.dart';
import 'package:edriving_qti_app/pages/eTestingSolution/custom_expansion_tile.dart'
    as custom;
import 'package:provider/provider.dart';

final localStorage = LocalStorage();

class SessionA extends StatefulWidget {
  SessionA({Key? key}) : super(key: key);

  @override
  _SessionAState createState() => _SessionAState();
}

class _SessionAState extends State<SessionA> {
  int a1 = 0,
      a2 = 0,
      a3 = 0,
      a4 = 0,
      a5 = 0,
      a6 = 0,
      a7 = 0,
      a8 = 0,
      a9 = 0,
      a10 = 0,
      a11 = 0,
      a12 = 0,
      a13 = 0,
      a14 = 0,
      a15 = 0,
      a16 = 0,
      a17 = 0,
      a18 = 0,
      a19 = 0,
      a20 = 0;

  bool? sessionA = false;

  @override
  Widget build(BuildContext context) {
    int aMark = context.watch<JrSessionModel>().aMark;
    int aMandatoryMark = context.watch<JrSessionModel>().aMandatoryMark;

    return Stack(
      children: <Widget>[
        custom.ExpansionTile(
          title: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              AppLocalizations.of(context)!.translate('jr_session_a'),
              style:
                  (TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            ),
          ),
          headerBackgroundColor: ColorConstant.primaryColor,
          children: <Widget>[
            InkWell(
              onTap: () {
                setState(() {
                  if (a1 == 1) {
                    a1 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultA(a1: 0);
                  } else {
                    a1 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultA(a1: 1);
                  }
                });
              },
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(10.0),
                  1: FlexColumnWidth(1.5),
                }, //part3_session_b
                children: [
                  TableRow(children: [
                    Container(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, bottom: 10, top: 10),
                            child: Text(AppLocalizations.of(context)!
                                .translate('part3_session_a1')),
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
                          child: Text('$a1'),
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
                  if (a2 == 1) {
                    a2 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultA(a2: 0);
                  } else {
                    a2 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultA(a2: 1);
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
                                .translate('part3_session_a2')),
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
                          child: Text('$a2'),
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
                  if (a3 == 1) {
                    a3 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultA(a3: 0);
                  } else {
                    a3 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultA(a3: 1);
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
                                .translate('part3_session_a3')),
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
                          child: Text('$a3'),
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
                  if (a4 == 1) {
                    a4 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultA(a4: 0);
                  } else {
                    a4 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultA(a4: 1);
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
                                .translate('part3_session_a4')),
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
                          child: Text('$a4'),
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
                      .translate('part3_session_a_bold_lbl1'),
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
                  if (a5 == 1) {
                    a5 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultA(a5: 0);
                  } else {
                    a5 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultA(a5: 1);
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
                                .translate('part3_session_a5')),
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
                          child: Text('$a5'),
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
                  if (a6 == 1) {
                    a6 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultA(a6: 0);
                  } else {
                    a6 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultA(a6: 1);
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
                                .translate('part3_session_a6')),
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
                          child: Text('$a6'),
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
                  if (a7 == 1) {
                    a7 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultA(a7: 0);
                  } else {
                    a7 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultA(a7: 1);
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
                                .translate('part3_session_a7')),
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
                          child: Text('$a7'),
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
                  if (a8 == 1) {
                    a8 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultA(a8: 0);
                  } else {
                    a8 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultA(a8: 1);
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
                                .translate('part3_session_a8')),
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
                          child: Text('$a8'),
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
                  if (a9 == 1) {
                    a9 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultA(a9: 0);
                  } else {
                    a9 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultA(a9: 1);
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
                                .translate('part3_session_a9')),
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
                          child: Text('$a9'),
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
                  if (a10 == 1) {
                    a10 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultA(a10: 0);
                  } else {
                    a10 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultA(a10: 1);
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
                                .translate('part3_session_a10')),
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
                          child: Text('$a10'),
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
                  if (a11 == 1) {
                    a11 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultA(a11: 0);
                  } else {
                    a11 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultA(a11: 1);
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
                                .translate('part3_session_a11')),
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
                          child: Text('$a11'),
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
                      .translate('part3_session_a_bold_lbl2'),
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
                  if (a12 == 1) {
                    a12 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultA(a12: 0);
                  } else {
                    a12 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultA(a12: 1);
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
                                .translate('part3_session_a12')),
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
                          child: Text('$a12'),
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
                  if (a13 == 1) {
                    a13 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultA(a13: 0);
                  } else {
                    a13 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultA(a13: 1);
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
                                .translate('part3_session_a13')),
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
                          child: Text('$a13'),
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
                  if (a14 == 1) {
                    a14 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultA(a14: 0);
                  } else {
                    a14 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultA(a14: 1);
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
                                .translate('part3_session_a14')),
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
                          child: Text('$a14'),
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
                  if (a15 == 1) {
                    a15 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultA(a15: 0);
                  } else {
                    a15 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultA(a15: 1);
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
                                .translate('part3_session_a15')),
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
                          child: Text('$a15'),
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
                  if (a16 == 1) {
                    a16 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultA(a16: 0);
                  } else {
                    a16 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultA(a16: 1);
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
                                .translate('part3_session_a16')),
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
                          child: Text('$a16'),
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
                  if (a17 == 1) {
                    a17 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultA(a17: 0);
                  } else {
                    a17 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultA(a17: 1);
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
                                .translate('part3_session_a17')),
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
                          child: Text('$a17'),
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
                  if (a18 == 1) {
                    a18 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultA(a18: 0);
                  } else {
                    a18 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultA(a18: 1);
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
                                .translate('part3_session_a18')),
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
                          child: Text('$a18'),
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
                  if (a19 == 1) {
                    a19 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultA(a19: 0);
                  } else {
                    a19 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultA(a19: 1);
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
                                .translate('part3_session_a19')),
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
                          child: Text('$a19'),
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
                  if (a20 == 1) {
                    a20 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultA(a20: 0);
                  } else {
                    a20 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultA(a20: 1);
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
                            child: Text(
                              AppLocalizations.of(context)!
                                  .translate('part3_session_a20_bold'),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
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
                          child: Text('$a20'),
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
                    value: sessionA,
                    onChanged: (bool? value) {
                      setState(() {
                        sessionA = value;
                        setState(() {
                          if (value!) {
                            a1 = 1;
                            a2 = 1;
                            a3 = 1;
                            a4 = 1;
                            a5 = 1;
                            a6 = 1;
                            a7 = 1;
                            a8 = 1;
                            a9 = 1;
                            a10 = 1;
                            a11 = 1;
                            a12 = 1;
                            a13 = 1;
                            a14 = 1;
                            a15 = 1;
                            a16 = 1;
                            a17 = 1;
                            a18 = 1;
                            a19 = 1;
                            a20 = 1;

                            Provider.of<JrSessionModel>(context, listen: false)
                                .setResultA(
                              a1: 1,
                              a2: 1,
                              a3: 1,
                              a4: 1,
                              a5: 1,
                              a6: 1,
                              a7: 1,
                              a8: 1,
                              a9: 1,
                              a10: 1,
                              a11: 1,
                              a12: 1,
                              a13: 1,
                              a14: 1,
                              a15: 1,
                              a16: 1,
                              a17: 1,
                              a18: 1,
                              a19: 1,
                              a20: 1,
                            );
                          } else {
                            a1 = 0;
                            a2 = 0;
                            a3 = 0;
                            a4 = 0;
                            a5 = 0;
                            a6 = 0;
                            a7 = 0;
                            a8 = 0;
                            a9 = 0;
                            a10 = 0;
                            a11 = 0;
                            a12 = 0;
                            a13 = 0;
                            a14 = 0;
                            a15 = 0;
                            a16 = 0;
                            a17 = 0;
                            a18 = 0;
                            a19 = 0;
                            a20 = 0;

                            Provider.of<JrSessionModel>(context, listen: false)
                                .setResultA(
                              a1: 0,
                              a2: 0,
                              a3: 0,
                              a4: 0,
                              a5: 0,
                              a6: 0,
                              a7: 0,
                              a8: 0,
                              a9: 0,
                              a10: 0,
                              a11: 0,
                              a12: 0,
                              a13: 0,
                              a14: 0,
                              a15: 0,
                              a16: 0,
                              a17: 0,
                              a18: 0,
                              a19: 0,
                              a20: 0,
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
                '${aMark + aMandatoryMark}/20',
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
