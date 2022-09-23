import 'package:edriving_qti_app/common_library/services/model/provider_model.dart';
import 'package:edriving_qti_app/utils/constants.dart';
import 'package:edriving_qti_app/utils/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:edriving_qti_app/common_library/utils/app_localizations.dart';
import 'package:edriving_qti_app/pages/eTestingSolution/custom_expansion_tile.dart'
    as custom;
import 'package:provider/provider.dart';

class SessionI extends StatefulWidget {
  final Function()? notifyParent;
  SessionI({Key? key, this.notifyParent}) : super(key: key);

  @override
  _SessionIState createState() => _SessionIState();
}

class _SessionIState extends State<SessionI> {
  final localStorage = LocalStorage();

  int i1 = 0, i2 = 0, i3 = 0, i4 = 0, i5 = 0;

  bool? sessionH = false;
  @override
  Widget build(BuildContext context) {
    int iMandatoryMark = context.watch<JrSessionModel>().iMandatoryMark;

    return Stack(
      children: <Widget>[
        custom.ExpansionTile(
          headerBackgroundColor: ColorConstant.primaryColor,
          title: Text(
            AppLocalizations.of(context)!.translate('jr_session_i'),
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
                  if (i1 == 1) {
                    i1 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultI(i1: 0);
                  } else if (i1 == 0) {
                    i1 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultI(i1: 1);
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
                                  .translate('part3_session_i1_bold'),
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
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultI(i2: 0);
                  } else if (i2 == 0) {
                    i2 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultI(i2: 1);
                  }
                });
              },
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(ScreenUtil().setSp(10)),
                  1: FlexColumnWidth(ScreenUtil().setSp(1.5)),
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
                                  .translate('part3_session_i2_bold'),
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
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultI(i3: 0);
                  } else if (i3 == 0) {
                    i3 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultI(i3: 1);
                  }
                });
              },
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(ScreenUtil().setSp(10)),
                  1: FlexColumnWidth(ScreenUtil().setSp(1.5)),
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
                                  .translate('part3_session_i3_bold'),
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
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultI(i4: 0);
                  } else if (i4 == 0) {
                    i4 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultI(i4: 1);
                  }
                });
              },
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(ScreenUtil().setSp(10)),
                  1: FlexColumnWidth(ScreenUtil().setSp(1.5)),
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
                                  .translate('part3_session_i4_bold'),
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
                        i1 = 1;
                        i2 = 1;
                        i3 = 1;
                        i4 = 1;

                        Provider.of<JrSessionModel>(context, listen: false)
                            .setResultI(
                          i1: 1,
                          i2: 1,
                          i3: 1,
                          i4: 1,
                        );
                      } else {
                        i1 = 0;
                        i2 = 0;
                        i3 = 0;
                        i4 = 0;

                        Provider.of<JrSessionModel>(context, listen: false)
                            .setResultI(
                          i1: 0,
                          i2: 0,
                          i3: 0,
                          i4: 0,
                        );
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
                '$iMandatoryMark/4',
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
