import 'package:edriving_qti_app/utils/constants.dart';
import 'package:edriving_qti_app/utils/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:edriving_qti_app/common_library/utils/app_localizations.dart';
import 'package:edriving_qti_app/pages/eTestingSolution/custom_expansion_tile.dart'
    as custom;

final localStorage = LocalStorage();

// ignore: must_be_immutable
class SessionB extends StatefulWidget {
  final Function()? notifyParent;
  SessionB({Key? key, this.notifyParent}) : super(key: key);

  @override
  _SessionBState createState() => _SessionBState();
}

class _SessionBState extends State<SessionB> {
  int rsm01 = 0,
      rsm02 = 0,
      rsm03 = 0,
      rsm04 = 0,
      rsm05 = 0,
      rsm06 = 0,
      rsm07 = 0,
      rsm08 = 0,
      rsm09 = 0,
      rsm10 = 0,
      rsm11 = 0,
      rsm12 = 0,
      rsm13 = 0,
      rsm14 = 0,
      rsm15 = 0,
      rsm16 = 0,
      rsm17 = 0,
      rsm18 = 0,
      rsm19 = 0,
      rsm20 = 0;
  bool? sessionB = false;
  int countSessionB = 0;
  int countMarkB = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        custom.ExpansionTile(
          title: Text(
            AppLocalizations.of(context)!.translate('part2_session_b'),
            style:
                (TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          ),
          headerBackgroundColor: ColorConstant.primaryColor,
          children: <Widget>[
            InkWell(
              onTap: () {
                setState(() {
                  if (rsm01 == 1) {
                    rsm01 = 0;
                    countSessionB -= 1;
                    localStorage.setPart2MarkSessionB(countSessionB);
                    countMarkB += 1;
                    localStorage.setPart2MarkB(countMarkB);
                    widget.notifyParent!();
                  } else {
                    rsm01 = 1;
                    countSessionB += 1;
                    localStorage.setPart2MarkSessionB(countSessionB);
                    countMarkB -= 1;
                    localStorage.setPart2MarkB(countMarkB);
                    widget.notifyParent!();
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
                                .translate('part2_session_b1')),
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
                          child: Text('$rsm01'),
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
                  if (rsm02 == 1) {
                    rsm02 = 0;
                    countSessionB -= 1;
                    localStorage.setPart2MarkSessionB(countSessionB);
                    countMarkB += 1;
                    localStorage.setPart2MarkB(countMarkB);
                    widget.notifyParent!();
                  } else {
                    rsm02 = 1;
                    countSessionB += 1;
                    localStorage.setPart2MarkSessionB(countSessionB);
                    countMarkB -= 1;
                    localStorage.setPart2MarkB(countMarkB);
                    widget.notifyParent!();
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
                                .translate('part2_session_b2')),
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
                          child: Text('$rsm02'),
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
                  if (rsm03 == 1) {
                    rsm03 = 0;
                    countSessionB -= 1;
                    localStorage.setPart2MarkSessionB(countSessionB);
                    countMarkB += 1;
                    localStorage.setPart2MarkB(countMarkB);
                    widget.notifyParent!();
                  } else {
                    rsm03 = 1;
                    countSessionB += 1;
                    localStorage.setPart2MarkSessionB(countSessionB);
                    countMarkB -= 1;
                    localStorage.setPart2MarkB(countMarkB);
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
                                .translate('part2_session_b3')),
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
                          child: Text('$rsm03'),
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
                  if (rsm04 == 1) {
                    rsm04 = 0;
                    countSessionB -= 1;
                    localStorage.setPart2MarkSessionB(countSessionB);
                    countMarkB += 1;
                    localStorage.setPart2MarkB(countMarkB);
                    widget.notifyParent!();
                  } else {
                    rsm04 = 1;
                    countSessionB += 1;
                    localStorage.setPart2MarkSessionB(countSessionB);
                    countMarkB -= 1;
                    localStorage.setPart2MarkB(countMarkB);
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
                                .translate('part2_session_b4')),
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
                          child: Text('$rsm04'),
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
                      .translate('part2_session_b_bold_lbl1'),
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
                  if (rsm05 == 1) {
                    rsm05 = 0;
                    countSessionB -= 1;
                    localStorage.setPart2MarkSessionB(countSessionB);
                    countMarkB += 1;
                    localStorage.setPart2MarkB(countMarkB);
                    widget.notifyParent!();
                  } else {
                    rsm05 = 1;
                    countSessionB += 1;
                    localStorage.setPart2MarkSessionB(countSessionB);
                    countMarkB -= 1;
                    localStorage.setPart2MarkB(countMarkB);
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
                                .translate('part2_session_b5')),
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
                          child: Text('$rsm05'),
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
                  if (rsm06 == 1) {
                    rsm06 = 0;
                    countSessionB -= 1;
                    localStorage.setPart2MarkSessionB(countSessionB);
                    countMarkB += 1;
                    localStorage.setPart2MarkB(countMarkB);
                    widget.notifyParent!();
                  } else {
                    rsm06 = 1;
                    countSessionB += 1;
                    localStorage.setPart2MarkSessionB(countSessionB);
                    countMarkB -= 1;
                    localStorage.setPart2MarkB(countMarkB);
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
                                .translate('part2_session_b6')),
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
                          child: Text('$rsm06'),
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
                  if (rsm07 == 1) {
                    rsm07 = 0;
                    countSessionB -= 1;
                    localStorage.setPart2MarkSessionB(countSessionB);
                    countMarkB += 1;
                    localStorage.setPart2MarkB(countMarkB);
                    widget.notifyParent!();
                  } else {
                    rsm07 = 1;
                    countSessionB += 1;
                    localStorage.setPart2MarkSessionB(countSessionB);
                    countMarkB -= 1;
                    localStorage.setPart2MarkB(countMarkB);
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
                                .translate('part2_session_b7')),
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
                          child: Text('$rsm07'),
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
                  if (rsm08 == 1) {
                    rsm08 = 0;
                    countSessionB -= 1;
                    localStorage.setPart2MarkSessionB(countSessionB);
                    countMarkB += 1;
                    localStorage.setPart2MarkB(countMarkB);
                    widget.notifyParent!();
                  } else {
                    rsm08 = 1;
                    countSessionB += 1;
                    localStorage.setPart2MarkSessionB(countSessionB);
                    countMarkB -= 1;
                    localStorage.setPart2MarkB(countMarkB);
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
                                .translate('part2_session_b8')),
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
                          child: Text('$rsm08'),
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
                  if (rsm09 == 1) {
                    rsm09 = 0;
                    countSessionB -= 1;
                    localStorage.setPart2MarkSessionB(countSessionB);
                    countMarkB += 1;
                    localStorage.setPart2MarkB(countMarkB);
                    widget.notifyParent!();
                  } else {
                    rsm09 = 1;
                    countSessionB += 1;
                    localStorage.setPart2MarkSessionB(countSessionB);
                    countMarkB -= 1;
                    localStorage.setPart2MarkB(countMarkB);
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
                                .translate('part2_session_b9')),
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
                          child: Text('$rsm09'),
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
                  if (rsm10 == 1) {
                    rsm10 = 0;
                    countSessionB -= 1;
                    localStorage.setPart2MarkSessionB(countSessionB);
                    countMarkB += 1;
                    localStorage.setPart2MarkB(countMarkB);
                    widget.notifyParent!();
                  } else {
                    rsm10 = 1;
                    countSessionB += 1;
                    localStorage.setPart2MarkSessionB(countSessionB);
                    countMarkB -= 1;
                    localStorage.setPart2MarkB(countMarkB);
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
                                .translate('part2_session_b10')),
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
                          child: Text('$rsm10'),
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
                  if (rsm11 == 1) {
                    rsm11 = 0;
                    countSessionB -= 1;
                    localStorage.setPart2MarkSessionB(countSessionB);
                    countMarkB += 1;
                    localStorage.setPart2MarkB(countMarkB);
                    widget.notifyParent!();
                  } else {
                    rsm11 = 1;
                    countSessionB += 1;
                    localStorage.setPart2MarkSessionB(countSessionB);
                    countMarkB -= 1;
                    localStorage.setPart2MarkB(countMarkB);
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
                                .translate('part2_session_b11')),
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
                          child: Text('$rsm11'),
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
                      .translate('part2_session_b_bold_lbl2'),
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
                  if (rsm12 == 1) {
                    rsm12 = 0;
                    countSessionB -= 1;
                    localStorage.setPart2MarkSessionB(countSessionB);
                    countMarkB += 1;
                    localStorage.setPart2MarkB(countMarkB);
                    widget.notifyParent!();
                  } else {
                    rsm12 = 1;
                    countSessionB += 1;
                    localStorage.setPart2MarkSessionB(countSessionB);
                    countMarkB -= 1;
                    localStorage.setPart2MarkB(countMarkB);
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
                                .translate('part2_session_b12')),
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
                          child: Text('$rsm12'),
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
                  if (rsm13 == 1) {
                    rsm13 = 0;
                    countSessionB -= 1;
                    localStorage.setPart2MarkSessionB(countSessionB);
                    countMarkB += 1;
                    localStorage.setPart2MarkB(countMarkB);
                    widget.notifyParent!();
                  } else {
                    rsm13 = 1;
                    countSessionB += 1;
                    localStorage.setPart2MarkSessionB(countSessionB);
                    countMarkB -= 1;
                    localStorage.setPart2MarkB(countMarkB);
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
                                .translate('part2_session_b13')),
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
                          child: Text('$rsm13'),
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
                  if (rsm14 == 1) {
                    rsm14 = 0;
                    countSessionB -= 1;
                    localStorage.setPart2MarkSessionB(countSessionB);
                    countMarkB += 1;
                    localStorage.setPart2MarkB(countMarkB);
                    widget.notifyParent!();
                  } else {
                    rsm14 = 1;
                    countSessionB += 1;
                    localStorage.setPart2MarkSessionB(countSessionB);
                    countMarkB -= 1;
                    localStorage.setPart2MarkB(countMarkB);
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
                                .translate('part2_session_b14')),
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
                          child: Text('$rsm14'),
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
                  if (rsm15 == 1) {
                    rsm15 = 0;
                    countSessionB -= 1;
                    localStorage.setPart2MarkSessionB(countSessionB);
                    countMarkB += 1;
                    localStorage.setPart2MarkB(countMarkB);
                    widget.notifyParent!();
                  } else {
                    rsm15 = 1;
                    countSessionB += 1;
                    localStorage.setPart2MarkSessionB(countSessionB);
                    countMarkB -= 1;
                    localStorage.setPart2MarkB(countMarkB);
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
                                .translate('part2_session_b15')),
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
                          child: Text('$rsm15'),
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
                  if (rsm16 == 1) {
                    rsm16 = 0;
                    countSessionB -= 1;
                    localStorage.setPart2MarkSessionB(countSessionB);
                    countMarkB += 1;
                    localStorage.setPart2MarkB(countMarkB);
                    widget.notifyParent!();
                  } else {
                    rsm16 = 1;
                    countSessionB += 1;
                    localStorage.setPart2MarkSessionB(countSessionB);
                    countMarkB -= 1;
                    localStorage.setPart2MarkB(countMarkB);
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
                                .translate('part2_session_b16')),
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
                          child: Text('$rsm16'),
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
                  if (rsm17 == 1) {
                    rsm17 = 0;
                    countSessionB -= 1;
                    localStorage.setPart2MarkSessionB(countSessionB);
                    countMarkB += 1;
                    localStorage.setPart2MarkB(countMarkB);
                    widget.notifyParent!();
                  } else {
                    rsm17 = 1;
                    countSessionB += 1;
                    localStorage.setPart2MarkSessionB(countSessionB);
                    countMarkB -= 1;
                    localStorage.setPart2MarkB(countMarkB);
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
                                .translate('part2_session_b17')),
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
                          child: Text('$rsm17'),
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
                  if (rsm18 == 1) {
                    rsm18 = 0;
                    countSessionB -= 1;
                    localStorage.setPart2MarkSessionB(countSessionB);
                    countMarkB += 1;
                    localStorage.setPart2MarkB(countMarkB);
                    widget.notifyParent!();
                  } else {
                    rsm18 = 1;
                    countSessionB += 1;
                    localStorage.setPart2MarkSessionB(countSessionB);
                    countMarkB -= 1;
                    localStorage.setPart2MarkB(countMarkB);
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
                                .translate('part2_session_b18')),
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
                          child: Text('$rsm18'),
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
                  if (rsm19 == 1) {
                    rsm19 = 0;
                    countSessionB -= 1;
                    localStorage.setPart2MarkSessionB(countSessionB);
                    countMarkB += 1;
                    localStorage.setPart2MarkB(countMarkB);
                    widget.notifyParent!();
                  } else {
                    rsm19 = 1;
                    countSessionB += 1;
                    localStorage.setPart2MarkSessionB(countSessionB);
                    countMarkB -= 1;
                    localStorage.setPart2MarkB(countMarkB);
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
                                .translate('part2_session_b19')),
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
                          child: Text('$rsm19'),
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
                  if (rsm20 == 1) {
                    rsm20 = 0;
                    countSessionB -= 1;
                    localStorage.setPart2MarkSessionB(countSessionB);
                    countMarkB += 1;
                    localStorage.setPart2MarkB(countMarkB);
                    widget.notifyParent!();
                  } else {
                    rsm20 = 1;
                    countSessionB += 1;
                    localStorage.setPart2MarkSessionB(countSessionB);
                    countMarkB -= 1;
                    localStorage.setPart2MarkB(countMarkB);
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
                                .translate('part2_session_b20')),
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
                          child: Text('$rsm20'),
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
                            rsm01 = 1;
                            rsm02 = 1;
                            rsm03 = 1;
                            rsm04 = 1;
                            rsm05 = 1;
                            rsm06 = 1;
                            rsm07 = 1;
                            rsm08 = 1;
                            rsm09 = 1;
                            rsm10 = 1;
                            rsm11 = 1;
                            rsm12 = 1;
                            rsm13 = 1;
                            rsm14 = 1;
                            rsm15 = 1;
                            rsm16 = 1;
                            rsm17 = 1;
                            rsm18 = 1;
                            rsm19 = 1;
                            rsm20 = 1;
                            countSessionB = 20;
                            countMarkB = 0;
                            localStorage.setPart2MarkSessionB(countSessionB);
                            localStorage.setPart2MarkB(countMarkB);
                            widget.notifyParent!();
                          } else {
                            rsm01 = 0;
                            rsm02 = 0;
                            rsm03 = 0;
                            rsm04 = 0;
                            rsm05 = 0;
                            rsm06 = 0;
                            rsm07 = 0;
                            rsm08 = 0;
                            rsm09 = 0;
                            rsm10 = 0;
                            rsm11 = 0;
                            rsm12 = 0;
                            rsm13 = 0;
                            rsm14 = 0;
                            rsm15 = 0;
                            rsm16 = 0;
                            rsm17 = 0;
                            rsm18 = 0;
                            rsm19 = 0;
                            rsm20 = 0;
                            countSessionB = 0;
                            countMarkB = 20;
                            localStorage.setPart2MarkSessionB(countSessionB);
                            localStorage.setPart2MarkB(countMarkB);
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
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
  SessionC({Key? key, this.notifyParent}) : super(key: key);

  @override
  _SessionCState createState() => _SessionCState();
}

class _SessionCState extends State<SessionC> {
  int ss01 = 0,
      ss02 = 0,
      ss03 = 0,
      ss04 = 0,
      ss05 = 0,
      ss06 = 0,
      ss07 = 0,
      ss08 = 0,
      ss09 = 0,
      ss10 = 0;
  int countSessionC = 0;
  int countMarkCM = 0;
  int countMarkC = 0;
  bool? sessionC = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        custom.ExpansionTile(
          title: Text(
            AppLocalizations.of(context)!.translate('part2_session_c'),
            style:
                (TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          ),
          headerBackgroundColor: ColorConstant.primaryColor,
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
                  if (ss01 == 1) {
                    ss01 = 0;
                    countSessionC -= 1;
                    localStorage.setPart2MarkSessionC(countSessionC);

                    //count normal deduct marks
                    countMarkC -= 1;
                    localStorage.setPart2MarkC(countMarkC);
                    widget.notifyParent!();
                  } else {
                    ss01 = 1;
                    countSessionC += 1;
                    localStorage.setPart2MarkSessionC(countSessionC);

                    //count normal deduct marks
                    countMarkC += 1;
                    localStorage.setPart2MarkC(countMarkC);
                    widget.notifyParent!();
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
                                .translate('part2_session_c1')),
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
                          child: Text('$ss01'),
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
                  if (ss02 == 1) {
                    ss02 = 0;
                    countSessionC -= 1;
                    localStorage.setPart2MarkSessionC(countSessionC);

                    //count normal deduct marks
                    countMarkC += 1;
                    localStorage.setPart2MarkC(countMarkC);
                    widget.notifyParent!();
                  } else {
                    ss02 = 1;
                    countSessionC += 1;
                    localStorage.setPart2MarkSessionC(countSessionC);

                    //count normal deduct marks
                    countMarkC += 1;
                    localStorage.setPart2MarkC(countMarkC);
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
                                .translate('part2_session_c2')),
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
                          child: Text('$ss02'),
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
                  if (ss03 == 1) {
                    ss03 = 0;
                    countSessionC -= 1;
                    localStorage.setPart2MarkSessionC(countSessionC);

                    //count normal deduct mark
                    countMarkC += 1;
                    localStorage.setPart2MarkC(countMarkC);
                    widget.notifyParent!();
                  } else {
                    ss03 = 1;
                    countSessionC += 1;
                    localStorage.setPart2MarkSessionC(countSessionC);

                    //count normal deduct mark
                    countMarkC += 1;
                    localStorage.setPart2MarkC(countMarkC);
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
                                .translate('part2_session_c3')),
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
                          child: Text('$ss03'),
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
                  if (ss04 == 1) {
                    ss04 = 0;
                    countSessionC -= 1;
                    localStorage.setPart2MarkSessionC(countSessionC);
                    //count normal deduct mark
                    countMarkC -= 1;
                    localStorage.setPart2MarkC(countMarkC);
                    widget.notifyParent!();
                  } else {
                    ss04 = 1;
                    countSessionC += 1;
                    localStorage.setPart2MarkSessionC(countSessionC);

                    //count normal deduct mark
                    countMarkC += 1;
                    localStorage.setPart2MarkC(countMarkC);
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
                                .translate('part2_session_c4')),
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
                          child: Text('$ss04'),
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
                  if (ss05 == 1) {
                    ss05 = 0;
                    countSessionC -= 1;
                    localStorage.setPart2MarkSessionC(countSessionC);
                    //count normal deduct mark
                    countMarkC += 1;
                    localStorage.setPart2MarkC(countMarkC);
                    widget.notifyParent!();
                  } else {
                    ss05 = 1;
                    countSessionC += 1;
                    localStorage.setPart2MarkSessionC(countSessionC);
                    //count normal deduct mark
                    countMarkC += 1;
                    localStorage.setPart2MarkC(countMarkC);
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
                                .translate('part2_session_c5')),
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
                          child: Text('$ss05'),
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
                  if (ss06 == 1) {
                    ss06 = 0;
                    countSessionC -= 1;
                    localStorage.setPart2MarkSessionC(countSessionC);
                    //count normal deduct mark
                    countMarkC -= 1;
                    localStorage.setPart2MarkC(countMarkC);
                  } else {
                    ss06 = 1;
                    countSessionC += 1;
                    localStorage.setPart2MarkSessionC(countSessionC);
                    //count normal deduct mark
                    countMarkC += 1;
                    localStorage.setPart2MarkC(countMarkC);
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
                                .translate('part2_session_c6')),
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
                              child: Text('$ss06'),
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
                  if (ss07 == 1) {
                    ss07 = 0;
                    countMarkCM -= 1;
                    localStorage.setPart2MarkCM(countMarkCM);

                    countSessionC -= 1;
                    localStorage.setPart2MarkSessionC(countSessionC);
                    widget.notifyParent!();
                  } else {
                    ss07 = 1;
                    countSessionC += 1;
                    localStorage.setPart2MarkSessionC(countSessionC);

                    countMarkCM += 1;
                    localStorage.setPart2MarkCM(countMarkCM);
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
                                    .translate('part2_session_c7_bold'),
                                style: TextStyle(fontWeight: FontWeight.bold)),
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
                          child: Text('$ss07'),
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
                  if (ss08 == 1) {
                    ss08 = 0;
                    countMarkCM -= 1;
                    localStorage.setPart2MarkCM(countMarkCM);
                    countSessionC -= 1;
                    localStorage.setPart2MarkSessionC(countSessionC);
                    widget.notifyParent!();
                  } else {
                    ss08 = 1;
                    countSessionC += 1;
                    localStorage.setPart2MarkSessionC(countSessionC);
                    countMarkCM += 1;
                    localStorage.setPart2MarkCM(countMarkCM);
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
                                    .translate('part2_session_c8_bold'),
                                style: TextStyle(fontWeight: FontWeight.bold)),
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
                          child: Text('$ss08'),
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
                  if (ss09 == 1) {
                    ss09 = 0;
                    countMarkCM -= 1;
                    localStorage.setPart2MarkCM(countMarkCM);
                    countSessionC -= 1;
                    localStorage.setPart2MarkSessionC(countSessionC);
                    widget.notifyParent!();
                  } else {
                    ss09 = 1;
                    countSessionC += 1;
                    localStorage.setPart2MarkSessionC(countSessionC);
                    countMarkCM += 1;
                    localStorage.setPart2MarkCM(countMarkCM);
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
                                    .translate('part2_session_c9_bold'),
                                style: TextStyle(fontWeight: FontWeight.bold)),
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
                          child: Text('$ss09'),
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
                  if (ss10 == 1) {
                    ss10 = 0;
                    countMarkCM -= 1;
                    localStorage.setPart2MarkCM(countMarkCM);
                    countSessionC -= 1;
                    localStorage.setPart2MarkSessionC(countSessionC);
                    widget.notifyParent!();
                  } else {
                    ss10 = 1;
                    countSessionC += 1;
                    localStorage.setPart2MarkSessionC(countSessionC);
                    countMarkCM += 1;
                    localStorage.setPart2MarkCM(countMarkCM);
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
                                  .translate('part2_session_c10_bold'),
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
                          child: Text('$ss10'),
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
                            ss01 = 1;
                            ss02 = 1;
                            ss03 = 1;
                            ss04 = 1;
                            ss05 = 1;
                            ss06 = 1;
                            ss07 = 1;
                            ss08 = 1;
                            ss09 = 1;
                            ss10 = 1;
                            countSessionC = 10;
                            localStorage.setPart2MarkSessionC(countSessionC);
                            countMarkCM = 4;
                            countMarkC = 6;
                            localStorage.setPart2MarkCM(countMarkCM);
                            localStorage.setPart2MarkC(countMarkC);
                            widget.notifyParent!();
                          } else {
                            ss01 = 0;
                            ss02 = 0;
                            ss03 = 0;
                            ss04 = 0;
                            ss05 = 0;
                            ss06 = 0;
                            ss07 = 0;
                            ss08 = 0;
                            ss09 = 0;
                            ss10 = 0;
                            countSessionC = 0;
                            localStorage.setPart2MarkSessionC(countSessionC);
                            countMarkCM = 0;
                            countMarkC = 0;
                            localStorage.setPart2MarkCM(countMarkCM);
                            localStorage.setPart2MarkC(countMarkC);
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
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
  SessionD({Key? key, this.notifyParent}) : super(key: key);

  @override
  _SessionDState createState() => _SessionDState();
}

class _SessionDState extends State<SessionD> {
  int zz01 = 0,
      zz02 = 0,
      zz03 = 0,
      zz04 = 0,
      zz05 = 0,
      zz06 = 0,
      zz07 = 0,
      zz08 = 0,
      zz09 = 0,
      zz10 = 0;
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
          title: Text(
            AppLocalizations.of(context)!.translate('part2_session_d'),
            style:
                (TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
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
                  if (zz01 == 1) {
                    zz01 = 0;
                    countSessionD -= 1;
                    localStorage.setPart2MarkSessionD(countSessionD);
                    countMarkD -= 1;
                    localStorage.setPart2MarkD(countMarkD);
                    widget.notifyParent!();
                  } else {
                    zz01 = 1;
                    countSessionD += 1;
                    localStorage.setPart2MarkSessionD(countSessionD);
                    countMarkD += 1;
                    localStorage.setPart2MarkD(countMarkD);
                    widget.notifyParent!();
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
                                .translate('part2_session_d1')),
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
                          child: Text('$zz01'),
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
                  if (zz02 == 1) {
                    zz02 = 0;
                    countSessionD -= 1;
                    localStorage.setPart2MarkSessionD(countSessionD);
                    countMarkD -= 1;
                    localStorage.setPart2MarkD(countMarkD);
                    widget.notifyParent!();
                  } else {
                    zz02 = 1;
                    countSessionD += 1;
                    localStorage.setPart2MarkSessionD(countSessionD);
                    countMarkD += 1;
                    localStorage.setPart2MarkD(countMarkD);
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
                                .translate('part2_session_d2')),
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
                          child: Text('$zz02'),
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
                  if (zz03 == 1) {
                    zz03 = 0;
                    countSessionD -= 1;
                    localStorage.setPart2MarkSessionD(countSessionD);
                    countMarkD -= 1;
                    localStorage.setPart2MarkD(countMarkD);
                    widget.notifyParent!();
                  } else {
                    zz03 = 1;
                    countSessionD += 1;
                    localStorage.setPart2MarkSessionD(countSessionD);
                    countMarkD += 1;
                    localStorage.setPart2MarkD(countMarkD);
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
                                .translate('part2_session_d3')),
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
                          child: Text('$zz03'),
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
                  if (zz04 == 1) {
                    zz04 = 0;
                    countSessionD -= 1;
                    localStorage.setPart2MarkSessionD(countSessionD);
                    countMarkD -= 1;
                    localStorage.setPart2MarkD(countMarkD);
                    widget.notifyParent!();
                  } else {
                    zz04 = 1;
                    countSessionD += 1;
                    localStorage.setPart2MarkSessionD(countSessionD);
                    countMarkD += 1;
                    localStorage.setPart2MarkD(countMarkD);
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
                                .translate('part2_session_d4')),
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
                          child: Text('$zz04'),
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
                  if (zz05 == 1) {
                    zz05 = 0;
                    countSessionD -= 1;
                    localStorage.setPart2MarkSessionD(countSessionD);
                    countMarkD -= 1;
                    localStorage.setPart2MarkD(countMarkD);
                    widget.notifyParent!();
                  } else {
                    zz05 = 1;
                    countSessionD += 1;
                    localStorage.setPart2MarkSessionD(countSessionD);
                    countMarkD += 1;
                    localStorage.setPart2MarkD(countMarkD);
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
                                .translate('part2_session_d5')),
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
                          child: Text('$zz05'),
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
                  if (zz06 == 1) {
                    zz06 = 0;
                    countSessionD -= 1;
                    localStorage.setPart2MarkSessionD(countSessionD);
                    countMarkD -= 1;
                    localStorage.setPart2MarkD(countMarkD);
                    widget.notifyParent!();
                  } else {
                    zz06 = 1;
                    countSessionD += 1;
                    localStorage.setPart2MarkSessionD(countSessionD);
                    countMarkD += 1;
                    localStorage.setPart2MarkD(countMarkD);
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
                                .translate('part2_session_d6')),
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
                              child: Text('$zz06'),
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
                  if (zz07 == 1) {
                    zz07 = 0;
                    countSessionD -= 1;
                    localStorage.setPart2MarkSessionD(countSessionD);
                    countMarkDM -= 1;
                    localStorage.setPart2MarkDM(countMarkDM);
                    widget.notifyParent!();
                  } else {
                    zz07 = 1;
                    countSessionD += 1;
                    localStorage.setPart2MarkSessionD(countSessionD);
                    countMarkDM += 1;
                    localStorage.setPart2MarkDM(countMarkDM);
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
                                    .translate('part2_session_d7_bold'),
                                style: TextStyle(fontWeight: FontWeight.bold)),
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
                          child: Text('$zz07'),
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
                  if (zz08 == 1) {
                    zz08 = 0;
                    countSessionD -= 1;
                    localStorage.setPart2MarkSessionD(countSessionD);
                    countMarkDM -= 1;
                    localStorage.setPart2MarkDM(countMarkDM);
                    widget.notifyParent!();
                  } else {
                    zz08 = 1;
                    countSessionD += 1;
                    localStorage.setPart2MarkSessionD(countSessionD);
                    countMarkDM += 1;
                    localStorage.setPart2MarkDM(countMarkDM);
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
                                    .translate('part2_session_d8_bold'),
                                style: TextStyle(fontWeight: FontWeight.bold)),
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
                          child: Text('$zz08'),
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
                  if (zz09 == 1) {
                    zz09 = 0;
                    countSessionD -= 1;
                    localStorage.setPart2MarkSessionD(countSessionD);
                    countMarkDM -= 1;
                    localStorage.setPart2MarkDM(countMarkDM);
                    widget.notifyParent!();
                  } else {
                    zz09 = 1;
                    countSessionD += 1;
                    localStorage.setPart2MarkSessionD(countSessionD);
                    countMarkDM += 1;
                    localStorage.setPart2MarkDM(countMarkDM);
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
                                    .translate('part2_session_d9_bold'),
                                style: TextStyle(fontWeight: FontWeight.bold)),
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
                          child: Text('$zz09'),
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
                  if (zz10 == 1) {
                    zz10 = 0;
                    countSessionD -= 1;
                    localStorage.setPart2MarkSessionD(countSessionD);
                    countMarkDM -= 1;
                    localStorage.setPart2MarkDM(countMarkDM);
                    widget.notifyParent!();
                  } else {
                    zz10 = 1;
                    countSessionD += 1;
                    localStorage.setPart2MarkSessionD(countSessionD);
                    countMarkDM += 1;
                    localStorage.setPart2MarkDM(countMarkDM);
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
                                  .translate('part2_session_d10_bold'),
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
                          child: Text('$zz10'),
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
                            zz01 = 1;
                            zz02 = 1;
                            zz03 = 1;
                            zz04 = 1;
                            zz05 = 1;
                            zz06 = 1;
                            zz07 = 1;
                            zz08 = 1;
                            zz09 = 1;
                            zz10 = 1;
                            countSessionD = 10;
                            localStorage.setPart2MarkSessionD(countSessionD);
                            countMarkD = 6;
                            countMarkDM = 4;
                            localStorage.setPart2MarkD(countMarkD);
                            localStorage.setPart2MarkDM(countMarkDM);
                            widget.notifyParent!();
                          } else {
                            zz01 = 0;
                            zz02 = 0;
                            zz03 = 0;
                            zz04 = 0;
                            zz05 = 0;
                            zz06 = 0;
                            zz07 = 0;
                            zz08 = 0;
                            zz09 = 0;
                            zz10 = 0;
                            countSessionD = 0;
                            localStorage.setPart2MarkSessionD(countSessionD);
                            countMarkD = 0;
                            countMarkDM = 0;
                            localStorage.setPart2MarkD(countMarkD);
                            localStorage.setPart2MarkDM(countMarkDM);
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
                '$countSessionD/10',
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

class SessionE extends StatefulWidget {
  final Function()? notifyParent;
  SessionE({Key? key, this.notifyParent}) : super(key: key);

  @override
  _SessionEState createState() => _SessionEState();
}

class _SessionEState extends State<SessionE> {
  int sl01 = 0,
      sl02 = 0,
      sl03 = 0,
      sl04 = 0,
      sl05 = 0,
      sl06 = 0,
      sl07 = 0,
      sl08 = 0,
      sl09 = 0,
      sl10 = 0,
      sl11 = 0;
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
          title: Text(
            AppLocalizations.of(context)!.translate('part2_session_e'),
            style:
                (TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
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
                  if (sl01 == 1) {
                    sl01 = 0;
                    countSessionE -= 1;
                    localStorage.setPart2MarkSessionE(countSessionE);

                    //count deduct normal mark
                    countMarkE -= 1;
                    localStorage.setPart2MarkE(countMarkE);

                    widget.notifyParent!();
                  } else {
                    sl01 = 1;
                    countSessionE += 1;
                    localStorage.setPart2MarkSessionE(countSessionE);

                    //count deduct normal mark
                    countMarkE += 1;
                    localStorage.setPart2MarkE(countMarkE);
                    widget.notifyParent!();
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
                                .translate('part2_session_e1')),
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
                          child: Text('$sl01'),
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
                  if (sl02 == 1) {
                    sl02 = 0;
                    countSessionE -= 1;
                    localStorage.setPart2MarkSessionE(countSessionE);

                    //count deduct normal mark
                    countMarkE -= 1;
                    localStorage.setPart2MarkE(countMarkE);
                    widget.notifyParent!();
                  } else {
                    sl02 = 1;
                    countSessionE += 1;
                    localStorage.setPart2MarkSessionE(countSessionE);

                    //count deduct normal mark
                    countMarkE += 1;
                    localStorage.setPart2MarkE(countMarkE);
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
                                .translate('part2_session_e2')),
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
                          child: Text('$sl02'),
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
                  if (sl03 == 1) {
                    sl03 = 0;
                    countSessionE -= 1;
                    localStorage.setPart2MarkSessionE(countSessionE);

                    //count deduct normal mark
                    countMarkE -= 1;
                    localStorage.setPart2MarkE(countMarkE);
                    widget.notifyParent!();
                  } else {
                    sl03 = 1;
                    countSessionE += 1;
                    localStorage.setPart2MarkSessionE(countSessionE);

                    //count deduct normal mark
                    countMarkE += 1;
                    localStorage.setPart2MarkE(countMarkE);
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
                                .translate('part2_session_e3')),
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
                          child: Text('$sl03'),
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
                  if (sl04 == 1) {
                    sl04 = 0;
                    countSessionE -= 1;
                    localStorage.setPart2MarkSessionE(countSessionE);

                    //count deduct normal mark
                    countMarkE -= 1;
                    localStorage.setPart2MarkE(countMarkE);
                    widget.notifyParent!();
                  } else {
                    sl04 = 1;
                    countSessionE += 1;
                    localStorage.setPart2MarkSessionE(countSessionE);

                    //count deduct normal mark
                    countMarkE += 1;
                    localStorage.setPart2MarkE(countMarkE);
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
                                .translate('part2_session_e4')),
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
                          child: Text('$sl04'),
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
                  if (sl05 == 1) {
                    sl05 = 0;
                    countSessionE -= 1;
                    localStorage.setPart2MarkSessionE(countSessionE);

                    //count deduct normal mark
                    countMarkE -= 1;
                    localStorage.setPart2MarkE(countMarkE);
                    widget.notifyParent!();
                  } else {
                    sl05 = 1;
                    countSessionE += 1;
                    localStorage.setPart2MarkSessionE(countSessionE);

                    //count deduct normal mark
                    countMarkE += 1;
                    localStorage.setPart2MarkE(countMarkE);
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
                                .translate('part2_session_e5')),
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
                          child: Text('$sl05'),
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
                  if (sl06 == 1) {
                    sl06 = 0;
                    countSessionE -= 1;
                    localStorage.setPart2MarkSessionE(countSessionE);

                    //count deduct normal mark
                    countMarkE -= 1;
                    localStorage.setPart2MarkE(countMarkE);
                    widget.notifyParent!();
                  } else {
                    sl06 = 1;
                    countSessionE += 1;
                    localStorage.setPart2MarkSessionE(countSessionE);

                    //count deduct normal mark
                    countMarkE += 1;
                    localStorage.setPart2MarkE(countMarkE);
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
                                .translate('part2_session_e6')),
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
                              child: Text('$sl06'),
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
                  if (sl07 == 1) {
                    sl07 = 0;
                    countSessionE -= 1;
                    localStorage.setPart2MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkEM -= 1;
                    localStorage.setPart2MarkEM(countMarkEM);
                    widget.notifyParent!();
                  } else {
                    sl07 = 1;
                    countSessionE += 1;
                    localStorage.setPart2MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkEM += 1;
                    localStorage.setPart2MarkEM(countMarkEM);
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
                                    .translate('part2_session_e7_bold'),
                                style: TextStyle(fontWeight: FontWeight.bold)),
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
                          child: Text('$sl07'),
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
                  if (sl08 == 1) {
                    sl08 = 0;

                    countSessionE -= 1;
                    localStorage.setPart2MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkEM -= 1;
                    localStorage.setPart2MarkEM(countMarkEM);
                    widget.notifyParent!();
                  } else {
                    sl08 = 1;
                    countSessionE += 1;
                    localStorage.setPart2MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkEM += 1;
                    localStorage.setPart2MarkEM(countMarkEM);
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
                                    .translate('part2_session_e8_bold'),
                                style: TextStyle(fontWeight: FontWeight.bold)),
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
                          child: Text('$sl08'),
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
                  if (sl09 == 1) {
                    sl09 = 0;
                    countSessionE -= 1;
                    localStorage.setPart2MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkEM -= 1;
                    localStorage.setPart2MarkEM(countMarkEM);
                    widget.notifyParent!();
                  } else {
                    sl09 = 1;
                    countSessionE += 1;
                    localStorage.setPart2MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkEM += 1;
                    localStorage.setPart2MarkEM(countMarkEM);
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
                                    .translate('part2_session_e9_bold'),
                                style: TextStyle(fontWeight: FontWeight.bold)),
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
                          child: Text('$sl09'),
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
                  if (sl10 == 1) {
                    sl10 = 0;
                    countSessionE -= 1;
                    localStorage.setPart2MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkEM -= 1;
                    localStorage.setPart2MarkEM(countMarkEM);
                    widget.notifyParent!();
                  } else {
                    sl10 = 1;
                    countSessionE += 1;
                    localStorage.setPart2MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkEM += 1;
                    localStorage.setPart2MarkEM(countMarkEM);
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
                                  .translate('part2_session_e10_bold'),
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
                          child: Text('$sl10'),
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
                  if (sl11 == 1) {
                    sl11 = 0;

                    countSessionE -= 1;
                    localStorage.setPart2MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkEM -= 1;
                    localStorage.setPart2MarkEM(countMarkEM);
                    widget.notifyParent!();
                  } else {
                    sl11 = 1;
                    countSessionE += 1;
                    localStorage.setPart2MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkEM += 1;
                    localStorage.setPart2MarkEM(countMarkEM);
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
                                  .translate('part2_session_e11_bold'),
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
                          child: Text('$sl11'),
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
                            sl01 = 1;
                            sl02 = 1;
                            sl03 = 1;
                            sl04 = 1;
                            sl05 = 1;
                            sl06 = 1;
                            sl07 = 1;
                            sl08 = 1;
                            sl09 = 1;
                            sl10 = 1;
                            sl11 = 1;
                            countSessionE = 11;
                            localStorage.setPart2MarkSessionE(countSessionE);

                            countMarkEM = 5;
                            localStorage.setPart2MarkEM(countMarkEM);
                            countMarkE = 6;
                            localStorage.setPart2MarkE(countMarkE);
                            widget.notifyParent!();
                          } else {
                            sl01 = 0;
                            sl02 = 0;
                            sl03 = 0;
                            sl04 = 0;
                            sl05 = 0;
                            sl06 = 0;
                            sl07 = 0;
                            sl08 = 0;
                            sl09 = 0;
                            sl10 = 0;
                            sl11 = 0;
                            countSessionE = 0;
                            localStorage.setPart2MarkSessionE(countSessionE);
                            countMarkEM = 0;
                            localStorage.setPart2MarkEM(countMarkEM);
                            countMarkE = 0;
                            localStorage.setPart2MarkE(countMarkE);
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
                '$countSessionE/11',
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

class SessionF extends StatefulWidget {
  final Function()? notifyParent;
  SessionF({Key? key, this.notifyParent}) : super(key: key);
  @override
  _SessionFState createState() => _SessionFState();
}

class _SessionFState extends State<SessionF> {
  int sp01 = 0,
      sp02 = 0,
      sp03 = 0,
      sp04 = 0,
      sp05 = 0,
      sp06 = 0,
      sp07 = 0,
      sp08 = 0,
      sp09 = 0,
      sp10 = 0,
      sp11 = 0,
      sp12 = 0,
      sp13 = 0;
  int countMarkFM = 5;
  int countMarkF = 8;
  int countSessionF = 0;
  bool? sessionF = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        custom.ExpansionTile(
          headerBackgroundColor: ColorConstant.primaryColor,
          title: Text(
            AppLocalizations.of(context)!.translate('part2_session_f'),
            style:
                (TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
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
                  if (sp01 == 1) {
                    sp01 = 0;
                    countSessionF -= 1;
                    localStorage.setPart2MarkSessionF(countSessionF);

                    //count normal deduct mark
                    countMarkF -= 1;
                    localStorage.setPart2MarkF(countMarkF);

                    widget.notifyParent!();
                  } else {
                    sp01 = 1;
                    countSessionF += 1;
                    localStorage.setPart2MarkSessionF(countSessionF);

                    //count normal deduct mark
                    countMarkF += 1;
                    localStorage.setPart2MarkF(countMarkF);
                    widget.notifyParent!();
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
                                left: 10, top: 10, bottom: 10),
                            child: Text(AppLocalizations.of(context)!
                                .translate('part2_session_f1')),
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
                          child: Text('$sp01'),
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
                  if (sp02 == 1) {
                    sp02 = 0;
                    countSessionF -= 1;
                    localStorage.setPart2MarkSessionF(countSessionF);

                    //count normal deduct mark
                    countMarkF -= 1;
                    localStorage.setPart2MarkF(countMarkF);
                    widget.notifyParent!();
                  } else {
                    sp02 = 1;
                    countSessionF += 1;
                    localStorage.setPart2MarkSessionF(countSessionF);

                    //count normal deduct mark
                    countMarkF += 1;
                    localStorage.setPart2MarkF(countMarkF);
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
                                .translate('part2_session_f2')),
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
                          child: Text('$sp02'),
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
                  if (sp03 == 1) {
                    sp03 = 0;
                    countSessionF -= 1;
                    localStorage.setPart2MarkSessionF(countSessionF);

                    //count normal deduct mark
                    countMarkF -= 1;
                    localStorage.setPart2MarkF(countMarkF);
                    widget.notifyParent!();
                  } else {
                    sp03 = 1;
                    countSessionF += 1;
                    localStorage.setPart2MarkSessionF(countSessionF);

                    //count normal deduct mark
                    countMarkF += 1;
                    localStorage.setPart2MarkF(countMarkF);
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
                                .translate('part2_session_f3')),
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
                          child: Text('$sp03'),
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
                  if (sp04 == 1) {
                    sp04 = 0;
                    countSessionF -= 1;
                    localStorage.setPart2MarkSessionF(countSessionF);

                    //count normal deduct mark
                    countMarkF -= 1;
                    localStorage.setPart2MarkF(countMarkF);
                    widget.notifyParent!();
                  } else {
                    sp04 = 1;
                    countSessionF += 1;
                    localStorage.setPart2MarkSessionF(countSessionF);

                    //count normal deduct mark
                    countMarkF += 1;
                    localStorage.setPart2MarkF(countMarkF);
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
                                .translate('part2_session_f4')),
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
                          child: Text('$sp04'),
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
                  if (sp05 == 1) {
                    sp05 = 0;
                    countSessionF -= 1;
                    localStorage.setPart2MarkSessionF(countSessionF);

                    //count normal deduct mark
                    countMarkF -= 1;
                    localStorage.setPart2MarkF(countMarkF);
                    widget.notifyParent!();
                  } else {
                    sp05 = 1;
                    countSessionF += 1;
                    localStorage.setPart2MarkSessionF(countSessionF);

                    //count normal deduct mark
                    countMarkF += 1;
                    localStorage.setPart2MarkF(countMarkF);
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
                                .translate('part2_session_f5')),
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
                          child: Text('$sp05'),
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
                  if (sp06 == 1) {
                    sp06 = 0;
                    countSessionF -= 1;
                    localStorage.setPart2MarkSessionF(countSessionF);

                    //count normal deduct mark
                    countMarkF -= 1;
                    localStorage.setPart2MarkF(countMarkF);
                    widget.notifyParent!();
                  } else {
                    sp06 = 1;
                    countSessionF += 1;
                    localStorage.setPart2MarkSessionF(countSessionF);

                    //count normal deduct mark
                    countMarkF += 1;
                    localStorage.setPart2MarkF(countMarkF);
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
                                .translate('part2_session_f6')),
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
                              child: Text('$sp06'),
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
                  if (sp07 == 1) {
                    sp07 = 0;
                    countSessionF -= 1;
                    localStorage.setPart2MarkSessionF(countSessionF);

                    //count normal deduct mark
                    countMarkF -= 1;
                    localStorage.setPart2MarkF(countMarkF);
                    widget.notifyParent!();
                  } else {
                    sp07 = 1;
                    countSessionF += 1;
                    localStorage.setPart2MarkSessionF(countSessionF);

                    //count normal deduct mark
                    countMarkF += 1;
                    localStorage.setPart2MarkF(countMarkF);
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
                                .translate('part2_session_f7')),
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
                          child: Text('$sp07'),
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
                  if (sp08 == 1) {
                    sp08 = 0;
                    countSessionF -= 1;
                    localStorage.setPart2MarkSessionF(countSessionF);

                    //count normal deduct mark
                    countMarkF -= 1;
                    localStorage.setPart2MarkF(countMarkF);
                    widget.notifyParent!();
                  } else {
                    sp08 = 1;
                    countSessionF += 1;
                    localStorage.setPart2MarkSessionF(countSessionF);

                    //count normal deduct mark
                    countMarkF += 1;
                    localStorage.setPart2MarkF(countMarkF);
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
                                .translate('part2_session_f8')),
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
                          child: Text('$sp08'),
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
                  if (sp09 == 1) {
                    sp09 = 0;
                    countSessionF -= 1;
                    localStorage.setPart2MarkSessionF(countSessionF);

                    //count mandatory deduct mark
                    countMarkFM -= 1;
                    localStorage.setPart2MarkFM(countMarkFM);

                    widget.notifyParent!();
                  } else {
                    sp09 = 1;
                    countSessionF += 1;
                    localStorage.setPart2MarkSessionF(countSessionF);

                    //count mandatory deduct mark
                    countMarkFM += 1;
                    localStorage.setPart2MarkFM(countMarkFM);
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
                                    .translate('part2_session_f9_bold'),
                                style: TextStyle(fontWeight: FontWeight.bold)),
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
                          child: Text('$sp09'),
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
                  if (sp10 == 1) {
                    sp10 = 0;
                    countSessionF -= 1;
                    localStorage.setPart2MarkSessionF(countSessionF);

                    //count mandatory deduct mark
                    countMarkFM -= 1;
                    localStorage.setPart2MarkFM(countMarkFM);
                    widget.notifyParent!();
                  } else {
                    sp10 = 1;
                    countSessionF += 1;
                    localStorage.setPart2MarkSessionF(countSessionF);

                    //count mandatory deduct mark
                    countMarkFM += 1;
                    localStorage.setPart2MarkFM(countMarkFM);
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
                                  .translate('part2_session_f10_bold'),
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
                          child: Text('$sp10'),
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
                  if (sp11 == 1) {
                    sp11 = 0;
                    countSessionF -= 1;
                    localStorage.setPart2MarkSessionF(countSessionF);

                    //count mandatory deduct mark
                    countMarkFM -= 1;
                    localStorage.setPart2MarkFM(countMarkFM);
                    widget.notifyParent!();
                  } else {
                    sp11 = 1;
                    countSessionF += 1;
                    localStorage.setPart2MarkSessionF(countSessionF);

                    //count mandatory deduct mark
                    countMarkFM += 1;
                    localStorage.setPart2MarkFM(countMarkFM);
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
                                  .translate('part2_session_f11_bold'),
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
                          child: Text('$sp11'),
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
                  if (sp12 == 1) {
                    sp12 = 0;
                    countSessionF -= 1;
                    localStorage.setPart2MarkSessionF(countSessionF);

                    //count mandatory deduct mark
                    countMarkFM -= 1;
                    localStorage.setPart2MarkFM(countMarkFM);
                    widget.notifyParent!();
                  } else {
                    sp12 = 1;
                    countSessionF += 1;
                    localStorage.setPart2MarkSessionF(countSessionF);

                    //count mandatory deduct mark
                    countMarkFM += 1;
                    localStorage.setPart2MarkFM(countMarkFM);
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
                                  .translate('part2_session_f12_bold'),
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
                          child: Text('$sp12'),
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
                  if (sp13 == 1) {
                    sp13 = 0;
                    countSessionF -= 1;
                    localStorage.setPart2MarkSessionF(countSessionF);

                    //count mandatory deduct mark
                    countMarkFM -= 1;
                    localStorage.setPart2MarkFM(countMarkFM);
                    widget.notifyParent!();
                  } else {
                    sp13 = 1;
                    countSessionF += 1;
                    localStorage.setPart2MarkSessionF(countSessionF);

                    //count mandatory deduct mark
                    countMarkFM += 1;
                    localStorage.setPart2MarkFM(countMarkFM);
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
                                  .translate('part2_session_f13_bold'),
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
                          child: Text('$sp13'),
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
                            sp01 = 1;
                            sp02 = 1;
                            sp03 = 1;
                            sp04 = 1;
                            sp05 = 1;
                            sp06 = 1;
                            sp07 = 1;
                            sp08 = 1;
                            sp09 = 1;
                            sp10 = 1;
                            sp11 = 1;
                            sp12 = 1;
                            sp13 = 1;
                            countSessionF = 13;
                            localStorage.setPart2MarkSessionF(countSessionF);
                            countMarkFM = 5;
                            countMarkF = 8;
                            localStorage.setPart2MarkFM(countMarkFM);
                            localStorage.setPart2MarkF(countMarkF);
                            widget.notifyParent!();
                          } else {
                            sp01 = 0;
                            sp02 = 0;
                            sp03 = 0;
                            sp04 = 0;
                            sp05 = 0;
                            sp06 = 0;
                            sp07 = 0;
                            sp08 = 0;
                            sp09 = 0;
                            sp10 = 0;
                            sp11 = 0;
                            sp12 = 0;
                            sp13 = 0;
                            countSessionF = 0;
                            localStorage.setPart2MarkSessionF(countSessionF);
                            countMarkFM = 0;
                            countMarkF = 0;
                            localStorage.setPart2MarkFM(countMarkFM);
                            localStorage.setPart2MarkF(countMarkF);
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
                '$countSessionF/13',
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

class RsmSessionG extends StatefulWidget {
  final Function()? notifyParent;
  RsmSessionG({Key? key, this.notifyParent}) : super(key: key);

  @override
  _RsmSessionGState createState() => _RsmSessionGState();
}

class _RsmSessionGState extends State<RsmSessionG> {
  int tp01 = 0,
      tp02 = 0,
      tp03 = 0,
      tp04 = 0,
      tp05 = 0,
      tp06 = 0,
      tp07 = 0,
      tp08 = 0,
      tp09 = 0,
      tp10 = 0,
      tp11 = 0,
      tp12 = 0;
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
          title: Text(
            AppLocalizations.of(context)!.translate('part2_session_g'),
            style:
                (TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
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
                  if (tp01 == 1) {
                    tp01 = 0;
                    countSessionG -= 1;
                    localStorage.setPart2MarkSessionG(countSessionG);
                    countMarkG -= 1;
                    localStorage.setPart2MarkG(countMarkG);
                    widget.notifyParent!();
                  } else {
                    tp01 = 1;
                    countSessionG += 1;
                    localStorage.setPart2MarkSessionG(countSessionG);
                    countMarkG += 1;
                    localStorage.setPart2MarkG(countMarkG);
                    widget.notifyParent!();
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
                                .translate('part2_session_g1')),
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
                          child: Text('$tp01'),
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
                  if (tp02 == 1) {
                    tp02 = 0;
                    countSessionG -= 1;
                    localStorage.setPart2MarkSessionG(countSessionG);
                    countMarkG -= 1;
                    localStorage.setPart2MarkG(countMarkG);
                    widget.notifyParent!();
                  } else {
                    tp02 = 1;
                    countSessionG += 1;
                    localStorage.setPart2MarkSessionG(countSessionG);
                    countMarkG += 1;
                    localStorage.setPart2MarkG(countMarkG);
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
                                .translate('part2_session_g2')),
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
                          child: Text('$tp02'),
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
                  if (tp03 == 1) {
                    tp03 = 0;
                    countSessionG -= 1;
                    localStorage.setPart2MarkSessionG(countSessionG);
                    countMarkG -= 1;
                    localStorage.setPart2MarkG(countMarkG);
                    widget.notifyParent!();
                  } else {
                    tp03 = 1;
                    countSessionG += 1;
                    localStorage.setPart2MarkSessionG(countSessionG);
                    countMarkG += 1;
                    localStorage.setPart2MarkG(countMarkG);
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
                                .translate('part2_session_g3')),
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
                          child: Text('$tp03'),
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
                  if (tp04 == 1) {
                    tp04 = 0;
                    countSessionG -= 1;
                    localStorage.setPart2MarkSessionG(countSessionG);
                    countMarkG -= 1;
                    localStorage.setPart2MarkG(countMarkG);
                    widget.notifyParent!();
                  } else {
                    tp04 = 1;
                    countSessionG += 1;
                    localStorage.setPart2MarkSessionG(countSessionG);
                    countMarkG += 1;
                    localStorage.setPart2MarkG(countMarkG);
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
                                .translate('part2_session_g4')),
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
                          child: Text('$tp04'),
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
                  if (tp05 == 1) {
                    tp05 = 0;
                    countSessionG -= 1;
                    localStorage.setPart2MarkSessionG(countSessionG);
                    countMarkG -= 1;
                    localStorage.setPart2MarkG(countMarkG);
                    widget.notifyParent!();
                  } else {
                    tp05 = 1;
                    countSessionG += 1;
                    localStorage.setPart2MarkSessionG(countSessionG);
                    countMarkG += 1;
                    localStorage.setPart2MarkG(countMarkG);
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
                                .translate('part2_session_g5')),
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
                          child: Text('$tp05'),
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
                  if (tp06 == 1) {
                    tp06 = 0;
                    countMarkGM -= 1;
                    localStorage.setPart2MarkGM(countMarkGM);

                    //total marks on top of checkbox
                    countSessionG -= 1;
                    localStorage.setPart2MarkSessionG(countSessionG);
                    widget.notifyParent!();
                  } else {
                    tp06 = 1;
                    countMarkGM += 1;
                    localStorage.setPart2MarkGM(countMarkGM);

                    //total marks on top of checkbox
                    countSessionG += 1;
                    localStorage.setPart2MarkSessionG(countSessionG);
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
                                  .translate('part2_session_g6_bold'),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
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
                              child: Text('$tp06'),
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
                  if (tp07 == 1) {
                    tp07 = 0;
                    countMarkGM -= 1;
                    localStorage.setPart2MarkGM(countMarkGM);

                    //total marks on top of checkbox
                    countSessionG -= 1;
                    localStorage.setPart2MarkSessionG(countSessionG);
                    widget.notifyParent!();
                  } else {
                    tp07 = 1;
                    countMarkGM += 1;
                    localStorage.setPart2MarkGM(countMarkGM);

                    //total marks on top of checkbox
                    countSessionG += 1;
                    localStorage.setPart2MarkSessionG(countSessionG);
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
                                  .translate('part2_session_g7_bold'),
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
                          child: Text('$tp07'),
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
                  if (tp08 == 1) {
                    tp08 = 0;
                    countMarkGM -= 1;
                    localStorage.setPart2MarkGM(countMarkGM);

                    //total marks on top of checkbox
                    countSessionG -= 1;
                    localStorage.setPart2MarkSessionG(countSessionG);
                    widget.notifyParent!();
                  } else {
                    tp08 = 1;
                    countMarkGM += 1;
                    localStorage.setPart2MarkGM(countMarkGM);

                    //total marks on top of checkbox
                    countSessionG += 1;
                    localStorage.setPart2MarkSessionG(countSessionG);
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
                                  .translate('part2_session_g8_bold'),
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
                          child: Text('$tp08'),
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
                  if (tp09 == 1) {
                    tp09 = 0;
                    countMarkGM -= 1;
                    localStorage.setPart2MarkGM(countMarkGM);

                    //total marks on top of checkbox
                    countSessionG -= 1;
                    localStorage.setPart2MarkSessionG(countSessionG);
                    widget.notifyParent!();
                  } else {
                    tp09 = 1;
                    countMarkGM += 1;
                    localStorage.setPart2MarkGM(countMarkGM);

                    //total marks on top of checkbox
                    countSessionG += 1;
                    localStorage.setPart2MarkSessionG(countSessionG);
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
                                    .translate('part2_session_g9_bold'),
                                style: TextStyle(fontWeight: FontWeight.bold)),
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
                          child: Text('$tp09'),
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
                  if (tp10 == 1) {
                    tp10 = 0;
                    countMarkGM -= 1;
                    localStorage.setPart2MarkGM(countMarkGM);

                    //total marks on top of checkbox
                    countSessionG -= 1;
                    localStorage.setPart2MarkSessionG(countSessionG);
                    widget.notifyParent!();
                  } else {
                    tp10 = 1;
                    countMarkGM += 1;
                    localStorage.setPart2MarkGM(countMarkGM);

                    //total marks on top of checkbox
                    countSessionG += 1;
                    localStorage.setPart2MarkSessionG(countSessionG);
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
                                  .translate('part2_session_g10_bold'),
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
                          child: Text('$tp10'),
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
                  if (tp11 == 1) {
                    tp11 = 0;
                    countMarkGM -= 1;
                    localStorage.setPart2MarkGM(countMarkGM);

                    //total marks on top of checkbox
                    countSessionG -= 1;
                    localStorage.setPart2MarkSessionG(countSessionG);
                    widget.notifyParent!();
                  } else {
                    tp11 = 1;
                    countMarkGM += 1;
                    localStorage.setPart2MarkGM(countMarkGM);

                    //total marks on top of checkbox
                    countSessionG += 1;
                    localStorage.setPart2MarkSessionG(countSessionG);
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
                                  .translate('part2_session_g11_bold'),
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
                          child: Text('$tp11'),
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
                  if (tp12 == 1) {
                    tp12 = 0;

                    localStorage.setPart2MarkGM(countMarkGM -= 1);

                    //total marks for on top of checkbox
                    countSessionG -= 1;
                    localStorage.setPart2MarkSessionG(countSessionG);
                    widget.notifyParent!();
                  } else {
                    tp12 = 1;

                    localStorage.setPart2MarkGM(countMarkGM += 1);

                    //total marks on top of checkbox
                    countSessionG += 1;
                    localStorage.setPart2MarkSessionG(countSessionG);
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
                                  .translate('part2_session_g12_bold'),
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
                          child: Text('$tp12'),
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
                            tp01 = 1;
                            tp02 = 1;
                            tp03 = 1;
                            tp04 = 1;
                            tp05 = 1;
                            tp06 = 1;
                            tp07 = 1;
                            tp08 = 1;
                            tp09 = 1;
                            tp10 = 1;
                            tp11 = 1;
                            tp12 = 1;
                            countSessionG = 12;
                            countMarkGM = 7;
                            countMarkG = 5;
                            localStorage.setPart2MarkSessionG(countSessionG);
                            localStorage.setPart2MarkGM(countMarkGM);
                            localStorage.setPart2MarkG(countMarkG);
                            widget.notifyParent!();
                          } else {
                            tp01 = 0;
                            tp02 = 0;
                            tp03 = 0;
                            tp04 = 0;
                            tp05 = 0;
                            tp06 = 0;
                            tp07 = 0;
                            tp08 = 0;
                            tp09 = 0;
                            tp10 = 0;
                            tp11 = 0;
                            tp12 = 0;
                            countSessionG = 0;
                            countMarkGM = 0;
                            countMarkG = 0;
                            localStorage.setPart2MarkSessionG(countSessionG);
                            localStorage.setPart2MarkGM(countMarkGM);
                            localStorage.setPart2MarkG(countMarkG);
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
                '$countSessionG/12',
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

class RsmSessionH extends StatefulWidget {
  final Function()? notifyParent;
  RsmSessionH({Key? key, this.notifyParent}) : super(key: key);

  @override
  _RsmSessionHState createState() => _RsmSessionHState();
}

class _RsmSessionHState extends State<RsmSessionH> {
  int common01 = 0, common02 = 0, common03 = 0, common04 = 0, common05 = 0;
  int countSessionH = 0;
  int deductMarksH = 5;

  bool? sessionH = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        custom.ExpansionTile(
          headerBackgroundColor: ColorConstant.primaryColor,
          title: Text(
            AppLocalizations.of(context)!.translate('part2_session_h'),
            style:
                (TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
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
                  if (common01 == 1) {
                    common01 = 0;
                    countSessionH -= 1;
                    localStorage.setPart2MarkSessionHM(countSessionH);

                    // count deducted marks
                    deductMarksH += 1;
                    localStorage.setPart2MarkH(deductMarksH);
                    widget.notifyParent!();
                  } else if (common01 == 0) {
                    common01 = 1;
                    countSessionH += 1;
                    localStorage.setPart2MarkSessionHM(countSessionH);

                    // count deducted marks

                    deductMarksH -= 1;
                    localStorage.setPart2MarkH(deductMarksH);
                    widget.notifyParent!();
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
                            child: Text(
                              AppLocalizations.of(context)!
                                  .translate('part2_session_h1_bold'),
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
                          child: Text('$common01'),
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
                  if (common02 == 1) {
                    common02 = 0;
                    countSessionH -= 1;
                    localStorage.setPart2MarkSessionHM(countSessionH);

                    // count deducted marks
                    deductMarksH += 1;
                    localStorage.setPart2MarkH(deductMarksH);
                    widget.notifyParent!();
                  } else if (common02 == 0) {
                    common02 = 1;
                    countSessionH += 1;
                    localStorage.setPart2MarkSessionHM(countSessionH);

                    // count deducted marks
                    deductMarksH -= 1;
                    localStorage.setPart2MarkH(deductMarksH);
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
                                  .translate('part2_session_h2_bold'),
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
                          child: Text('$common02'),
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
                  if (common03 == 1) {
                    common03 = 0;
                    countSessionH -= 1;
                    localStorage.setPart2MarkSessionHM(countSessionH);

                    // count deducted marks
                    deductMarksH += 1;
                    localStorage.setPart2MarkH(deductMarksH);
                    widget.notifyParent!();
                  } else if (common03 == 0) {
                    common03 = 1;
                    countSessionH += 1;
                    localStorage.setPart2MarkSessionHM(countSessionH);

                    // count deducted marks
                    deductMarksH -= 1;
                    localStorage.setPart2MarkH(deductMarksH);
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
                                  .translate('part2_session_h3_bold'),
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
                          child: Text('$common03'),
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
                  if (common04 == 1) {
                    common04 = 0;
                    countSessionH -= 1;
                    localStorage.setPart2MarkSessionHM(countSessionH);

                    // count deducted marks
                    deductMarksH += 1;
                    localStorage.setPart2MarkH(deductMarksH);
                    widget.notifyParent!();
                  } else if (common04 == 0) {
                    common04 = 1;
                    countSessionH += 1;
                    localStorage.setPart2MarkSessionHM(countSessionH);

                    // count deducted marks
                    deductMarksH -= 1;
                    localStorage.setPart2MarkH(deductMarksH);
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
                                  .translate('part2_session_h4_bold'),
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
                          child: Text('$common04'),
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
                  if (common05 == 1) {
                    common05 = 0;
                    countSessionH -= 1;
                    localStorage.setPart2MarkSessionHM(countSessionH);

                    // count deducted marks
                    deductMarksH += 1;
                    localStorage.setPart2MarkH(deductMarksH);
                    widget.notifyParent!();
                  } else if (common05 == 0) {
                    common05 = 1;
                    countSessionH += 1;
                    localStorage.setPart2MarkSessionHM(countSessionH);

                    // count deducted marks

                    deductMarksH -= 1;
                    localStorage.setPart2MarkH(deductMarksH);
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
                                  .translate('part2_session_h5_bold'),
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
                          child: Text('$common05'),
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
                        common01 = 1;
                        common02 = 1;
                        common03 = 1;
                        common04 = 1;
                        common05 = 1;
                        countSessionH = 5;
                        deductMarksH = 0;
                        localStorage.setPart2MarkSessionHM(countSessionH);
                        localStorage.setPart2MarkH(deductMarksH);
                        widget.notifyParent!();
                      } else {
                        common01 = 0;
                        common02 = 0;
                        common03 = 0;
                        common04 = 0;
                        common05 = 0;
                        countSessionH = 0;
                        deductMarksH = 5;
                        localStorage.setPart2MarkSessionHM(countSessionH);
                        localStorage.setPart2MarkH(deductMarksH);
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
                '$countSessionH/5',
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
