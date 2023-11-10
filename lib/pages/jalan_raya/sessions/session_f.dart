import 'package:edriving_qti_app/common_library/services/model/provider_model.dart';
import 'package:edriving_qti_app/utils/constants.dart';
import 'package:edriving_qti_app/utils/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:edriving_qti_app/common_library/utils/app_localizations.dart';
import 'package:edriving_qti_app/pages/eTestingSolution/custom_expansion_tile.dart'
    as custom;
import 'package:provider/provider.dart';

class SessionF extends StatefulWidget {
  final Function()? notifyParent;
  const SessionF({super.key, this.notifyParent});

  @override
  _SessionFState createState() => _SessionFState();
}

class _SessionFState extends State<SessionF> {
  final localStorage = LocalStorage();

  int f1 = 0,
      f2 = 0,
      f3 = 0,
      f4 = 0,
      f5 = 0,
      f6 = 0,
      f7 = 0,
      f8 = 0,
      f9 = 0,
      f10 = 0;

  int countSessionG = 0;
  int countMarkGM = 0;
  int countMarkG = 0;

  bool? sessionG = false;
  @override
  Widget build(BuildContext context) {
    int fMark = context.watch<JrSessionModel>().fMark;
    int fMandatoryMark = context.watch<JrSessionModel>().fMandatoryMark;

    return Stack(
      children: <Widget>[
        custom.ExpansionTile(
          headerBackgroundColor: ColorConstant.primaryColor,
          title: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              AppLocalizations.of(context)!.translate('jr_session_f'),
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
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultF(f1: 0);
                    countSessionG -= 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    countMarkG -= 1;
                    localStorage.setPart3MarkG(countMarkG);
                    // widget.notifyParent();
                  } else {
                    f1 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultF(f1: 1);
                    countSessionG += 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    countMarkG += 1;
                    localStorage.setPart3MarkG(countMarkG);
                    // widget.notifyParent();
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
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultF(f2: 0);
                    countSessionG -= 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    countMarkG -= 1;
                    localStorage.setPart3MarkG(countMarkG);
                    // widget.notifyParent();
                  } else {
                    f2 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultF(f2: 1);
                    countSessionG += 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    countMarkG += 1;
                    localStorage.setPart3MarkG(countMarkG);
                    // widget.notifyParent();
                  }
                });
              },
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(ScreenUtil().setSp(10)),
                  1: FlexColumnWidth(ScreenUtil().setSp(1.5)),
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
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultF(f3: 0);
                    countSessionG -= 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    countMarkG -= 1;
                    localStorage.setPart3MarkG(countMarkG);
                    // widget.notifyParent();
                  } else {
                    f3 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultF(f3: 1);
                    countSessionG += 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    countMarkG += 1;
                    localStorage.setPart3MarkG(countMarkG);
                    // widget.notifyParent();
                  }
                });
              },
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(ScreenUtil().setSp(10)),
                  1: FlexColumnWidth(ScreenUtil().setSp(1.5)),
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
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultF(f4: 0);
                    countSessionG -= 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    countMarkG -= 1;
                    localStorage.setPart3MarkG(countMarkG);
                    // widget.notifyParent();
                  } else {
                    f4 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultF(f4: 1);
                    countSessionG += 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    countMarkG += 1;
                    localStorage.setPart3MarkG(countMarkG);
                    // widget.notifyParent();
                  }
                });
              },
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(ScreenUtil().setSp(10)),
                  1: FlexColumnWidth(ScreenUtil().setSp(1.5)),
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
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultF(f5: 0);
                    countSessionG -= 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    countMarkG -= 1;
                    localStorage.setPart3MarkG(countMarkG);
                    // widget.notifyParent();
                  } else {
                    f5 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultF(f5: 1);
                    countSessionG += 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    countMarkG += 1;
                    localStorage.setPart3MarkG(countMarkG);
                    // widget.notifyParent();
                  }
                });
              },
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(ScreenUtil().setSp(10)),
                  1: FlexColumnWidth(ScreenUtil().setSp(1.5)),
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
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultF(f6: 0);
                    countMarkG -= 1;
                    localStorage.setPart3MarkG(countMarkG);

                    //total marks on top of checkbox
                    countSessionG -= 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    // widget.notifyParent();
                  } else {
                    f6 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultF(f6: 1);
                    countMarkG += 1;
                    localStorage.setPart3MarkG(countMarkG);

                    //total marks on top of checkbox
                    countSessionG += 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    // widget.notifyParent();
                  }
                });
              },
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(ScreenUtil().setSp(10)),
                  1: FlexColumnWidth(ScreenUtil().setSp(1.5)),
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
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultF(f7: 0);
                    countMarkG -= 1;
                    localStorage.setPart3MarkG(countMarkG);

                    //total marks on top of checkbox
                    countSessionG -= 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    // widget.notifyParent();
                  } else {
                    f7 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultF(f7: 1);
                    countMarkG += 1;
                    localStorage.setPart3MarkG(countMarkG);

                    //total marks on top of checkbox
                    countSessionG += 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    // widget.notifyParent();
                  }
                });
              },
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(ScreenUtil().setSp(10)),
                  1: FlexColumnWidth(ScreenUtil().setSp(1.5)),
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
                                  .translate('part3_session_f7'),
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
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultF(f8: 0);
                    countMarkGM -= 1;
                    localStorage.setPart3MarkGM(countMarkGM);

                    //total marks on top of checkbox
                    countSessionG -= 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    // widget.notifyParent();
                  } else {
                    f8 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultF(f8: 1);
                    countMarkGM += 1;
                    localStorage.setPart3MarkGM(countMarkGM);

                    //total marks on top of checkbox
                    countSessionG += 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    // widget.notifyParent();
                  }
                });
              },
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(ScreenUtil().setSp(10)),
                  1: FlexColumnWidth(ScreenUtil().setSp(1.5)),
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
                                  .translate('part3_session_f8_bold'),
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
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultF(f9: 0);
                    countMarkGM -= 1;
                    localStorage.setPart3MarkGM(countMarkGM);

                    //total marks on top of checkbox
                    countSessionG -= 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    // widget.notifyParent();
                  } else {
                    f9 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultF(f9: 1);
                    countMarkGM += 1;
                    localStorage.setPart3MarkGM(countMarkGM);

                    //total marks on top of checkbox
                    countSessionG += 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    // widget.notifyParent();
                  }
                });
              },
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(ScreenUtil().setSp(10)),
                  1: FlexColumnWidth(ScreenUtil().setSp(1.5)),
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
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultF(f10: 0);
                    countMarkGM -= 1;
                    localStorage.setPart3MarkGM(countMarkGM);

                    //total marks on top of checkbox
                    countSessionG -= 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    // widget.notifyParent();
                  } else {
                    f10 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultF(f10: 1);
                    countMarkGM += 1;
                    localStorage.setPart3MarkGM(countMarkGM);

                    //total marks on top of checkbox
                    countSessionG += 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    // widget.notifyParent();
                  }
                });
              },
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(ScreenUtil().setSp(10)),
                  1: FlexColumnWidth(ScreenUtil().setSp(1.5)),
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

                            Provider.of<JrSessionModel>(context, listen: false)
                                .setResultF(
                              f1: 1,
                              f2: 1,
                              f3: 1,
                              f4: 1,
                              f5: 1,
                              f6: 1,
                              f7: 1,
                              f8: 1,
                              f9: 1,
                              f10: 1,
                            );
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

                            Provider.of<JrSessionModel>(context, listen: false)
                                .setResultF(
                              f1: 0,
                              f2: 0,
                              f3: 0,
                              f4: 0,
                              f5: 0,
                              f6: 0,
                              f7: 0,
                              f8: 0,
                              f9: 0,
                              f10: 0,
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
            padding: const EdgeInsets.only(right: 35, top: 5),
            child: Container(
              child: Text(
                '${fMark + fMandatoryMark}/10',
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
