import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:expandable/expandable.dart';
import 'package:edriving_qti_app/common_library/services/model/provider_model.dart';
import 'package:edriving_qti_app/common_library/services/repository/epandu_repository.dart';
import 'package:edriving_qti_app/common_library/utils/custom_dialog.dart';
import 'package:edriving_qti_app/common_library/utils/loading_model.dart';
import 'package:edriving_qti_app/utils/constants.dart';
import 'package:edriving_qti_app/utils/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:edriving_qti_app/common_library/utils/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../common_library/services/repository/etesting_repository.dart';

// ignore: must_be_immutable
class RpkPartIII extends StatefulWidget {
  final String? qNo;
  final String? nric;
  final String? rpkName;
  final String? testDate;
  final String? groupId;
  final String? testCode;
  final String? vehNo;
  final bool skipUpdateRpkJpjTestStart;

  RpkPartIII(
    this.qNo,
    this.nric,
    this.rpkName,
    this.testDate,
    this.groupId,
    this.testCode,
    this.vehNo,
    this.skipUpdateRpkJpjTestStart,
  );

  @override
  _Part3MainState createState() => _Part3MainState();
}

class _Part3MainState extends State<RpkPartIII> {
  final image = ImagesConstant();
  final localStorage = LocalStorage();
  final primaryColor = ColorConstant.primaryColor;
  final textStyle = TextStyle(
    fontSize: 60.sp,
    color: Colors.black,
  );
  final epanduRepo = EpanduRepo();
  final customDialog = CustomDialog();
  bool isVisible = false;

  bool? checkAll = false;
  Future? ruleFuture;
  final etestingRepo = EtestingRepo();
  var ruleList = [];

  @override
  void initState() {
    super.initState();
    getRule();
    if (!widget.skipUpdateRpkJpjTestStart) {
      updateRpkJpjTestStart();
    }
  }

  Future<void> getRule() async {
    ruleFuture = etestingRepo.getRule(elementCode: 'RPK');
    var result = await ruleFuture;
    ruleList = result.data;
  }

  Future<void> updateRpkJpjTestStart() async {
    setState(() {
      isVisible = true;
    });

    var result = await epanduRepo.updateRpkJpjTestStart(
      testCode: widget.testCode,
      groupId: widget.groupId,
      icNo: widget.nric,
      part3Type: 'RPK',
    );

    if (result.isSuccess) {
    } else {
      customDialog.show(
          context: context,
          title: Icon(Icons.error_outline),
          content: result.message,
          customActions: [
            TextButton(
              onPressed: () => context.router.popUntil(
                ModalRoute.withName('ConfirmCandidateInfo'),
              ),
              child: Text('Ok'),
            ),
          ],
          type: DialogType.GENERAL);
    }

    setState(() {
      isVisible = false;
    });
  }

  updateRpkJpjTestResult() async {
    var a = {
      'Result': [{}]
    };
    for (var element in ruleList) {
      a['Result']![0][element.ruleCode] =
          element.isCheck == null || element.isCheck == false ? 0 : '1';
    }

    print(jsonEncode(a));

    setState(() {
      isVisible = true;
    });

    var result = await epanduRepo.updateRpkJpjTestResult(
      vehNo: widget.vehNo,
      resultJson: jsonEncode(a),
      testCode: widget.testCode,
      groupId: widget.groupId,
      icNo: widget.nric,
      part3Type: 'RPK',
    );

    if (result.isSuccess) {
      customDialog.show(
          context: context,
          barrierDismissable: false,
          onPressed: () {
            Provider.of<RpkSessionModel>(context, listen: false).reset();

            context.router.popUntil(
              ModalRoute.withName('HomePageRpk'),
            );
          },
          content: AppLocalizations.of(context)!.translate('test_submitted'),
          type: DialogType.SUCCESS);
    } else {
      customDialog.show(
          context: context, content: result.message, type: DialogType.WARNING);
    }

    setState(() {
      isVisible = false;
    });
  }

  Future<bool> _onWillPop() async {
    // return CustomDialog().show(
    //   context: context,
    //   title: Text(AppLocalizations.of(context).translate('warning_title')),
    //   content: AppLocalizations.of(context).translate('confirm_exit_desc'),
    //   customActions: <Widget>[
    //     TextButton(
    //       child: Text(AppLocalizations.of(context).translate('yes_lbl')),
    //       onPressed: () {
    //         Provider.of<RpkSessionModel>(context, listen: false).reset();

    //         context.router.popUntil(
    //           ModalRoute.withName(Routes.home),
    //         );
    //       },
    //     ),
    //     TextButton(
    //       child: Text(AppLocalizations.of(context).translate('no_lbl')),
    //       onPressed: () {
    //         context.router.pop();
    //       },
    //     ),
    //   ],
    //   type: DialogType.GENERAL,
    // );
    return false;
  }

  @override
  Widget build(BuildContext context) {
    int mark = context.watch<RpkSessionModel>().mark;

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text('RPK'),
          automaticallyImplyLeading: false,
          actions: [
            // IconButton(
            //     onPressed: () {
            //       setState(() {
            //         isVisible = false;
            //       });
            //       // context.router.push(RuleRoute());
            //     },
            //     icon: Icon(Icons.abc_outlined))
          ],
        ),
        /*appBar: AppBar(
          title: Text('RSM',style: TextStyle(color: Colors.black),),
        ),
        drawer: RPKDrawer(),*/

        /*body: ListView.builder(
          itemBuilder: (BuildContext context, int index) =>
              EntryItem(data[index]),
          itemCount: data.length,
        ),*/
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  // _header(),
                  //RpkSessionA(),
                  Container(
                    color: primaryColor,
                    padding:
                        EdgeInsets.symmetric(horizontal: 50.w, vertical: 40.h),
                    child: Column(
                      children: [
                        Table(
                          children: [
                            TableRow(
                              children: [
                                Text('Tarikh'),
                                Text(widget.testDate!.substring(0, 10),
                                    style: textStyle),
                              ],
                            ),
                            TableRow(
                              children: [
                                Text('Nama'),
                                Text(widget.rpkName!, style: textStyle),
                              ],
                            ),
                            TableRow(
                              children: [
                                Text('NRIC'),
                                Text(widget.nric!, style: textStyle),
                              ],
                            ),
                            TableRow(
                              children: [
                                Text('No Giliran'),
                                Text(widget.qNo!,
                                    style: TextStyle(
                                        fontSize: 80.sp,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 1, top: 2),
                    child: FutureBuilder(
                      future: ruleFuture,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data.isSuccess) {
                            return SingleChildScrollView(
                              child: ExpandableNotifier(
                                child: Card(
                                  clipBehavior: Clip.antiAlias,
                                  child: Column(
                                    children: <Widget>[
                                      ScrollOnExpand(
                                        scrollOnExpand: true,
                                        scrollOnCollapse: false,
                                        child: ExpandablePanel(
                                          theme: const ExpandableThemeData(
                                            headerAlignment:
                                                ExpandablePanelHeaderAlignment
                                                    .center,
                                            tapBodyToCollapse: true,
                                          ),
                                          header: Container(
                                            color: ColorConstant.primaryColor,
                                            child: Padding(
                                              padding: EdgeInsets.all(10),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "SKIM",
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 25,
                                                              top: 5),
                                                      child: Wrap(
                                                        children: <Widget>[
                                                          Transform.scale(
                                                            scale: 1.3,
                                                            child: Checkbox(
                                                              checkColor:
                                                                  Colors.black,
                                                              activeColor:
                                                                  Colors.white,
                                                              value: checkAll,
                                                              onChanged: (bool?
                                                                  value) {
                                                                if (value!) {
                                                                  setState(() {
                                                                    checkAll =
                                                                        true;
                                                                    for (var element
                                                                        in ruleList) {
                                                                      element.isCheck =
                                                                          true;
                                                                    }
                                                                  });
                                                                } else {
                                                                  checkAll =
                                                                      false;
                                                                  setState(() {
                                                                    for (var element
                                                                        in ruleList) {
                                                                      element.isCheck =
                                                                          false;
                                                                    }
                                                                  });
                                                                }
                                                                var a = ruleList
                                                                    .where((c) =>
                                                                        c.isCheck ==
                                                                        true)
                                                                    .length;
                                                                print(a);
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 30,
                                                              top: 5),
                                                      child: Container(
                                                        child: Text(
                                                          '${ruleList.where((c) => c.isCheck == true).length}/24',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          collapsed: SizedBox(),
                                          expanded: ListView(
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            children: [
                                              for (int i = 0;
                                                  i < ruleList.length;
                                                  i++)
                                                Container(
                                                  decoration: BoxDecoration(
                                                    border: Border(
                                                      bottom: BorderSide(
                                                        color: Colors
                                                            .grey.shade400,
                                                        width: 1,
                                                      ),
                                                    ),
                                                  ),
                                                  child: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        if (snapshot
                                                                    .data
                                                                    .data[i]
                                                                    .isCheck ==
                                                                null ||
                                                            snapshot
                                                                    .data
                                                                    .data[i]
                                                                    .isCheck ==
                                                                false) {
                                                          snapshot.data.data[i]
                                                              .isCheck = true;
                                                        } else {
                                                          snapshot.data.data[i]
                                                              .isCheck = false;
                                                        }
                                                      });
                                                    },
                                                    child: Table(
                                                      columnWidths: {
                                                        0: FlexColumnWidth(
                                                            10.0),
                                                        1: FlexColumnWidth(1.5),
                                                      },
                                                      children: [
                                                        TableRow(children: [
                                                          Container(
                                                            child: Align(
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: 10,
                                                                      bottom:
                                                                          10,
                                                                      top: 10),
                                                                  child: Text(
                                                                      '${i + 1}. ${snapshot.data.data[i].ruleDesc}'),
                                                                )),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    right: 12,
                                                                    top: 8),
                                                            child: Container(
                                                              decoration: BoxDecoration(
                                                                  border: Border.all(
                                                                      color: Colors
                                                                          .black)),
                                                              child: Center(
                                                                  child:
                                                                      Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        2.0),
                                                                child: Text(snapshot.data.data[i].isCheck ==
                                                                            null ||
                                                                        snapshot.data.data[i].isCheck ==
                                                                            false
                                                                    ? '0'
                                                                    : '1'),
                                                              )),
                                                            ),
                                                          ),
                                                        ]),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                          builder: (_, collapsed, expanded) {
                                            return Expandable(
                                              collapsed: collapsed,
                                              expanded: expanded,
                                              theme: const ExpandableThemeData(
                                                  crossFadePoint: 0),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.error_outline,
                                    color: Colors.red,
                                    size: 60,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 16),
                                    child:
                                        Text('Error: ${snapshot.data.message}'),
                                  ),
                                ],
                              ),
                            );
                          }
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.error_outline,
                                  color: Colors.red,
                                  size: 60,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 16),
                                  child: Text('Error: ${snapshot.error}'),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ),
                  /* Padding(
                  padding: const EdgeInsets.only(bottom: 1),
                  child: SessionB(notifyParent: refresh),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 1),
                  child: SessionC(notifyParent: refresh),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 1),
                  child: SessionD(notifyParent: refresh),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 1),
                  child: SessionE(notifyParent: refresh),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 1),
                  child: SessionF(notifyParent: refresh),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 1),
                  child: SessionG(notifyParent: refresh),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 1),
                  child: SessionH(notifyParent: refresh),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 1),
                  child: SessionI(notifyParent: refresh),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 1),
                  child: SessionJ(notifyParent: refresh),
                ), */

                  SizedBox(
                    height: ScreenUtil().setHeight(100),
                  ),

                  Table(
                    border: TableBorder.all(color: Colors.grey),
                    children: [
                      TableRow(children: [
                        Center(
                            child: Text(
                                AppLocalizations.of(context)!
                                    .translate('session_lbl'),
                                style: TextStyle(color: Colors.black))),
                        Center(
                            child: Text(
                                AppLocalizations.of(context)!
                                    .translate('normal_mistake_mark'),
                                style: TextStyle(color: Colors.black))),
                        Center(
                            child: Text(
                                AppLocalizations.of(context)!
                                    .translate('mandatory_mistake_mark'),
                                style: TextStyle(color: Colors.black))),
                      ]),
                      TableRow(children: [
                        Center(
                            child: Text('R',
                                style: TextStyle(color: Colors.black))),
                        Center(
                            child: RichText(
                                text: TextSpan(
                                    text: ruleList
                                        .where((c) => c.isCheck == true)
                                        .length
                                        .toString(),
                                    style: TextStyle(color: Colors.black),
                                    children: <TextSpan>[
                              TextSpan(
                                  text: '/24',
                                  style: TextStyle(color: Colors.black)),
                            ]))),
                        Center(
                            child: Text('-',
                                style: TextStyle(color: Colors.black))),
                      ]),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(100),
                  ),
                  Container(
                    child: ElevatedButton(
                      onPressed: updateRpkJpjTestResult,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: ColorConstant.primaryColor,
                        backgroundColor: Color(0xffdd0e0e),
                        minimumSize: Size(88, 36),
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                        ),
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.translate('submit_btn'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(300),
                  ),
                ],
              ),
            ),
            LoadingModel(
              isVisible: isVisible,
              color: primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
