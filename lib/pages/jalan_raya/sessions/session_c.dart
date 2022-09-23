import 'package:edriving_qti_app/common_library/services/model/provider_model.dart';
import 'package:edriving_qti_app/utils/constants.dart';
import 'package:edriving_qti_app/utils/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:edriving_qti_app/common_library/utils/app_localizations.dart';
import 'package:edriving_qti_app/pages/eTestingSolution/custom_expansion_tile.dart'
    as custom;
import 'package:provider/provider.dart';

class SessionC extends StatefulWidget {
  final Function()? notifyParent;
  SessionC({Key? key, this.notifyParent}) : super(key: key);

  @override
  _SessionCState createState() => _SessionCState();
}

class _SessionCState extends State<SessionC> {
  final localStorage = LocalStorage();

  int c1 = 0,
      c2 = 0,
      c3 = 0,
      c4 = 0,
      c5 = 0,
      c6 = 0,
      c7 = 0,
      c8 = 0,
      c9 = 0,
      c10 = 0,
      c11 = 0,
      c12 = 0,
      c13 = 0,
      c14 = 0,
      c15 = 0,
      c16 = 0,
      c17 = 0,
      c18 = 0;

  bool? sessionC = false;

  @override
  Widget build(BuildContext context) {
    int cMark = context.watch<JrSessionModel>().cMark;
    int cMandatoryMark = context.watch<JrSessionModel>().cMandatoryMark;

    return Stack(
      children: <Widget>[
        custom.ExpansionTile(
          headerBackgroundColor: ColorConstant.primaryColor,
          title: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              AppLocalizations.of(context)!.translate('jr_session_c'),
              style:
                  (TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            ),
          ),
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(5),
                //child: Text('Pemeriksaan Luar Kenderaan(Calon Maklum Ada/Tiada)', style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (c1 == 1) {
                    c1 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultC(c1: 0);
                  } else {
                    c1 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultC(c1: 1);
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
                                .translate('part3_session_c1')),
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
                          child: Text('$c1'),
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
                  if (c2 == 1) {
                    c2 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultC(c2: 0);
                  } else {
                    c2 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultC(c2: 1);
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
                                .translate('part3_session_c2')),
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
                          child: Text('$c2'),
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
                  if (c3 == 1) {
                    c3 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultC(c3: 0);
                  } else {
                    c3 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultC(c3: 1);
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
                                .translate('part3_session_c3')),
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
                          child: Text('$c3'),
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
                  if (c4 == 1) {
                    c4 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultC(c4: 0);
                  } else {
                    c4 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultC(c4: 1);
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
                                .translate('part3_session_c4')),
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
                          child: Text('$c4'),
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
                  if (c5 == 1) {
                    c5 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultC(c5: 0);
                  } else {
                    c5 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultC(c5: 1);
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
                                .translate('part3_session_c5')),
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
                          child: Text('$c5'),
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
                  if (c6 == 1) {
                    c6 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultC(c6: 0);
                  } else {
                    c6 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultC(c6: 1);
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
                                .translate('part3_session_c6')),
                          )),
                    ),
                    Container(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 12, top: 8),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)),
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text('$c6'),
                            )),
                          ),
                        ),
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
                  if (c7 == 1) {
                    c7 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultC(c7: 0);
                  } else {
                    c7 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultC(c7: 1);
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
                                .translate('part3_session_c7')),
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
                          child: Text('$c7'),
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
                  if (c8 == 1) {
                    c8 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultC(c8: 0);
                  } else {
                    c8 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultC(c8: 1);
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
                                .translate('part3_session_c8')),
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
                          child: Text('$c8'),
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
                  if (c9 == 1) {
                    c9 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultC(c9: 0);
                  } else {
                    c9 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultC(c9: 1);
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
                                .translate('part3_session_c9')),
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
                          child: Text('$c9'),
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
                  if (c10 == 1) {
                    c10 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultC(c10: 0);
                  } else {
                    c10 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultC(c10: 1);
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
                                .translate('part3_session_c10')),
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
                          child: Text('$c10'),
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
                  if (c11 == 1) {
                    c11 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultC(c11: 0);
                  } else {
                    c11 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultC(c11: 1);
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
                                .translate('part3_session_c11')),
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
                          child: Text('$c11'),
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
                  if (c12 == 1) {
                    c12 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultC(c12: 0);
                  } else {
                    c12 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultC(c12: 1);
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
                                .translate('part3_session_c12')),
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
                          child: Text('$c12'),
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
                  if (c13 == 1) {
                    c13 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultC(c13: 0);
                  } else {
                    c13 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultC(c13: 1);
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
                                  .translate('part3_session_c13_bold'),
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
                          child: Text('$c13'),
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
                  if (c14 == 1) {
                    c14 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultC(c14: 0);
                  } else {
                    c14 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultC(c14: 1);
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
                                  .translate('part3_session_c14_bold'),
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
                          child: Text('$c14'),
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
                  if (c15 == 1) {
                    c15 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultC(c15: 0);
                  } else {
                    c15 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultC(c15: 1);
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
                                  .translate('part3_session_c15_bold'),
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
                          child: Text('$c15'),
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
                  if (c16 == 1) {
                    c16 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultC(c16: 0);
                  } else {
                    c16 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultC(c16: 1);
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
                                  .translate('part3_session_c16_bold'),
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
                          child: Text('$c16'),
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
                  if (c17 == 1) {
                    c17 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultC(c17: 0);
                  } else {
                    c17 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultC(c17: 1);
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
                                  .translate('part3_session_c17_bold'),
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
                          child: Text('$c17'),
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
                  if (c18 == 1) {
                    c18 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultC(c18: 0);
                  } else {
                    c18 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultC(c18: 1);
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
                                  .translate('part3_session_c18_bold'),
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
                          child: Text('$c18'),
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
                    value: sessionC,
                    onChanged: (bool? value) {
                      setState(() {
                        sessionC = value;
                        setState(() {
                          if (value!) {
                            c1 = 1;
                            c2 = 1;
                            c3 = 1;
                            c4 = 1;
                            c5 = 1;
                            c6 = 1;
                            c7 = 1;
                            c8 = 1;
                            c9 = 1;
                            c10 = 1;
                            c11 = 1;
                            c12 = 1;
                            c13 = 1;
                            c14 = 1;
                            c15 = 1;
                            c16 = 1;
                            c17 = 1;
                            c18 = 1;

                            Provider.of<JrSessionModel>(context, listen: false)
                                .setResultC(
                              c1: 1,
                              c2: 1,
                              c3: 1,
                              c4: 1,
                              c5: 1,
                              c6: 1,
                              c7: 1,
                              c8: 1,
                              c9: 1,
                              c10: 1,
                              c11: 1,
                              c12: 1,
                              c13: 1,
                              c14: 1,
                              c15: 1,
                              c16: 1,
                              c17: 1,
                              c18: 1,
                            );
                          } else {
                            c1 = 0;
                            c2 = 0;
                            c3 = 0;
                            c4 = 0;
                            c5 = 0;
                            c6 = 0;
                            c7 = 0;
                            c8 = 0;
                            c9 = 0;
                            c10 = 0;
                            c11 = 0;
                            c12 = 0;
                            c13 = 0;
                            c14 = 0;
                            c15 = 0;
                            c16 = 0;
                            c17 = 0;
                            c18 = 0;

                            Provider.of<JrSessionModel>(context, listen: false)
                                .setResultC(
                              c1: 0,
                              c2: 0,
                              c3: 0,
                              c4: 0,
                              c5: 0,
                              c6: 0,
                              c7: 0,
                              c8: 0,
                              c9: 0,
                              c10: 0,
                              c11: 0,
                              c12: 0,
                              c13: 0,
                              c14: 0,
                              c15: 0,
                              c16: 0,
                              c17: 0,
                              c18: 0,
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
                '${cMark + cMandatoryMark}/18',
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
