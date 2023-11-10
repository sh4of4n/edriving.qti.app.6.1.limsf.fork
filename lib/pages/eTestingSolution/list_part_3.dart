import 'package:edriving_qti_app/utils/constants.dart';
import 'package:edriving_qti_app/utils/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:edriving_qti_app/common_library/utils/app_localizations.dart';
import 'package:edriving_qti_app/pages/eTestingSolution/custom_expansion_tile.dart'
    as custom;

final localStorage = LocalStorage();

class SessionA extends StatefulWidget {
  final Function()? notifyParent;
  const SessionA({super.key, this.notifyParent});

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
      a20 = 0,
      a21 = 0,
      a22 = 0,
      a23 = 0,
      a24 = 0;
  bool? sessionB = false;
  int countSessionA = 0;
  int countMarkA = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        custom.ExpansionTile(
          title: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              AppLocalizations.of(context)!.translate('part3_session_a'),
              style:
                  (const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
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
                      .translate('part3_session_a_bold_lbl1'),
                  style: const TextStyle(fontWeight: FontWeight.bold),
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
                  if (a1 == 1) {
                    a1 = 0;

                    countSessionA -= 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA += 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent!();
                  } else {
                    a1 = 1;
                    countSessionA += 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA -= 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent!();
                  }
                });
              },
              child: Table(
                columnWidths: const {
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
                    countSessionA -= 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA += 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent!();
                  } else {
                    a2 = 1;
                    countSessionA += 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA -= 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent!();
                  }
                });
              },
              child: Table(
                columnWidths: const {
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
                    countSessionA -= 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA += 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent!();
                  } else {
                    a3 = 1;
                    countSessionA += 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA -= 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent!();
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
                    countSessionA -= 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA += 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent!();
                  } else {
                    a4 = 1;
                    countSessionA += 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA -= 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent!();
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
                                .translate('part3_session_b4')),
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
            InkWell(
              onTap: () {
                setState(() {
                  if (a5 == 1) {
                    a5 = 0;
                    countSessionA -= 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA += 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent!();
                  } else {
                    a5 = 1;
                    countSessionA += 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA -= 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent!();
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
                    countSessionA -= 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA += 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent!();
                  } else {
                    a6 = 1;
                    countSessionA += 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA -= 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent!();
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
                    countSessionA -= 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA += 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent!();
                  } else {
                    a7 = 1;
                    countSessionA += 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA -= 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent!();
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
                    countSessionA -= 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA += 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent!();
                  } else {
                    a8 = 1;
                    countSessionA += 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA -= 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent!();
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
                    countSessionA -= 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA += 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent!();
                  } else {
                    a9 = 1;
                    countSessionA += 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA -= 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent!();
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
                    countSessionA -= 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA += 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent!();
                  } else {
                    a10 = 1;
                    countSessionA += 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA -= 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent!();
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
                    countSessionA -= 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA += 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent!();
                  } else {
                    a11 = 1;
                    countSessionA += 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA -= 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent!();
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
            InkWell(
              onTap: () {
                setState(() {
                  if (a12 == 1) {
                    a12 = 0;
                    countSessionA -= 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA += 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent!();
                  } else {
                    a12 = 1;
                    countSessionA += 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA -= 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent!();
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
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  AppLocalizations.of(context)!
                      .translate('part3_session_a_bold_lbl2'),
                  style: const TextStyle(fontWeight: FontWeight.bold),
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
                  if (a13 == 1) {
                    a13 = 0;
                    countSessionA -= 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA += 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent!();
                  } else {
                    a13 = 1;
                    countSessionA += 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA -= 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent!();
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
                    countSessionA -= 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA += 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent!();
                  } else {
                    a14 = 1;
                    countSessionA += 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA -= 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent!();
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
                    countSessionA -= 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA += 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent!();
                  } else {
                    a15 = 1;
                    countSessionA += 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA -= 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent!();
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
                    countSessionA -= 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA += 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent!();
                  } else {
                    a16 = 1;
                    countSessionA += 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA -= 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent!();
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
                    countSessionA -= 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA += 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent!();
                  } else {
                    a17 = 1;
                    countSessionA += 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA -= 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent!();
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
                    countSessionA -= 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA += 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent!();
                  } else {
                    a18 = 1;
                    countSessionA += 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA -= 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent!();
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
                    countSessionA -= 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA += 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent!();
                  } else {
                    a19 = 1;
                    countSessionA += 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA -= 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent!();
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
                    countSessionA -= 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA += 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent!();
                  } else {
                    a20 = 1;
                    countSessionA += 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA -= 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent!();
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
                                .translate('part3_session_a20')),
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
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  AppLocalizations.of(context)!
                      .translate('part3_session_a_bold_lbl3'),
                  style: const TextStyle(fontWeight: FontWeight.bold),
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
                  if (a21 == 1) {
                    a21 = 0;
                    countSessionA -= 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA += 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent!();
                  } else {
                    a21 = 1;
                    countSessionA += 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA -= 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent!();
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
                                .translate('part3_session_a21')),
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
                          child: Text('$a21'),
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
                  if (a22 == 1) {
                    a22 = 0;
                    countSessionA -= 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA += 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent!();
                  } else {
                    a22 = 1;
                    countSessionA += 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA -= 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent!();
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
                                .translate('part3_session_a22')),
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
                          child: Text('$a22'),
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
                  if (a23 == 1) {
                    a23 = 0;
                    countSessionA -= 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA += 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent!();
                  } else {
                    a23 = 1;
                    countSessionA += 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA -= 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent!();
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
                                .translate('part3_session_a23')),
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
                          child: Text('$a23'),
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
                  if (a24 == 1) {
                    a24 = 0;
                    countSessionA -= 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA += 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent!();
                  } else {
                    a24 = 1;
                    countSessionA += 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA -= 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent!();
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
                                .translate('part3_session_a24')),
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
                          child: Text('$a24'),
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
                    value: sessionB,
                    onChanged: (bool? value) {
                      setState(() {
                        sessionB = value;
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
                            a21 = 1;
                            a22 = 1;
                            a23 = 1;
                            a24 = 1;
                            countSessionA = 24;
                            countMarkA = 0;
                            localStorage.setPart3MarkSessionA(countSessionA);
                            localStorage.setPart2MarkB(countMarkA);
                            widget.notifyParent!();
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
                            a21 = 0;
                            a22 = 0;
                            a23 = 0;
                            a24 = 0;
                            countSessionA = 0;
                            countMarkA = 24;
                            localStorage.setPart3MarkSessionA(countSessionA);
                            localStorage.setPart2MarkB(countMarkA);
                            widget.notifyParent!();
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
                '$countSessionA/24',
                style:
                    const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SessionB extends StatefulWidget {
  final Function()? notifyParent;
  const SessionB({super.key, this.notifyParent});

  @override
  _SessionBState createState() => _SessionBState();
}

class _SessionBState extends State<SessionB> {
  int b1 = 0,
      b2 = 0,
      b3 = 0,
      b4 = 0,
      b5 = 0,
      b6 = 0,
      b7 = 0,
      b8 = 0,
      b9 = 0,
      b10 = 0,
      b11 = 0,
      b12 = 0,
      b13 = 0,
      b14 = 0,
      b15 = 0,
      b16 = 0,
      b17 = 0,
      b18 = 0,
      b19 = 0,
      b20 = 0;
  bool? sessionB = false;
  int countSessionB = 0;
  int countMarkBN = 0;
  int countMarkBM = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        custom.ExpansionTile(
          title: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              AppLocalizations.of(context)!.translate('part3_session_b'),
              style:
                  (const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            ),
          ),
          headerBackgroundColor: ColorConstant.primaryColor,
          children: <Widget>[
            InkWell(
              onTap: () {
                setState(() {
                  if (b1 == 1) {
                    b1 = 0;
                    countSessionB -= 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN -= 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    widget.notifyParent!();
                  } else {
                    b1 = 1;
                    countSessionB += 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN += 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    widget.notifyParent!();
                  }
                });
              },
              child: Table(
                columnWidths: const {
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
                                .translate('part3_session_b1')),
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
                          child: Text('$b1'),
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
                  if (b2 == 1) {
                    b2 = 0;
                    countSessionB -= 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN -= 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    widget.notifyParent!();
                  } else {
                    b2 = 1;
                    countSessionB += 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN += 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    widget.notifyParent!();
                  }
                });
              },
              child: Table(
                columnWidths: const {
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
                                .translate('part3_session_b2')),
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
                          child: Text('$b2'),
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
                  if (b3 == 1) {
                    b3 = 0;
                    countSessionB -= 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN -= 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    widget.notifyParent!();
                  } else {
                    b3 = 1;
                    countSessionB += 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN += 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    widget.notifyParent!();
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
                                .translate('part3_session_b3')),
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
                          child: Text('$b3'),
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
                  if (b4 == 1) {
                    b4 = 0;
                    countSessionB -= 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN -= 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    widget.notifyParent!();
                  } else {
                    b4 = 1;
                    countSessionB += 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN += 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    widget.notifyParent!();
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
                                .translate('part3_session_b4')),
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
                          child: Text('$b4'),
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
                      .translate('part3_session_b_bold_lbl1'),
                  style: const TextStyle(fontWeight: FontWeight.bold),
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
                  if (b5 == 1) {
                    b5 = 0;
                    countSessionB -= 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN -= 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    widget.notifyParent!();
                  } else {
                    b5 = 1;
                    countSessionB += 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN += 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    widget.notifyParent!();
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
                                .translate('part3_session_b5')),
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
                          child: Text('$b5'),
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
                  if (b6 == 1) {
                    b6 = 0;
                    countSessionB -= 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN -= 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    widget.notifyParent!();
                  } else {
                    b6 = 1;
                    countSessionB += 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN += 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    widget.notifyParent!();
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
                                .translate('part3_session_b6')),
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
                          child: Text('$b6'),
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
                  if (b7 == 1) {
                    b7 = 0;
                    countSessionB -= 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN -= 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    widget.notifyParent!();
                  } else {
                    b7 = 1;
                    countSessionB += 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN += 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    widget.notifyParent!();
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
                                .translate('part3_session_b7')),
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
                          child: Text('$b7'),
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
                  if (b8 == 1) {
                    b8 = 0;
                    countSessionB -= 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN -= 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    widget.notifyParent!();
                  } else {
                    b8 = 1;
                    countSessionB += 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN += 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    widget.notifyParent!();
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
                                .translate('part3_session_b8')),
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
                          child: Text('$b8'),
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
                  if (b9 == 1) {
                    b9 = 0;
                    countSessionB -= 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN -= 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    widget.notifyParent!();
                  } else {
                    b9 = 1;
                    countSessionB += 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN += 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    widget.notifyParent!();
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
                                .translate('part3_session_b9')),
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
                          child: Text('$b9'),
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
                  if (b10 == 1) {
                    b10 = 0;
                    countSessionB -= 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN -= 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    widget.notifyParent!();
                  } else {
                    b10 = 1;
                    countSessionB += 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN += 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    widget.notifyParent!();
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
                                .translate('part3_session_b10')),
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
                          child: Text('$b10'),
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
                  if (b11 == 1) {
                    b11 = 0;
                    countSessionB -= 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN -= 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    widget.notifyParent!();
                  } else {
                    b11 = 1;
                    countSessionB += 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN += 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    widget.notifyParent!();
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
                                .translate('part3_session_b11')),
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
                          child: Text('$b11'),
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
                      .translate('part3_session_b_bold_lbl2'),
                  style: const TextStyle(fontWeight: FontWeight.bold),
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
                  if (b12 == 1) {
                    b12 = 0;
                    countSessionB -= 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN -= 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    widget.notifyParent!();
                  } else {
                    b12 = 1;
                    countSessionB += 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN += 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    widget.notifyParent!();
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
                                .translate('part3_session_b12')),
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
                          child: Text('$b12'),
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
                  if (b13 == 1) {
                    b13 = 0;
                    countSessionB -= 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN -= 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    widget.notifyParent!();
                  } else {
                    b13 = 1;
                    countSessionB += 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN += 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    widget.notifyParent!();
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
                                .translate('part3_session_b13')),
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
                          child: Text('$b13'),
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
                  if (b14 == 1) {
                    b14 = 0;
                    countSessionB -= 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN -= 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    widget.notifyParent!();
                  } else {
                    b14 = 1;
                    countSessionB += 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN += 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    widget.notifyParent!();
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
                                .translate('part3_session_b14')),
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
                          child: Text('$b14'),
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
                  if (b15 == 1) {
                    b15 = 0;
                    countSessionB -= 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN -= 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    widget.notifyParent!();
                  } else {
                    b15 = 1;
                    countSessionB += 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN += 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    widget.notifyParent!();
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
                                .translate('part3_session_b15')),
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
                          child: Text('$b15'),
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
                  if (b16 == 1) {
                    b16 = 0;
                    countSessionB -= 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN -= 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    widget.notifyParent!();
                  } else {
                    b16 = 1;
                    countSessionB += 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN += 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    widget.notifyParent!();
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
                                .translate('part3_session_b16')),
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
                          child: Text('$b16'),
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
                  if (b17 == 1) {
                    b17 = 0;
                    countSessionB -= 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN -= 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    widget.notifyParent!();
                  } else {
                    b17 = 1;
                    countSessionB += 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN += 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    widget.notifyParent!();
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
                                .translate('part3_session_b17')),
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
                          child: Text('$b17'),
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
                  if (b18 == 1) {
                    b18 = 0;
                    countSessionB -= 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN -= 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    widget.notifyParent!();
                  } else {
                    b18 = 1;
                    countSessionB += 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN += 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    widget.notifyParent!();
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
                                .translate('part3_session_b18')),
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
                          child: Text('$b18'),
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
                  if (b19 == 1) {
                    b19 = 0;
                    countSessionB -= 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN -= 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    widget.notifyParent!();
                  } else {
                    b19 = 1;
                    countSessionB += 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN += 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    widget.notifyParent!();
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
                                .translate('part3_session_b19')),
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
                          child: Text('$b19'),
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
                  if (b20 == 1) {
                    b20 = 0;
                    countSessionB -= 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBM -= 1;
                    localStorage.setPart3MarkBM(countMarkBM);
                    widget.notifyParent!();
                  } else {
                    b20 = 1;
                    countSessionB += 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBM += 1;
                    localStorage.setPart3MarkBM(countMarkBM);
                    widget.notifyParent!();
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
                                  .translate('part3_session_b20_bold'),
                              style: const TextStyle(fontWeight: FontWeight.bold),
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
                          child: Text('$b20'),
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
                    value: sessionB,
                    onChanged: (bool? value) {
                      setState(() {
                        sessionB = value;
                        setState(() {
                          if (value!) {
                            b1 = 1;
                            b2 = 1;
                            b3 = 1;
                            b4 = 1;
                            b5 = 1;
                            b6 = 1;
                            b7 = 1;
                            b8 = 1;
                            b9 = 1;
                            b10 = 1;
                            b11 = 1;
                            b12 = 1;
                            b13 = 1;
                            b14 = 1;
                            b15 = 1;
                            b16 = 1;
                            b17 = 1;
                            b18 = 1;
                            b19 = 1;
                            b20 = 1;
                            countSessionB = 20;
                            countMarkBN = 19;
                            countMarkBM = 1;
                            localStorage.setPart3MarkBM(countMarkBM);
                            localStorage.setPart3MarkSessionB(countSessionB);
                            localStorage.setPart3MarkB(countMarkBN);
                            widget.notifyParent!();
                          } else {
                            b1 = 0;
                            b2 = 0;
                            b3 = 0;
                            b4 = 0;
                            b5 = 0;
                            b6 = 0;
                            b7 = 0;
                            b8 = 0;
                            b9 = 0;
                            b10 = 0;
                            b11 = 0;
                            b12 = 0;
                            b13 = 0;
                            b14 = 0;
                            b15 = 0;
                            b16 = 0;
                            b17 = 0;
                            b18 = 0;
                            b19 = 0;
                            b20 = 0;
                            countSessionB = 0;
                            countMarkBN = 0;
                            countMarkBM = 0;
                            localStorage.setPart3MarkBM(countMarkBM);
                            localStorage.setPart3MarkSessionB(countSessionB);
                            localStorage.setPart3MarkB(countMarkBN);
                            widget.notifyParent!();
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
                '$countSessionB/20',
                style:
                    const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SessionC extends StatefulWidget {
  final Function()? notifyParent;
  const SessionC({super.key, this.notifyParent});

  @override
  _SessionCState createState() => _SessionCState();
}

class _SessionCState extends State<SessionC> {
  int c1 = 0,
      c2 = 0,
      c3 = 0,
      c4 = 0,
      c5 = 0,
      c6 = 0,
      c7 = 0,
      c8 = 0,
      c9 = 0,
      c10 = 0;
  int countSessionC = 0;

  int countMarkCM = 0;
  int countMarkC = 0;
  bool? sessionC = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        custom.ExpansionTile(
          title: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              AppLocalizations.of(context)!.translate('part3_session_c'),
              style:
                  (const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            ),
          ),
          headerBackgroundColor: ColorConstant.primaryColor,
          children: <Widget>[
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(5),
                //child: Text('Pemeriksaan Luar Kenderaan(Calon Maklum Ada/Tiada)', style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (c1 == 1) {
                    c1 = 0;
                    countSessionC -= 1;
                    localStorage.setPart3MarkSessionC(countSessionC);

                    //count normal deduct marks
                    countMarkC -= 1;
                    localStorage.setPart3MarkC(countMarkC);
                    widget.notifyParent!();
                  } else {
                    c1 = 1;
                    countSessionC += 1;
                    localStorage.setPart3MarkSessionC(countSessionC);

                    //count normal deduct marks
                    countMarkC += 1;
                    localStorage.setPart3MarkC(countMarkC);
                    widget.notifyParent!();
                  }
                });
              },
              child: Table(
                columnWidths: const {
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
                    countSessionC -= 1;
                    localStorage.setPart3MarkSessionC(countSessionC);

                    //count normal deduct marks
                    countMarkC += 1;
                    localStorage.setPart3MarkC(countMarkC);
                    widget.notifyParent!();
                  } else {
                    c2 = 1;
                    countSessionC += 1;
                    localStorage.setPart3MarkSessionC(countSessionC);

                    //count normal deduct marks
                    countMarkC += 1;
                    localStorage.setPart3MarkC(countMarkC);
                    widget.notifyParent!();
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
                    countSessionC -= 1;
                    localStorage.setPart3MarkSessionC(countSessionC);

                    //count normal deduct mark
                    countMarkC += 1;
                    localStorage.setPart3MarkC(countMarkC);
                    widget.notifyParent!();
                  } else {
                    c3 = 1;
                    countSessionC += 1;
                    localStorage.setPart3MarkSessionC(countSessionC);

                    //count normal deduct mark
                    countMarkC += 1;
                    localStorage.setPart3MarkC(countMarkC);
                    widget.notifyParent!();
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
                    countSessionC -= 1;
                    localStorage.setPart3MarkSessionC(countSessionC);
                    //count normal deduct mark
                    countMarkC -= 1;
                    localStorage.setPart3MarkC(countMarkC);
                    widget.notifyParent!();
                  } else {
                    c4 = 1;
                    countSessionC += 1;
                    localStorage.setPart3MarkSessionC(countSessionC);

                    //count normal deduct mark
                    countMarkC += 1;
                    localStorage.setPart3MarkC(countMarkC);
                    widget.notifyParent!();
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
                    countSessionC -= 1;
                    localStorage.setPart3MarkSessionC(countSessionC);
                    //count normal deduct mark
                    countMarkC += 1;
                    localStorage.setPart3MarkC(countMarkC);
                    widget.notifyParent!();
                  } else {
                    c5 = 1;
                    countSessionC += 1;
                    localStorage.setPart3MarkSessionC(countSessionC);
                    //count normal deduct mark
                    countMarkC += 1;
                    localStorage.setPart3MarkC(countMarkC);
                    widget.notifyParent!();
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
                    countSessionC -= 1;
                    localStorage.setPart3MarkSessionC(countSessionC);
                    //count normal deduct mark
                    countMarkC -= 1;
                    localStorage.setPart3MarkC(countMarkC);
                  } else {
                    c6 = 1;
                    countSessionC += 1;
                    localStorage.setPart3MarkSessionC(countSessionC);
                    //count normal deduct mark
                    countMarkC += 1;
                    localStorage.setPart3MarkC(countMarkC);
                    widget.notifyParent!();
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
                    countSessionC -= 1;
                    localStorage.setPart3MarkSessionC(countSessionC);
                    //count normal deduct mark
                    countMarkC -= 1;
                    localStorage.setPart3MarkC(countMarkC);
                  } else {
                    c7 = 1;
                    countSessionC += 1;
                    localStorage.setPart2MarkSessionC(countSessionC);
                    //count normal deduct mark
                    countMarkC += 1;
                    localStorage.setPart3MarkC(countMarkC);
                    widget.notifyParent!();
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
                    countMarkCM -= 1;
                    localStorage.setPart3MarkCM(countMarkCM);
                    countSessionC -= 1;
                    localStorage.setPart2MarkSessionC(countSessionC);
                    widget.notifyParent!();
                  } else {
                    c8 = 1;
                    countSessionC += 1;
                    localStorage.setPart2MarkSessionC(countSessionC);
                    countMarkCM += 1;
                    localStorage.setPart3MarkCM(countMarkCM);
                    widget.notifyParent!();
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
                                    .translate('part3_session_c8_bold'),
                                style: const TextStyle(fontWeight: FontWeight.bold)),
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
                    countMarkCM -= 1;
                    localStorage.setPart3MarkCM(countMarkCM);
                    countSessionC -= 1;
                    localStorage.setPart2MarkSessionC(countSessionC);
                    widget.notifyParent!();
                  } else {
                    c9 = 1;
                    countSessionC += 1;
                    localStorage.setPart2MarkSessionC(countSessionC);
                    countMarkCM += 1;
                    localStorage.setPart3MarkCM(countMarkCM);
                    widget.notifyParent!();
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
                                    .translate('part3_session_c9_bold'),
                                style: const TextStyle(fontWeight: FontWeight.bold)),
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
                    countMarkCM -= 1;
                    localStorage.setPart3MarkCM(countMarkCM);
                    countSessionC -= 1;
                    localStorage.setPart2MarkSessionC(countSessionC);
                    widget.notifyParent!();
                  } else {
                    c10 = 1;
                    countSessionC += 1;
                    localStorage.setPart2MarkSessionC(countSessionC);
                    countMarkCM += 1;
                    localStorage.setPart3MarkCM(countMarkCM);
                    widget.notifyParent!();
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
                                  .translate('part3_session_c10_bold'),
                              style: const TextStyle(fontWeight: FontWeight.bold),
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
                            countSessionC = 10;
                            localStorage.setPart3MarkSessionC(countSessionC);
                            countMarkCM = 3;
                            countMarkC = 7;
                            localStorage.setPart3MarkCM(countMarkCM);
                            localStorage.setPart3MarkC(countMarkC);
                            widget.notifyParent!();
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
                            countSessionC = 0;
                            localStorage.setPart3MarkSessionC(countSessionC);
                            countMarkCM = 0;
                            countMarkC = 0;
                            localStorage.setPart3MarkCM(countMarkCM);
                            localStorage.setPart3MarkC(countMarkC);
                            widget.notifyParent!();
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
                '$countSessionC/10',
                style:
                    const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SessionD extends StatefulWidget {
  final Function()? notifyParent;
  const SessionD({super.key, this.notifyParent});

  @override
  _SessionDState createState() => _SessionDState();
}

class _SessionDState extends State<SessionD> {
  int d1 = 0,
      d2 = 0,
      d3 = 0,
      d4 = 0,
      d5 = 0,
      d6 = 0,
      d7 = 0,
      d8 = 0,
      d9 = 0,
      d10 = 0,
      d11 = 0,
      d12 = 0,
      d13 = 0,
      d14 = 0,
      d15 = 0,
      d16 = 0,
      d17 = 0,
      d18 = 0;
  int countSessionD = 0;
  int countMarkDM = 0;
  int countMarkD = 0;
  bool? sessionD = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        custom.ExpansionTile(
          headerBackgroundColor: ColorConstant.primaryColor,
          title: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              AppLocalizations.of(context)!.translate('part3_session_d'),
              style:
                  (const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            ),
          ),
          children: <Widget>[
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(5),
                //child: Text('Pemeriksaan Luar Kenderaan(Calon Maklum Ada/Tiada)', style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (d1 == 1) {
                    d1 = 0;
                    countSessionD -= 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkD -= 1;
                    localStorage.setPart3MarkD(countMarkD);
                    widget.notifyParent!();
                  } else {
                    d1 = 1;
                    countSessionD += 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkD += 1;
                    localStorage.setPart3MarkD(countMarkD);
                    widget.notifyParent!();
                  }
                });
              },
              child: Table(
                columnWidths: const {
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
                                .translate('part3_session_d1')),
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
                          child: Text('$d1'),
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
                  if (d2 == 1) {
                    d2 = 0;
                    countSessionD -= 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkD -= 1;
                    localStorage.setPart3MarkD(countMarkD);
                    widget.notifyParent!();
                  } else {
                    d2 = 1;
                    countSessionD += 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkD += 1;
                    localStorage.setPart3MarkD(countMarkD);
                    widget.notifyParent!();
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
                                .translate('part3_session_d2')),
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
                          child: Text('$d2'),
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
                  if (d3 == 1) {
                    d3 = 0;
                    countSessionD -= 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkD -= 1;
                    localStorage.setPart3MarkD(countMarkD);
                    widget.notifyParent!();
                  } else {
                    d3 = 1;
                    countSessionD += 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkD += 1;
                    localStorage.setPart3MarkD(countMarkD);
                    widget.notifyParent!();
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
                                .translate('part3_session_d3')),
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
                          child: Text('$d3'),
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
                  if (d4 == 1) {
                    d4 = 0;
                    countSessionD -= 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkD -= 1;
                    localStorage.setPart3MarkD(countMarkD);
                    widget.notifyParent!();
                  } else {
                    d4 = 1;
                    countSessionD += 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkD += 1;
                    localStorage.setPart3MarkD(countMarkD);
                    widget.notifyParent!();
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
                                .translate('part3_session_d4')),
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
                          child: Text('$d4'),
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
                  if (d5 == 1) {
                    d5 = 0;
                    countSessionD -= 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkD -= 1;
                    localStorage.setPart3MarkD(countMarkD);
                    widget.notifyParent!();
                  } else {
                    d5 = 1;
                    countSessionD += 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkD += 1;
                    localStorage.setPart3MarkD(countMarkD);
                    widget.notifyParent!();
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
                                .translate('part3_session_d5')),
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
                          child: Text('$d5'),
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
                  if (d6 == 1) {
                    d6 = 0;
                    countSessionD -= 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkD -= 1;
                    localStorage.setPart3MarkD(countMarkD);
                    widget.notifyParent!();
                  } else {
                    d6 = 1;
                    countSessionD += 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkD += 1;
                    localStorage.setPart3MarkD(countMarkD);
                    widget.notifyParent!();
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
                                .translate('part3_session_d6')),
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
                              child: Text('$d6'),
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
                  if (d7 == 1) {
                    d7 = 0;
                    countSessionD -= 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkD -= 1;
                    localStorage.setPart3MarkD(countMarkD);
                    widget.notifyParent!();
                  } else {
                    d7 = 1;
                    countSessionD += 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkD += 1;
                    localStorage.setPart3MarkD(countMarkD);
                    widget.notifyParent!();
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
                                .translate('part3_session_d7')),
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
                          child: Text('$d7'),
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
                  if (d8 == 1) {
                    d8 = 0;
                    countSessionD -= 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkD -= 1;
                    localStorage.setPart3MarkD(countMarkD);
                    widget.notifyParent!();
                  } else {
                    d8 = 1;
                    countSessionD += 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkD += 1;
                    localStorage.setPart3MarkD(countMarkD);
                    widget.notifyParent!();
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
                                .translate('part3_session_d8')),
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
                          child: Text('$d8'),
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
                  if (d9 == 1) {
                    d9 = 0;
                    countSessionD -= 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkD -= 1;
                    localStorage.setPart3MarkD(countMarkD);
                    widget.notifyParent!();
                  } else {
                    d9 = 1;
                    countSessionD += 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkD += 1;
                    localStorage.setPart3MarkD(countMarkD);
                    widget.notifyParent!();
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
                                .translate('part3_session_d9')),
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
                          child: Text('$d9'),
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
                  if (d10 == 1) {
                    d10 = 0;
                    countSessionD -= 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkD -= 1;
                    localStorage.setPart3MarkD(countMarkD);
                    widget.notifyParent!();
                  } else {
                    d10 = 1;
                    countSessionD += 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkD += 1;
                    localStorage.setPart3MarkD(countMarkD);
                    widget.notifyParent!();
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
                                .translate('part3_session_d10')),
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
                          child: Text('$d10'),
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
                  if (d11 == 1) {
                    d11 = 0;
                    countSessionD -= 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkD -= 1;
                    localStorage.setPart3MarkD(countMarkD);
                    widget.notifyParent!();
                  } else {
                    d11 = 1;
                    countSessionD += 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkD += 1;
                    localStorage.setPart3MarkD(countMarkD);
                    widget.notifyParent!();
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
                                .translate('part3_session_d11')),
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
                          child: Text('$d11'),
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
                  if (d12 == 1) {
                    d12 = 0;
                    countSessionD -= 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkDM -= 1;
                    localStorage.setPart3MarkDM(countMarkDM);
                    widget.notifyParent!();
                  } else {
                    d12 = 1;
                    countSessionD += 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkDM += 1;
                    localStorage.setPart3MarkDM(countMarkDM);
                    widget.notifyParent!();
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
                                .translate('part3_session_d12')),
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
                          child: Text('$d12'),
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
                  if (d13 == 1) {
                    d13 = 0;
                    countSessionD -= 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkDM -= 1;
                    localStorage.setPart3MarkDM(countMarkDM);
                    widget.notifyParent!();
                  } else {
                    d13 = 1;
                    countSessionD += 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkDM += 1;
                    localStorage.setPart3MarkDM(countMarkDM);
                    widget.notifyParent!();
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
                                  .translate('part3_session_d13_bold'),
                              style: const TextStyle(fontWeight: FontWeight.bold),
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
                          child: Text('$d13'),
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
                  if (d14 == 1) {
                    d14 = 0;
                    countSessionD -= 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkDM -= 1;
                    localStorage.setPart3MarkDM(countMarkDM);
                    widget.notifyParent!();
                  } else {
                    d14 = 1;
                    countSessionD += 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkDM += 1;
                    localStorage.setPart3MarkDM(countMarkDM);
                    widget.notifyParent!();
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
                                  .translate('part3_session_d14_bold'),
                              style: const TextStyle(fontWeight: FontWeight.bold),
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
                          child: Text('$d14'),
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
                  if (d15 == 1) {
                    d15 = 0;
                    countSessionD -= 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkDM -= 1;
                    localStorage.setPart3MarkDM(countMarkDM);
                    widget.notifyParent!();
                  } else {
                    d15 = 1;
                    countSessionD += 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkDM += 1;
                    localStorage.setPart3MarkDM(countMarkDM);
                    widget.notifyParent!();
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
                                  .translate('part3_session_d15_bold'),
                              style: const TextStyle(fontWeight: FontWeight.bold),
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
                          child: Text('$d15'),
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
                  if (d16 == 1) {
                    d16 = 0;
                    countSessionD -= 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkDM -= 1;
                    localStorage.setPart3MarkDM(countMarkDM);
                    widget.notifyParent!();
                  } else {
                    d16 = 1;
                    countSessionD += 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkDM += 1;
                    localStorage.setPart3MarkDM(countMarkDM);
                    widget.notifyParent!();
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
                                  .translate('part3_session_d16_bold'),
                              style: const TextStyle(fontWeight: FontWeight.bold),
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
                          child: Text('$d16'),
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
                  if (d17 == 1) {
                    d17 = 0;
                    countSessionD -= 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkDM -= 1;
                    localStorage.setPart3MarkDM(countMarkDM);
                    widget.notifyParent!();
                  } else {
                    d17 = 1;
                    countSessionD += 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkDM += 1;
                    localStorage.setPart3MarkDM(countMarkDM);
                    widget.notifyParent!();
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
                                  .translate('part3_session_d17_bold'),
                              style: const TextStyle(fontWeight: FontWeight.bold),
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
                          child: Text('$d17'),
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
                  if (d18 == 1) {
                    d18 = 0;
                    countSessionD -= 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkDM -= 1;
                    localStorage.setPart3MarkDM(countMarkDM);
                    widget.notifyParent!();
                  } else {
                    d18 = 1;
                    countSessionD += 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkDM += 1;
                    localStorage.setPart3MarkDM(countMarkDM);
                    widget.notifyParent!();
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
                                  .translate('part3_session_d18_bold'),
                              style: const TextStyle(fontWeight: FontWeight.bold),
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
                          child: Text('$d18'),
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
                    value: sessionD,
                    onChanged: (bool? value) {
                      setState(() {
                        sessionD = value;
                        setState(() {
                          if (value!) {
                            d1 = 1;
                            d2 = 1;
                            d3 = 1;
                            d4 = 1;
                            d5 = 1;
                            d6 = 1;
                            d7 = 1;
                            d8 = 1;
                            d9 = 1;
                            d10 = 1;
                            d11 = 1;
                            d12 = 1;
                            d13 = 1;
                            d14 = 1;
                            d15 = 1;
                            d16 = 1;
                            d17 = 1;
                            d18 = 1;
                            countSessionD = 18;
                            localStorage.setPart3MarkSessionD(countSessionD);
                            countMarkD = 12;
                            countMarkDM = 6;
                            localStorage.setPart3MarkD(countMarkD);
                            localStorage.setPart3MarkDM(countMarkDM);
                            widget.notifyParent!();
                          } else {
                            d1 = 0;
                            d2 = 0;
                            d3 = 0;
                            d4 = 0;
                            d5 = 0;
                            d6 = 0;
                            d7 = 0;
                            d8 = 0;
                            d9 = 0;
                            d10 = 0;
                            d11 = 0;
                            d12 = 0;
                            d13 = 0;
                            d14 = 0;
                            d15 = 0;
                            d16 = 0;
                            d17 = 0;
                            d18 = 0;
                            countSessionD = 0;
                            localStorage.setPart3MarkSessionD(countSessionD);
                            countMarkD = 0;
                            countMarkDM = 0;
                            localStorage.setPart3MarkD(countMarkD);
                            localStorage.setPart3MarkDM(countMarkDM);
                            widget.notifyParent!();
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
                '$countSessionD/18',
                style:
                    const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SessionE extends StatefulWidget {
  final Function()? notifyParent;
  const SessionE({super.key, this.notifyParent});

  @override
  _SessionEState createState() => _SessionEState();
}

class _SessionEState extends State<SessionE> {
  int e1 = 0,
      e2 = 0,
      e3 = 0,
      e4 = 0,
      e5 = 0,
      e6 = 0,
      e7 = 0,
      e8 = 0,
      e9 = 0,
      e10 = 0,
      e11 = 0,
      e12 = 0,
      e13 = 0,
      e14 = 0,
      e15 = 0,
      e16 = 0,
      e17 = 0,
      e18 = 0,
      e19 = 0,
      e20 = 0;

  int countMarkEM = 0;
  int countMarkE = 0;

  int countSessionE = 0;
  bool? sessionE = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        custom.ExpansionTile(
          headerBackgroundColor: ColorConstant.primaryColor,
          title: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              AppLocalizations.of(context)!.translate('part3_session_e'),
              style:
                  (const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            ),
          ),
          children: <Widget>[
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(5),
                //child: Text('Pemeriksaan Luar Kenderaan(Calon Maklum Ada/Tiada)', style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (e1 == 1) {
                    e1 = 0;
                    countSessionE -= 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct normal mark
                    countMarkE -= 1;
                    localStorage.setPart3MarkE(countMarkE);

                    widget.notifyParent!();
                  } else {
                    e1 = 1;
                    countSessionE += 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct normal mark
                    countMarkE += 1;
                    localStorage.setPart3MarkE(countMarkE);
                    widget.notifyParent!();
                  }
                });
              },
              child: Table(
                columnWidths: const {
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
                                .translate('part3_session_e1')),
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
                          child: Text('$e1'),
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
                  if (e2 == 1) {
                    e2 = 0;
                    countSessionE -= 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct normal mark
                    countMarkE -= 1;
                    localStorage.setPart3MarkE(countMarkE);
                    widget.notifyParent!();
                  } else {
                    e2 = 1;
                    countSessionE += 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct normal mark
                    countMarkE += 1;
                    localStorage.setPart3MarkE(countMarkE);
                    widget.notifyParent!();
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
                                .translate('part3_session_e2')),
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
                          child: Text('$e2'),
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
                  if (e3 == 1) {
                    e3 = 0;
                    countSessionE -= 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct normal mark
                    countMarkE -= 1;
                    localStorage.setPart3MarkE(countMarkE);
                    widget.notifyParent!();
                  } else {
                    e3 = 1;
                    countSessionE += 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct normal mark
                    countMarkE += 1;
                    localStorage.setPart3MarkE(countMarkE);
                    widget.notifyParent!();
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
                                .translate('part3_session_e3')),
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
                          child: Text('$e3'),
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
                  if (e4 == 1) {
                    e4 = 0;
                    countSessionE -= 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct normal mark
                    countMarkE -= 1;
                    localStorage.setPart3MarkE(countMarkE);
                    widget.notifyParent!();
                  } else {
                    e4 = 1;
                    countSessionE += 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct normal mark
                    countMarkE += 1;
                    localStorage.setPart3MarkE(countMarkE);
                    widget.notifyParent!();
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
                                .translate('part3_session_e4')),
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
                          child: Text('$e4'),
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
                  if (e5 == 1) {
                    e5 = 0;
                    countSessionE -= 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct normal mark
                    countMarkE -= 1;
                    localStorage.setPart3MarkE(countMarkE);
                    widget.notifyParent!();
                  } else {
                    e5 = 1;
                    countSessionE += 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct normal mark
                    countMarkE += 1;
                    localStorage.setPart3MarkE(countMarkE);
                    widget.notifyParent!();
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
                                .translate('part3_session_e5')),
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
                          child: Text('$e5'),
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
                  if (e6 == 1) {
                    e6 = 0;
                    countSessionE -= 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct normal mark
                    countMarkE -= 1;
                    localStorage.setPart3MarkE(countMarkE);
                    widget.notifyParent!();
                  } else {
                    e6 = 1;
                    countSessionE += 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct normal mark
                    countMarkE += 1;
                    localStorage.setPart3MarkE(countMarkE);
                    widget.notifyParent!();
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
                                .translate('part3_session_e6')),
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
                              child: Text('$e6'),
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
                  if (e7 == 1) {
                    e7 = 0;
                    countSessionE -= 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkE -= 1;
                    localStorage.setPart3MarkE(countMarkE);
                    widget.notifyParent!();
                  } else {
                    e7 = 1;
                    countSessionE += 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkE += 1;
                    localStorage.setPart3MarkE(countMarkE);
                    widget.notifyParent!();
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
                                .translate('part3_session_e7')),
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
                          child: Text('$e7'),
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
                  if (e8 == 1) {
                    e8 = 0;

                    countSessionE -= 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkE -= 1;
                    localStorage.setPart3MarkE(countMarkE);
                    widget.notifyParent!();
                  } else {
                    e8 = 1;
                    countSessionE += 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkE += 1;
                    localStorage.setPart3MarkE(countMarkE);
                    widget.notifyParent!();
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
                                .translate('part3_session_e8')),
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
                          child: Text('$e8'),
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
                  if (e9 == 1) {
                    e9 = 0;
                    countSessionE -= 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkE -= 1;
                    localStorage.setPart3MarkE(countMarkE);
                    widget.notifyParent!();
                  } else {
                    e9 = 1;
                    countSessionE += 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkE += 1;
                    localStorage.setPart3MarkE(countMarkE);
                    widget.notifyParent!();
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
                                .translate('part3_session_e9')),
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
                          child: Text('$e9'),
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
                  if (e10 == 1) {
                    e10 = 0;
                    countSessionE -= 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkE -= 1;
                    localStorage.setPart3MarkE(countMarkE);
                    widget.notifyParent!();
                  } else {
                    e10 = 1;
                    countSessionE += 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkE += 1;
                    localStorage.setPart3MarkE(countMarkE);
                    widget.notifyParent!();
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
                                .translate('part3_session_e10')),
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
                          child: Text('$e10'),
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
                  if (e11 == 1) {
                    e11 = 0;

                    countSessionE -= 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkE -= 1;
                    localStorage.setPart3MarkE(countMarkE);
                    widget.notifyParent!();
                  } else {
                    e11 = 1;
                    countSessionE += 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkE += 1;
                    localStorage.setPart3MarkE(countMarkE);
                    widget.notifyParent!();
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
                                .translate('part3_session_e11')),
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
                          child: Text('$e11'),
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
                  if (e12 == 1) {
                    e12 = 0;

                    countSessionE -= 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkE -= 1;
                    localStorage.setPart3MarkE(countMarkE);
                    widget.notifyParent!();
                  } else {
                    e12 = 1;
                    countSessionE += 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkE += 1;
                    localStorage.setPart3MarkE(countMarkE);
                    widget.notifyParent!();
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
                                .translate('part3_session_e12')),
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
                          child: Text('$e12'),
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
                  if (e13 == 1) {
                    e13 = 0;

                    countSessionE -= 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkE -= 1;
                    localStorage.setPart3MarkE(countMarkE);
                    widget.notifyParent!();
                  } else {
                    e13 = 1;
                    countSessionE += 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkE += 1;
                    localStorage.setPart3MarkE(countMarkE);
                    widget.notifyParent!();
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
                                .translate('part3_session_e13')),
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
                          child: Text('$e13'),
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
                  if (e14 == 1) {
                    e14 = 0;

                    countSessionE -= 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkEM -= 1;
                    localStorage.setPart3MarkEM(countMarkEM);
                    widget.notifyParent!();
                  } else {
                    e14 = 1;
                    countSessionE += 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkEM += 1;
                    localStorage.setPart3MarkEM(countMarkEM);
                    widget.notifyParent!();
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
                                  .translate('part3_session_e14_bold'),
                              style: const TextStyle(fontWeight: FontWeight.bold),
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
                          child: Text('$e14'),
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
                  if (e15 == 1) {
                    e15 = 0;

                    countSessionE -= 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkEM -= 1;
                    localStorage.setPart3MarkEM(countMarkEM);
                    widget.notifyParent!();
                  } else {
                    e15 = 1;
                    countSessionE += 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkEM += 1;
                    localStorage.setPart3MarkEM(countMarkEM);
                    widget.notifyParent!();
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
                                  .translate('part3_session_e15_bold'),
                              style: const TextStyle(fontWeight: FontWeight.bold),
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
                          child: Text('$e15'),
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
                  if (e16 == 1) {
                    e16 = 0;

                    countSessionE -= 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkEM -= 1;
                    localStorage.setPart3MarkEM(countMarkEM);
                    widget.notifyParent!();
                  } else {
                    e16 = 1;
                    countSessionE += 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkEM += 1;
                    localStorage.setPart3MarkEM(countMarkEM);
                    widget.notifyParent!();
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
                                  .translate('part3_session_e16_bold'),
                              style: const TextStyle(fontWeight: FontWeight.bold),
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
                          child: Text('$e16'),
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
                  if (e17 == 1) {
                    e17 = 0;

                    countSessionE -= 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkEM -= 1;
                    localStorage.setPart3MarkEM(countMarkEM);
                    widget.notifyParent!();
                  } else {
                    e17 = 1;
                    countSessionE += 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkEM += 1;
                    localStorage.setPart3MarkEM(countMarkEM);
                    widget.notifyParent!();
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
                                  .translate('part3_session_e17_bold'),
                              style: const TextStyle(fontWeight: FontWeight.bold),
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
                          child: Text('$e17'),
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
                  if (e18 == 1) {
                    e18 = 0;

                    countSessionE -= 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkEM -= 1;
                    localStorage.setPart3MarkEM(countMarkEM);
                    widget.notifyParent!();
                  } else {
                    e18 = 1;
                    countSessionE += 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkEM += 1;
                    localStorage.setPart3MarkEM(countMarkEM);
                    widget.notifyParent!();
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
                                  .translate('part3_session_e18_bold'),
                              style: const TextStyle(fontWeight: FontWeight.bold),
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
                          child: Text('$e18'),
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
                  if (e19 == 1) {
                    e19 = 0;

                    countSessionE -= 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkEM -= 1;
                    localStorage.setPart3MarkEM(countMarkEM);
                    widget.notifyParent!();
                  } else {
                    e19 = 1;
                    countSessionE += 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkEM += 1;
                    localStorage.setPart3MarkEM(countMarkEM);
                    widget.notifyParent!();
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
                                  .translate('part3_session_e19_bold'),
                              style: const TextStyle(fontWeight: FontWeight.bold),
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
                          child: Text('$e19'),
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
                  if (e20 == 1) {
                    e20 = 0;

                    countSessionE -= 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkEM -= 1;
                    localStorage.setPart3MarkEM(countMarkEM);
                    widget.notifyParent!();
                  } else {
                    e20 = 1;
                    countSessionE += 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkEM += 1;
                    localStorage.setPart3MarkEM(countMarkEM);
                    widget.notifyParent!();
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
                                  .translate('part3_session_e20_bold'),
                              style: const TextStyle(fontWeight: FontWeight.bold),
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
                          child: Text('$e20'),
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
                    value: sessionE,
                    onChanged: (bool? value) {
                      setState(() {
                        sessionE = value;
                        setState(() {
                          if (value!) {
                            e1 = 1;
                            e2 = 1;
                            e3 = 1;
                            e4 = 1;
                            e5 = 1;
                            e6 = 1;
                            e7 = 1;
                            e8 = 1;
                            e9 = 1;
                            e10 = 1;
                            e11 = 1;
                            e12 = 1;
                            e13 = 1;
                            e14 = 1;
                            e15 = 1;
                            e16 = 1;
                            e17 = 1;
                            e18 = 1;
                            countSessionE = 20;
                            localStorage.setPart3MarkSessionE(countSessionE);

                            countMarkEM = 7;
                            localStorage.setPart3MarkEM(countMarkEM);
                            countMarkE = 13;
                            localStorage.setPart3MarkE(countMarkE);
                            widget.notifyParent!();
                          } else {
                            e1 = 0;
                            e2 = 0;
                            e3 = 0;
                            e4 = 0;
                            e5 = 0;
                            e6 = 0;
                            e7 = 0;
                            e8 = 0;
                            e9 = 0;
                            e10 = 0;
                            e11 = 0;
                            e12 = 0;
                            e13 = 0;
                            e14 = 0;
                            e15 = 0;
                            e16 = 0;
                            e17 = 0;
                            e18 = 0;
                            countSessionE = 0;
                            localStorage.setPart3MarkSessionE(countSessionE);
                            countMarkEM = 0;
                            localStorage.setPart3MarkEM(countMarkEM);
                            countMarkE = 0;
                            localStorage.setPart3MarkE(countMarkE);
                            widget.notifyParent!();
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
                '$countSessionE/20',
                style:
                    const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SessionF extends StatefulWidget {
  final Function()? notifyParent;
  const SessionF({super.key, this.notifyParent});
  @override
  _SessionFState createState() => _SessionFState();
}

class _SessionFState extends State<SessionF> {
  int f1 = 0,
      f2 = 0,
      f3 = 0,
      f4 = 0,
      f5 = 0,
      f6 = 0,
      f7 = 0,
      f8 = 0,
      f9 = 0,
      f10 = 0,
      f11 = 0,
      f12 = 0,
      f13 = 0,
      f14 = 0;
  //int countSessionF = 0;
  //int countSessionF = 0;
  int countMarkEM = 0;
  int countMarkF = 0;
  int countSessionF = 0;
  //int countDeductMarkF = 0;

  bool? sessionF = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        custom.ExpansionTile(
          headerBackgroundColor: ColorConstant.primaryColor,
          title: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              AppLocalizations.of(context)!.translate('part3_session_f'),
              style:
                  (const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            ),
          ),
          children: <Widget>[
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(5),
                //child: Text('Pemeriksaan Luar Kenderaan(Calon Maklum Ada/Tiada)', style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (f1 == 1) {
                    f1 = 0;
                    countSessionF -= 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count normal deduct mark
                    countMarkF -= 1;
                    localStorage.setPart3MarkF(countMarkF);

                    widget.notifyParent!();
                  } else {
                    f1 = 1;
                    countSessionF += 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count normal deduct mark
                    countMarkF += 1;
                    localStorage.setPart3MarkF(countMarkF);
                    widget.notifyParent!();
                  }
                });
              },
              child: Table(
                columnWidths: const {
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
                                left: 10, top: 10, bottom: 10),
                            child: Text(AppLocalizations.of(context)!
                                .translate('part3_session_f1')),
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
                          child: Text('$f1'),
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
                  if (f2 == 1) {
                    f2 = 0;
                    countSessionF -= 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count normal deduct mark
                    countMarkF -= 1;
                    localStorage.setPart3MarkF(countMarkF);
                    widget.notifyParent!();
                  } else {
                    f2 = 1;
                    countSessionF += 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count normal deduct mark
                    countMarkF += 1;
                    localStorage.setPart3MarkF(countMarkF);
                    widget.notifyParent!();
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
                                .translate('part3_session_f2')),
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
                          child: Text('$f2'),
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
                  if (f3 == 1) {
                    f3 = 0;
                    countSessionF -= 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count normal deduct mark
                    countMarkF -= 1;
                    localStorage.setPart3MarkF(countMarkF);
                    widget.notifyParent!();
                  } else {
                    f3 = 1;
                    countSessionF += 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count normal deduct mark
                    countMarkF += 1;
                    localStorage.setPart3MarkF(countMarkF);
                    widget.notifyParent!();
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
                                .translate('part3_session_f3')),
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
                          child: Text('$f3'),
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
                  if (f4 == 1) {
                    f4 = 0;
                    countSessionF -= 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count normal deduct mark
                    countMarkF -= 1;
                    localStorage.setPart3MarkF(countMarkF);
                    widget.notifyParent!();
                  } else {
                    f4 = 1;
                    countSessionF += 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count normal deduct mark
                    countMarkF += 1;
                    localStorage.setPart3MarkF(countMarkF);
                    widget.notifyParent!();
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
                                .translate('part3_session_f4')),
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
                          child: Text('$f4'),
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
                  if (f5 == 1) {
                    f5 = 0;
                    countSessionF -= 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count normal deduct mark
                    countMarkF -= 1;
                    localStorage.setPart3MarkF(countMarkF);
                    widget.notifyParent!();
                  } else {
                    f5 = 1;
                    countSessionF += 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count normal deduct mark
                    countMarkF += 1;
                    localStorage.setPart3MarkF(countMarkF);
                    widget.notifyParent!();
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
                                .translate('part3_session_f5')),
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
                          child: Text('$f5'),
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
                  if (f6 == 1) {
                    f6 = 0;
                    countSessionF -= 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count normal deduct mark
                    countMarkF -= 1;
                    localStorage.setPart3MarkF(countMarkF);
                    widget.notifyParent!();
                  } else {
                    f6 = 1;
                    countSessionF += 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count normal deduct mark
                    countMarkF += 1;
                    localStorage.setPart3MarkF(countMarkF);
                    widget.notifyParent!();
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
                                .translate('part3_session_f6')),
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
                              child: Text('$f6'),
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
                  if (f7 == 1) {
                    f7 = 0;
                    countSessionF -= 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count normal deduct mark
                    countMarkF -= 1;
                    localStorage.setPart3MarkF(countMarkF);
                    widget.notifyParent!();
                  } else {
                    f7 = 1;
                    countSessionF += 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count normal deduct mark
                    countMarkF += 1;
                    localStorage.setPart3MarkF(countMarkF);
                    widget.notifyParent!();
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
                                .translate('part3_session_f7')),
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
                          child: Text('$f7'),
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
                  if (f8 == 1) {
                    f8 = 0;
                    countSessionF -= 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count normal deduct mark
                    countMarkF -= 1;
                    localStorage.setPart3MarkF(countMarkF);
                    widget.notifyParent!();
                  } else {
                    f8 = 1;
                    countSessionF += 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count normal deduct mark
                    countMarkF += 1;
                    localStorage.setPart3MarkF(countMarkF);
                    widget.notifyParent!();
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
                                .translate('part3_session_f8')),
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
                          child: Text('$f8'),
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
                  if (f9 == 1) {
                    f9 = 0;
                    countSessionF -= 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count mandatory deduct mark
                    countMarkEM -= 1;
                    localStorage.setPart3MarkFM(countMarkEM);

                    widget.notifyParent!();
                  } else {
                    f9 = 1;
                    countSessionF += 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count mandatory deduct mark
                    countMarkEM += 1;
                    localStorage.setPart3MarkFM(countMarkEM);
                    widget.notifyParent!();
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
                                    .translate('part3_session_f9_bold'),
                                style: const TextStyle(fontWeight: FontWeight.bold)),
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
                          child: Text('$f9'),
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
                  if (f10 == 1) {
                    f10 = 0;
                    countSessionF -= 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count mandatory deduct mark
                    countMarkEM -= 1;
                    localStorage.setPart3MarkFM(countMarkEM);
                    widget.notifyParent!();
                  } else {
                    f10 = 1;
                    countSessionF += 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count mandatory deduct mark
                    countMarkEM += 1;
                    localStorage.setPart3MarkFM(countMarkEM);
                    widget.notifyParent!();
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
                                  .translate('part3_session_f10_bold'),
                              style: const TextStyle(fontWeight: FontWeight.bold),
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
                          child: Text('$f10'),
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
                  if (f11 == 1) {
                    f11 = 0;
                    countSessionF -= 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count mandatory deduct mark
                    countMarkEM -= 1;
                    localStorage.setPart3MarkFM(countMarkEM);
                    widget.notifyParent!();
                  } else {
                    f11 = 1;
                    countSessionF += 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count mandatory deduct mark
                    countMarkEM += 1;
                    localStorage.setPart3MarkFM(countMarkEM);
                    widget.notifyParent!();
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
                                  .translate('part3_session_f11_bold'),
                              style: const TextStyle(fontWeight: FontWeight.bold),
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
                          child: Text('$f11'),
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
                  if (f12 == 1) {
                    f12 = 0;
                    countSessionF -= 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count mandatory deduct mark
                    countMarkEM -= 1;
                    localStorage.setPart3MarkFM(countMarkEM);
                    widget.notifyParent!();
                  } else {
                    f12 = 1;
                    countSessionF += 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count mandatory deduct mark
                    countMarkEM += 1;
                    localStorage.setPart3MarkFM(countMarkEM);
                    widget.notifyParent!();
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
                                  .translate('part3_session_f12_bold'),
                              style: const TextStyle(fontWeight: FontWeight.bold),
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
                          child: Text('$f12'),
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
                  if (f13 == 1) {
                    f13 = 0;
                    countSessionF -= 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count mandatory deduct mark
                    countMarkEM -= 1;
                    localStorage.setPart3MarkFM(countMarkEM);
                    widget.notifyParent!();
                  } else {
                    f13 = 1;
                    countSessionF += 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count mandatory deduct mark
                    countMarkEM += 1;
                    localStorage.setPart3MarkFM(countMarkEM);
                    widget.notifyParent!();
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
                                  .translate('part3_session_f13_bold'),
                              style: const TextStyle(fontWeight: FontWeight.bold),
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
                          child: Text('$f13'),
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
                  if (f14 == 1) {
                    f14 = 0;
                    countSessionF -= 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count mandatory deduct mark
                    countMarkEM -= 1;
                    localStorage.setPart3MarkFM(countMarkEM);
                    widget.notifyParent!();
                  } else {
                    f14 = 1;
                    countSessionF += 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count mandatory deduct mark
                    countMarkEM += 1;
                    localStorage.setPart3MarkFM(countMarkEM);
                    widget.notifyParent!();
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
                                  .translate('part3_session_f14_bold'),
                              style: const TextStyle(fontWeight: FontWeight.bold),
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
                          child: Text('$f14'),
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
                    value: sessionF,
                    onChanged: (bool? value) {
                      setState(() {
                        sessionF = value;
                        setState(() {
                          if (value!) {
                            f1 = 1;
                            f2 = 1;
                            f3 = 1;
                            f4 = 1;
                            f5 = 1;
                            f6 = 1;
                            f7 = 1;
                            f8 = 1;
                            f9 = 1;
                            f10 = 1;
                            f11 = 1;
                            f12 = 1;
                            f13 = 1;
                            countSessionF = 14;
                            localStorage.setPart3MarkSessionF(countSessionF);
                            countMarkEM = 6;
                            countMarkF = 8;
                            localStorage.setPart3MarkFM(countMarkEM);
                            localStorage.setPart3MarkF(countMarkF);
                            widget.notifyParent!();
                          } else {
                            f1 = 0;
                            f2 = 0;
                            f3 = 0;
                            f4 = 0;
                            f5 = 0;
                            f6 = 0;
                            f7 = 0;
                            f8 = 0;
                            f9 = 0;
                            f10 = 0;
                            f11 = 0;
                            f12 = 0;
                            f13 = 0;
                            countSessionF = 0;
                            localStorage.setPart3MarkSessionF(countSessionF);
                            countMarkEM = 0;
                            countMarkF = 0;
                            localStorage.setPart3MarkFM(countMarkEM);
                            localStorage.setPart3MarkF(countMarkF);
                            widget.notifyParent!();
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
                '$countSessionF/14',
                style:
                    const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SessionG extends StatefulWidget {
  final Function()? notifyParent;
  const SessionG({super.key, this.notifyParent});

  @override
  _SessionGState createState() => _SessionGState();
}

class _SessionGState extends State<SessionG> {
  int g1 = 0,
      g2 = 0,
      g3 = 0,
      g4 = 0,
      g5 = 0,
      g6 = 0,
      g7 = 0,
      g8 = 0,
      g9 = 0,
      g10 = 0,
      g11 = 0,
      g12 = 0;
  int countSessionG = 0;
  int countMarkGM = 0;
  int countMarkG = 0;

  bool? sessionG = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        custom.ExpansionTile(
          headerBackgroundColor: ColorConstant.primaryColor,
          title: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              AppLocalizations.of(context)!.translate('part3_session_g'),
              style:
                  (const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            ),
          ),
          children: <Widget>[
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(5),
                //child: Text('Pemeriksaan Luar Kenderaan(Calon Maklum Ada/Tiada)', style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (g1 == 1) {
                    g1 = 0;
                    countSessionG -= 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    countMarkG -= 1;
                    localStorage.setPart3MarkG(countMarkG);
                    widget.notifyParent!();
                  } else {
                    g1 = 1;
                    countSessionG += 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    countMarkG += 1;
                    localStorage.setPart3MarkG(countMarkG);
                    widget.notifyParent!();
                  }
                });
              },
              child: Table(
                columnWidths: const {
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
                                .translate('part3_session_g1')),
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
                          child: Text('$g1'),
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
                  if (g2 == 1) {
                    g2 = 0;
                    countSessionG -= 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    countMarkG -= 1;
                    localStorage.setPart3MarkG(countMarkG);
                    widget.notifyParent!();
                  } else {
                    g2 = 1;
                    countSessionG += 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    countMarkG += 1;
                    localStorage.setPart3MarkG(countMarkG);
                    widget.notifyParent!();
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
                                .translate('part3_session_g2')),
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
                          child: Text('$g2'),
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
                  if (g3 == 1) {
                    g3 = 0;
                    countSessionG -= 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    countMarkG -= 1;
                    localStorage.setPart3MarkG(countMarkG);
                    widget.notifyParent!();
                  } else {
                    g3 = 1;
                    countSessionG += 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    countMarkG += 1;
                    localStorage.setPart3MarkG(countMarkG);
                    widget.notifyParent!();
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
                                .translate('part3_session_g3')),
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
                          child: Text('$g3'),
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
                  if (g4 == 1) {
                    g4 = 0;
                    countSessionG -= 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    countMarkG -= 1;
                    localStorage.setPart3MarkG(countMarkG);
                    widget.notifyParent!();
                  } else {
                    g4 = 1;
                    countSessionG += 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    countMarkG += 1;
                    localStorage.setPart3MarkG(countMarkG);
                    widget.notifyParent!();
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
                                .translate('part3_session_g4')),
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
                          child: Text('$g4'),
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
                  if (g5 == 1) {
                    g5 = 0;
                    countSessionG -= 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    countMarkG -= 1;
                    localStorage.setPart3MarkG(countMarkG);
                    widget.notifyParent!();
                  } else {
                    g5 = 1;
                    countSessionG += 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    countMarkG += 1;
                    localStorage.setPart3MarkG(countMarkG);
                    widget.notifyParent!();
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
                                .translate('part3_session_g5')),
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
                          child: Text('$g5'),
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
                  if (g6 == 1) {
                    g6 = 0;
                    countMarkG -= 1;
                    localStorage.setPart3MarkG(countMarkG);

                    //total marks on top of checkbox
                    countSessionG -= 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    widget.notifyParent!();
                  } else {
                    g6 = 1;
                    countMarkG += 1;
                    localStorage.setPart3MarkG(countMarkG);

                    //total marks on top of checkbox
                    countSessionG += 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    widget.notifyParent!();
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
                                .translate('part3_session_g6')),
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
                              child: Text('$g6'),
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
                  if (g7 == 1) {
                    g7 = 0;
                    countMarkG -= 1;
                    localStorage.setPart3MarkG(countMarkG);

                    //total marks on top of checkbox
                    countSessionG -= 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    widget.notifyParent!();
                  } else {
                    g7 = 1;
                    countMarkG += 1;
                    localStorage.setPart3MarkG(countMarkG);

                    //total marks on top of checkbox
                    countSessionG += 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    widget.notifyParent!();
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
                                  .translate('part3_session_g7'),
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
                          child: Text('$g7'),
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
                  if (g8 == 1) {
                    g8 = 0;
                    countMarkGM -= 1;
                    localStorage.setPart3MarkGM(countMarkGM);

                    //total marks on top of checkbox
                    countSessionG -= 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    widget.notifyParent!();
                  } else {
                    g8 = 1;
                    countMarkGM += 1;
                    localStorage.setPart3MarkGM(countMarkGM);

                    //total marks on top of checkbox
                    countSessionG += 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    widget.notifyParent!();
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
                                  .translate('part3_session_g8_bold'),
                              style: const TextStyle(fontWeight: FontWeight.bold),
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
                          child: Text('$g8'),
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
                  if (g9 == 1) {
                    g9 = 0;
                    countMarkGM -= 1;
                    localStorage.setPart3MarkGM(countMarkGM);

                    //total marks on top of checkbox
                    countSessionG -= 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    widget.notifyParent!();
                  } else {
                    g9 = 1;
                    countMarkGM += 1;
                    localStorage.setPart3MarkGM(countMarkGM);

                    //total marks on top of checkbox
                    countSessionG += 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    widget.notifyParent!();
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
                                    .translate('part3_session_g9_bold'),
                                style: const TextStyle(fontWeight: FontWeight.bold)),
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
                          child: Text('$g9'),
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
                  if (g10 == 1) {
                    g10 = 0;
                    countMarkGM -= 1;
                    localStorage.setPart3MarkGM(countMarkGM);

                    //total marks on top of checkbox
                    countSessionG -= 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    widget.notifyParent!();
                  } else {
                    g10 = 1;
                    countMarkGM += 1;
                    localStorage.setPart3MarkGM(countMarkGM);

                    //total marks on top of checkbox
                    countSessionG += 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    widget.notifyParent!();
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
                                  .translate('part3_session_g10_bold'),
                              style: const TextStyle(fontWeight: FontWeight.bold),
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
                          child: Text('$g10'),
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
                    value: sessionG,
                    onChanged: (bool? value) {
                      setState(() {
                        sessionG = value;
                        setState(() {
                          if (value!) {
                            g1 = 1;
                            g2 = 1;
                            g3 = 1;
                            g4 = 1;
                            g5 = 1;
                            g6 = 1;
                            g7 = 1;
                            g8 = 1;
                            g9 = 1;
                            g10 = 1;
                            g11 = 1;
                            g12 = 1;
                            countSessionG = 10;
                            countMarkGM = 3;
                            countMarkG = 7;
                            localStorage.setPart3MarkSessionH(countSessionG);
                            localStorage.setPart3MarkGM(countMarkGM);
                            localStorage.setPart3MarkG(countMarkG);
                            widget.notifyParent!();
                          } else {
                            g1 = 0;
                            g2 = 0;
                            g3 = 0;
                            g4 = 0;
                            g5 = 0;
                            g6 = 0;
                            g7 = 0;
                            g8 = 0;
                            g9 = 0;
                            g10 = 0;
                            g11 = 0;
                            g12 = 0;
                            countSessionG = 0;
                            countMarkGM = 0;
                            countMarkG = 0;
                            localStorage.setPart3MarkSessionH(countSessionG);
                            localStorage.setPart3MarkGM(countMarkGM);
                            localStorage.setPart3MarkG(countMarkG);
                            widget.notifyParent!();
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
            padding: const EdgeInsets.only(right: 35, top: 5),
            child: Container(
              child: Text(
                '$countSessionG/10',
                style:
                    const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SessionH extends StatefulWidget {
  final Function()? notifyParent;
  const SessionH({super.key, this.notifyParent});

  @override
  _SessionHState createState() => _SessionHState();
}

class _SessionHState extends State<SessionH> {
  int h1 = 0,
      h2 = 0,
      h3 = 0,
      h4 = 0,
      h5 = 0,
      h6 = 0,
      h7 = 0,
      h8 = 0,
      h9 = 0,
      h10 = 0,
      h11 = 0,
      h12 = 0;
  int countSessionH = 0;
  int countMarkHM = 0;
  int countMarkH = 0;
  bool? sessionH = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        custom.ExpansionTile(
          headerBackgroundColor: ColorConstant.primaryColor,
          title: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              AppLocalizations.of(context)!.translate('part3_session_h'),
              style:
                  (const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            ),
          ),
          children: <Widget>[
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(5),
                //child: Text('Pemeriksaan Luar Kenderaan(Calon Maklum Ada/Tiada)', style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (h1 == 1) {
                    h1 = 0;
                    countSessionH -= 1;
                    localStorage.setPart3MarkSessionH(countSessionH);
                    countMarkH -= 1;
                    localStorage.setPart3MarkH(countMarkH);
                    widget.notifyParent!();
                  } else {
                    h1 = 1;
                    countSessionH += 1;
                    localStorage.setPart3MarkSessionH(countSessionH);
                    countMarkH += 1;
                    localStorage.setPart3MarkH(countMarkH);
                    widget.notifyParent!();
                  }
                });
              },
              child: Table(
                columnWidths: const {
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
                                .translate('part3_session_g1')),
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
                          child: Text('$h1'),
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
                  if (h2 == 1) {
                    h2 = 0;
                    countSessionH -= 1;
                    localStorage.setPart3MarkSessionH(countSessionH);
                    countMarkH -= 1;
                    localStorage.setPart3MarkH(countMarkH);
                    widget.notifyParent!();
                  } else {
                    h2 = 1;
                    countSessionH += 1;
                    localStorage.setPart3MarkSessionH(countSessionH);
                    countMarkH += 1;
                    localStorage.setPart3MarkH(countMarkH);
                    widget.notifyParent!();
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
                                .translate('part3_session_h2')),
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
                          child: Text('$h2'),
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
                  if (h3 == 1) {
                    h3 = 0;
                    countSessionH -= 1;
                    localStorage.setPart3MarkSessionH(countSessionH);
                    countMarkH -= 1;
                    localStorage.setPart3MarkH(countMarkH);
                    widget.notifyParent!();
                  } else {
                    h3 = 1;
                    countSessionH += 1;
                    localStorage.setPart3MarkSessionH(countSessionH);
                    countMarkH += 1;
                    localStorage.setPart3MarkH(countMarkH);
                    widget.notifyParent!();
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
                                .translate('part3_session_h3')),
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
                          child: Text('$h3'),
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
                  if (h4 == 1) {
                    h4 = 0;
                    countSessionH -= 1;
                    localStorage.setPart3MarkSessionH(countSessionH);
                    countMarkH -= 1;
                    localStorage.setPart3MarkH(countMarkH);
                    widget.notifyParent!();
                  } else {
                    h4 = 1;
                    countSessionH += 1;
                    localStorage.setPart3MarkSessionH(countSessionH);
                    countMarkH += 1;
                    localStorage.setPart3MarkH(countMarkH);
                    widget.notifyParent!();
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
                                .translate('part3_session_h4')),
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
                          child: Text('$h4'),
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
                  if (h5 == 1) {
                    h5 = 0;
                    countSessionH -= 1;
                    localStorage.setPart3MarkSessionH(countSessionH);
                    countMarkH -= 1;
                    localStorage.setPart3MarkH(countMarkH);
                    widget.notifyParent!();
                  } else {
                    h5 = 1;
                    countSessionH += 1;
                    localStorage.setPart3MarkSessionH(countSessionH);
                    countMarkH += 1;
                    localStorage.setPart3MarkH(countMarkH);
                    widget.notifyParent!();
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
                                .translate('part3_session_h5')),
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
                          child: Text('$h5'),
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
                  if (h6 == 1) {
                    h6 = 0;
                    countMarkH -= 1;
                    localStorage.setPart3MarkH(countMarkH);

                    //total marks on top of checkbox
                    countSessionH -= 1;
                    localStorage.setPart3MarkSessionH(countSessionH);
                    widget.notifyParent!();
                  } else {
                    h6 = 1;
                    countMarkH += 1;
                    localStorage.setPart3MarkH(countMarkH);

                    //total marks on top of checkbox
                    countSessionH += 1;
                    localStorage.setPart3MarkSessionH(countSessionH);
                    widget.notifyParent!();
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
                                .translate('part3_session_h6')),
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
                              child: Text('$h6'),
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
                  if (h7 == 1) {
                    h7 = 0;
                    countMarkH -= 1;
                    localStorage.setPart3MarkH(countMarkH);

                    //total marks on top of checkbox
                    countSessionH -= 1;
                    localStorage.setPart3MarkSessionH(countSessionH);
                    widget.notifyParent!();
                  } else {
                    h7 = 1;
                    countMarkH += 1;
                    localStorage.setPart3MarkH(countMarkH);

                    //total marks on top of checkbox
                    countSessionH += 1;
                    localStorage.setPart3MarkSessionH(countSessionH);
                    widget.notifyParent!();
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
                                  .translate('part3_session_h7'),
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
                          child: Text('$h7'),
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
                  if (h8 == 1) {
                    h8 = 0;
                    countMarkH -= 1;
                    localStorage.setPart3MarkHM(countMarkH);

                    //total marks on top of checkbox
                    countSessionH -= 1;
                    localStorage.setPart3MarkSessionH(countSessionH);
                    widget.notifyParent!();
                  } else {
                    h8 = 1;
                    countMarkH += 1;
                    localStorage.setPart3MarkHM(countMarkH);

                    //total marks on top of checkbox
                    countSessionH += 1;
                    localStorage.setPart3MarkSessionH(countSessionH);
                    widget.notifyParent!();
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
                                  .translate('part3_session_h8'),
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
                          child: Text('$h8'),
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
                  if (h9 == 1) {
                    h9 = 0;
                    countMarkHM -= 1;
                    localStorage.setPart3MarkHM(countMarkHM);

                    //total marks on top of checkbox
                    countSessionH -= 1;
                    localStorage.setPart3MarkSessionH(countSessionH);
                    widget.notifyParent!();
                  } else {
                    h9 = 1;
                    countMarkHM += 1;
                    localStorage.setPart3MarkHM(countMarkHM);

                    //total marks on top of checkbox
                    countSessionH += 1;
                    localStorage.setPart3MarkSessionH(countSessionH);
                    widget.notifyParent!();
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
                                    .translate('part3_session_h9_bold'),
                                style: const TextStyle(fontWeight: FontWeight.bold)),
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
                          child: Text('$h9'),
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
                  if (h10 == 1) {
                    h10 = 0;
                    countMarkHM -= 1;
                    localStorage.setPart3MarkHM(countMarkHM);

                    //total marks on top of checkbox
                    countSessionH -= 1;
                    localStorage.setPart3MarkSessionH(countSessionH);
                    widget.notifyParent!();
                  } else {
                    h10 = 1;
                    countMarkHM += 1;
                    localStorage.setPart3MarkHM(countMarkHM);

                    //total marks on top of checkbox
                    countSessionH += 1;
                    localStorage.setPart3MarkSessionH(countSessionH);
                    widget.notifyParent!();
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
                                  .translate('part3_session_h10_bold'),
                              style: const TextStyle(fontWeight: FontWeight.bold),
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
                          child: Text('$h10'),
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
                  if (h11 == 1) {
                    h11 = 0;
                    countMarkHM -= 1;
                    localStorage.setPart3MarkHM(countMarkHM);

                    //total marks on top of checkbox
                    countSessionH -= 1;
                    localStorage.setPart3MarkSessionH(countSessionH);
                    widget.notifyParent!();
                  } else {
                    h11 = 1;
                    countMarkHM += 1;
                    localStorage.setPart3MarkHM(countMarkHM);

                    //total marks on top of checkbox
                    countSessionH += 1;
                    localStorage.setPart3MarkSessionH(countSessionH);
                    widget.notifyParent!();
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
                                  .translate('part3_session_h11_bold'),
                              style: const TextStyle(fontWeight: FontWeight.bold),
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
                          child: Text('$h11'),
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
                  if (h12 == 1) {
                    h12 = 0;
                    countMarkHM -= 1;
                    localStorage.setPart3MarkHM(countMarkHM);

                    //total marks on top of checkbox
                    countSessionH -= 1;
                    localStorage.setPart3MarkSessionH(countSessionH);
                    widget.notifyParent!();
                  } else {
                    h12 = 1;
                    countMarkHM += 1;
                    localStorage.setPart3MarkHM(countMarkHM);

                    //total marks on top of checkbox
                    countSessionH += 1;
                    localStorage.setPart3MarkSessionH(countSessionH);
                    widget.notifyParent!();
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
                                  .translate('part3_session_h12_bold'),
                              style: const TextStyle(fontWeight: FontWeight.bold),
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
                          child: Text('$h12'),
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
                    value: sessionH,
                    onChanged: (bool? value) {
                      setState(() {
                        sessionH = value;
                        setState(() {
                          if (value!) {
                            h1 = 1;
                            h2 = 1;
                            h3 = 1;
                            h4 = 1;
                            h5 = 1;
                            h6 = 1;
                            h7 = 1;
                            h8 = 1;
                            h9 = 1;
                            h10 = 1;
                            h11 = 1;
                            h12 = 1;
                            countSessionH = 12;
                            countMarkHM = 4;
                            countMarkH = 8;
                            localStorage.setPart3MarkSessionH(countSessionH);
                            localStorage.setPart3MarkHM(countMarkHM);
                            localStorage.setPart3MarkH(countMarkH);
                            widget.notifyParent!();
                          } else {
                            h1 = 0;
                            h2 = 0;
                            h3 = 0;
                            h4 = 0;
                            h5 = 0;
                            h6 = 0;
                            h7 = 0;
                            h8 = 0;
                            h9 = 0;
                            h10 = 0;
                            h11 = 0;
                            h12 = 0;
                            countSessionH = 0;
                            countMarkHM = 0;
                            countMarkH = 0;

                            localStorage.setPart3MarkSessionH(countSessionH);
                            localStorage.setPart3MarkHM(countMarkHM);
                            localStorage.setPart3MarkH(countMarkH);
                            widget.notifyParent!();
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
            padding: const EdgeInsets.only(right: 35, top: 5),
            child: Container(
              child: Text(
                '$countSessionH/12',
                style:
                    const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SessionI extends StatefulWidget {
  final Function()? notifyParent;
  const SessionI({super.key, this.notifyParent});

  @override
  _SessionIState createState() => _SessionIState();
}

class _SessionIState extends State<SessionI> {
  int i1 = 0,
      i2 = 0,
      i3 = 0,
      i4 = 0,
      i5 = 0,
      i6 = 0,
      i7 = 0,
      i8 = 0,
      i9 = 0,
      i10 = 0;
  int countSessionI = 0;
  int countMarkIM = 0;
  int countMarkI = 0;
  bool? sessionI = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        custom.ExpansionTile(
          headerBackgroundColor: ColorConstant.primaryColor,
          title: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              AppLocalizations.of(context)!.translate('part3_session_i'),
              style:
                  (const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            ),
          ),
          children: <Widget>[
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(5),
                //child: Text('Pemeriksaan Luar Kenderaan(Calon Maklum Ada/Tiada)', style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (i1 == 1) {
                    i1 = 0;
                    countSessionI -= 1;
                    localStorage.setPart3MarkSessionI(countSessionI);
                    countMarkI -= 1;
                    localStorage.setPart3MarkI(countMarkI);
                    widget.notifyParent!();
                  } else {
                    i1 = 1;
                    countSessionI += 1;
                    localStorage.setPart3MarkSessionI(countSessionI);
                    countMarkI += 1;
                    localStorage.setPart3MarkI(countMarkI);
                    widget.notifyParent!();
                  }
                });
              },
              child: Table(
                columnWidths: const {
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
                                .translate('part3_session_i1')),
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
                          child: Text('$i1'),
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
                  if (i2 == 1) {
                    i2 = 0;
                    countSessionI -= 1;
                    localStorage.setPart3MarkSessionI(countSessionI);
                    countMarkI -= 1;
                    localStorage.setPart3MarkI(countMarkI);
                    widget.notifyParent!();
                  } else {
                    i2 = 1;
                    countSessionI += 1;
                    localStorage.setPart3MarkSessionI(countSessionI);
                    countMarkI += 1;
                    localStorage.setPart3MarkI(countMarkI);
                    widget.notifyParent!();
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
                                .translate('part3_session_i2')),
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
                          child: Text('$i2'),
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
                  if (i3 == 1) {
                    i3 = 0;
                    countSessionI -= 1;
                    localStorage.setPart3MarkSessionI(countSessionI);
                    countMarkI -= 1;
                    localStorage.setPart3MarkI(countMarkI);
                    widget.notifyParent!();
                  } else {
                    i3 = 1;
                    countSessionI += 1;
                    localStorage.setPart3MarkSessionI(countSessionI);
                    countMarkI += 1;
                    localStorage.setPart3MarkI(countMarkI);
                    widget.notifyParent!();
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
                                .translate('part3_session_i3')),
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
                          child: Text('$i3'),
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
                  if (i4 == 1) {
                    i4 = 0;
                    countSessionI -= 1;
                    localStorage.setPart3MarkSessionI(countSessionI);
                    countMarkI -= 1;
                    localStorage.setPart3MarkI(countMarkI);
                    widget.notifyParent!();
                  } else {
                    i4 = 1;
                    countSessionI += 1;
                    localStorage.setPart3MarkSessionI(countSessionI);
                    countMarkI += 1;
                    localStorage.setPart3MarkI(countMarkI);
                    widget.notifyParent!();
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
                                .translate('part3_session_i4')),
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
                          child: Text('$i4'),
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
                  if (i5 == 1) {
                    i5 = 0;
                    countSessionI -= 1;
                    localStorage.setPart3MarkSessionI(countSessionI);
                    countMarkI -= 1;
                    localStorage.setPart3MarkI(countMarkI);
                    widget.notifyParent!();
                  } else {
                    i5 = 1;
                    countSessionI += 1;
                    localStorage.setPart3MarkSessionI(countSessionI);
                    countMarkI += 1;
                    localStorage.setPart3MarkI(countMarkI);
                    widget.notifyParent!();
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
                                .translate('part3_session_i5')),
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
                          child: Text('$i5'),
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
                  if (i6 == 1) {
                    i6 = 0;
                    countMarkI -= 1;
                    localStorage.setPart3MarkI(countMarkI);

                    //total marks on top of checkbox
                    countSessionI -= 1;
                    localStorage.setPart3MarkSessionI(countSessionI);
                    widget.notifyParent!();
                  } else {
                    i6 = 1;
                    countMarkI += 1;
                    localStorage.setPart3MarkI(countMarkI);

                    //total marks on top of checkbox
                    countSessionI += 1;
                    localStorage.setPart3MarkSessionI(countSessionI);
                    widget.notifyParent!();
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
                                .translate('part3_session_i6')),
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
                              child: Text('$i6'),
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
                  if (i7 == 1) {
                    i7 = 0;
                    countMarkIM -= 1;
                    localStorage.setPart3MarkIM(countMarkIM);

                    //total marks on top of checkbox
                    countSessionI -= 1;
                    localStorage.setPart3MarkSessionI(countSessionI);
                    widget.notifyParent!();
                  } else {
                    i7 = 1;
                    countMarkIM += 1;
                    localStorage.setPart3MarkIM(countMarkIM);

                    //total marks on top of checkbox
                    countSessionI += 1;
                    localStorage.setPart3MarkSessionI(countSessionI);
                    widget.notifyParent!();
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
                                    .translate('part3_session_i7_bold'),
                                style: const TextStyle(fontWeight: FontWeight.bold)),
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
                          child: Text('$i7'),
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
                  if (i8 == 1) {
                    i8 = 0;
                    countMarkIM -= 1;
                    localStorage.setPart3MarkIM(countMarkIM);

                    //total marks on top of checkbox
                    countSessionI -= 1;
                    localStorage.setPart3MarkSessionI(countSessionI);
                    widget.notifyParent!();
                  } else {
                    i8 = 1;
                    countMarkIM += 1;
                    localStorage.setPart3MarkIM(countMarkIM);

                    //total marks on top of checkbox
                    countSessionI += 1;
                    localStorage.setPart3MarkSessionI(countSessionI);
                    widget.notifyParent!();
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
                                    .translate('part3_session_i8_bold'),
                                style: const TextStyle(fontWeight: FontWeight.bold)),
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
                          child: Text('$i8'),
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
                  if (i9 == 1) {
                    i9 = 0;
                    countMarkIM -= 1;
                    localStorage.setPart3MarkIM(countMarkIM);

                    //total marks on top of checkbox
                    countSessionI -= 1;
                    localStorage.setPart3MarkSessionI(countSessionI);
                    widget.notifyParent!();
                  } else {
                    i9 = 1;
                    countMarkIM += 1;
                    localStorage.setPart3MarkIM(countMarkIM);

                    //total marks on top of checkbox
                    countSessionI += 1;
                    localStorage.setPart3MarkSessionI(countSessionI);
                    widget.notifyParent!();
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
                                    .translate('part3_session_i9_bold'),
                                style: const TextStyle(fontWeight: FontWeight.bold)),
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
                          child: Text('$i9'),
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
                  if (i10 == 1) {
                    i10 = 0;
                    countMarkIM -= 1;
                    localStorage.setPart3MarkIM(countMarkIM);

                    //total marks on top of checkbox
                    countSessionI -= 1;
                    localStorage.setPart3MarkSessionI(countSessionI);
                    widget.notifyParent!();
                  } else {
                    i10 = 1;
                    countMarkIM += 1;
                    localStorage.setPart3MarkIM(countMarkIM);

                    //total marks on top of checkbox
                    countSessionI += 1;
                    localStorage.setPart3MarkSessionI(countSessionI);
                    widget.notifyParent!();
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
                                  .translate('part3_session_i10_bold'),
                              style: const TextStyle(fontWeight: FontWeight.bold),
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
                          child: Text('$i10'),
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
                    value: sessionI,
                    onChanged: (bool? value) {
                      setState(() {
                        sessionI = value;
                        setState(() {
                          if (value!) {
                            i1 = 1;
                            i2 = 1;
                            i3 = 1;
                            i4 = 1;
                            i5 = 1;
                            i6 = 1;
                            i7 = 1;
                            i8 = 1;
                            i9 = 1;
                            i10 = 1;
                            countSessionI = 10;
                            countMarkIM = 4;
                            countMarkI = 6;
                            localStorage.setPart3MarkSessionI(countSessionI);
                            localStorage.setPart3MarkIM(countMarkIM);
                            localStorage.setPart3MarkI(countMarkI);
                            widget.notifyParent!();
                          } else {
                            i1 = 0;
                            i2 = 0;
                            i3 = 0;
                            i4 = 0;
                            i5 = 0;
                            i6 = 0;
                            i7 = 0;
                            i8 = 0;
                            i9 = 0;
                            i10 = 0;
                            countSessionI = 0;
                            countMarkIM = 0;
                            countMarkI = 0;

                            localStorage.setPart3MarkSessionI(countSessionI);
                            localStorage.setPart3MarkIM(countMarkIM);
                            localStorage.setPart3MarkI(countMarkI);
                            widget.notifyParent!();
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
            padding: const EdgeInsets.only(right: 35, top: 5),
            child: Container(
              child: Text(
                '$countSessionI/10',
                style:
                    const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SessionJ extends StatefulWidget {
  final Function()? notifyParent;
  const SessionJ({super.key, this.notifyParent});

  @override
  _SessionJState createState() => _SessionJState();
}

class _SessionJState extends State<SessionJ> {
  int j1 = 0, j2 = 0, j3 = 0, j4 = 0, j5 = 0;
  int countMarkJM = 0;

  bool? sessionH = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        custom.ExpansionTile(
          headerBackgroundColor: ColorConstant.primaryColor,
          title: Text(
            AppLocalizations.of(context)!.translate('part3_session_j'),
            style:
                (const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          ),
          children: <Widget>[
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(5),
                //child: Text('Pemeriksaan Luar Kenderaan(Calon Maklum Ada/Tiada)', style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (j1 == 1) {
                    j1 = 0;
                    countMarkJM -= 1;
                    localStorage.setPart3MarkJM(countMarkJM);
                    widget.notifyParent!();
                  } else if (j1 == 0) {
                    j1 = 1;
                    countMarkJM += 1;
                    localStorage.setPart3MarkJM(countMarkJM);

                    widget.notifyParent!();
                  }
                });
              },
              child: Table(
                columnWidths: const {
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
                            child: Text(
                              AppLocalizations.of(context)!
                                  .translate('part3_session_j1_bold'),
                              style: const TextStyle(fontWeight: FontWeight.bold),
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
                          child: Text('$j1'),
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
                  if (j2 == 1) {
                    j2 = 0;
                    countMarkJM -= 1;
                    localStorage.setPart3MarkJM(countMarkJM);

                    widget.notifyParent!();
                  } else if (j2 == 0) {
                    j2 = 1;
                    countMarkJM += 1;
                    localStorage.setPart3MarkJM(countMarkJM);
                    widget.notifyParent!();
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
                                  .translate('part3_session_j2_bold'),
                              style: const TextStyle(fontWeight: FontWeight.bold),
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
                          child: Text('$j2'),
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
                  if (j3 == 1) {
                    j3 = 0;
                    countMarkJM -= 1;
                    localStorage.setPart3MarkJM(countMarkJM);

                    widget.notifyParent!();
                  } else if (j3 == 0) {
                    j3 = 1;
                    countMarkJM += 1;
                    localStorage.setPart3MarkJM(countMarkJM);

                    widget.notifyParent!();
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
                                  .translate('part3_session_j3_bold'),
                              style: const TextStyle(fontWeight: FontWeight.bold),
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
                          child: Text('$j3'),
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
                  if (j4 == 1) {
                    j4 = 0;
                    countMarkJM -= 1;
                    localStorage.setPart3MarkJM(countMarkJM);
                    widget.notifyParent!();
                  } else if (j4 == 0) {
                    j4 = 1;
                    countMarkJM += 1;
                    localStorage.setPart3MarkJM(countMarkJM);

                    widget.notifyParent!();
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
                                  .translate('part3_session_j4_bold'),
                              style: const TextStyle(fontWeight: FontWeight.bold),
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
                          child: Text('$j4'),
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
            child: Transform.scale(
              scale: 1.3,
              child: Checkbox(
                checkColor: Colors.black,
                activeColor: Colors.white,
                value: sessionH,
                onChanged: (bool? value) {
                  setState(() {
                    sessionH = value;
                    setState(() {
                      if (value!) {
                        j1 = 1;
                        j2 = 1;
                        j3 = 1;
                        j4 = 1;
                        countMarkJM = 4;
                        localStorage.setPart3MarkJM(countMarkJM);
                        widget.notifyParent!();
                      } else {
                        j1 = 0;
                        j2 = 0;
                        j3 = 0;
                        j4 = 0;
                        countMarkJM = 0;
                        localStorage.setPart3MarkJM(countMarkJM);
                        widget.notifyParent!();
                      }
                    });
                  });
                },
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 40, top: 5),
            child: Container(
              child: Text(
                '$countMarkJM/4',
                style:
                    const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
