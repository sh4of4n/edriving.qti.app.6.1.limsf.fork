import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:edriving_qti_app/component/profile.dart';
import 'package:edriving_qti_app/router.gr.dart';
import 'package:expandable/expandable.dart';
import 'package:edriving_qti_app/common_library/services/model/provider_model.dart';
import 'package:edriving_qti_app/common_library/services/repository/epandu_repository.dart';
import 'package:edriving_qti_app/common_library/utils/custom_dialog.dart';
import 'package:edriving_qti_app/common_library/utils/loading_model.dart';
import 'package:edriving_qti_app/utils/constants.dart';
import 'package:edriving_qti_app/utils/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown.dart';
import 'package:flutter_countdown_timer/countdown_controller.dart';
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

  Future? ruleFuture;
  final etestingRepo = EtestingRepo();
  var ruleList = [];
  late CountdownController controller;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    List<Future> futures = [getRule()];
    if (!widget.skipUpdateRpkJpjTestStart) {
      futures.add(updateRpkJpjTestStart());
    }
    Future.wait(futures).then((value) {
      controller.start();
    });
    controller = CountdownController(
      duration: const Duration(
        minutes: 7,
      ),
      onEnd: () async {
        await showDialog(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('JPJ QTO'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: const <Widget>[
                    Text(
                        'Masa Ujian Calon Telah Melebihi 7 Minit. Markah Ujian Calon Akan Dihantar'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Ok'),
                  onPressed: () {
                    context.router.pop();
                  },
                ),
              ],
            );
          },
        );
        setState(() {
          ruleList[ruleList.length - 1].isCheck = false;
        });
        updateRpkJpjTestResult();
      },
    );
    controller.stop();
  }

  String format(int? num) {
    if (num == null) {
      return '00';
    }
    if (num < 10) {
      return '0$num';
    }
    return num.toString();
  }

  Future<void> getRule() async {
    ruleFuture = etestingRepo.getRule(elementCode: 'RPK');
    var result = await ruleFuture;
    setState(() {
      ruleList = result.data;
      for (var element in ruleList) {
        element.isCheck = true;
      }
    });
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
          barrierDismissable: false,
          title: const Icon(Icons.error_outline),
          content: result.message,
          customActions: [
            TextButton(
              onPressed: () => context.router.popUntil(
                ModalRoute.withName('ConfirmCandidateInfo'),
              ),
              child: const Text('Ok'),
            ),
          ],
          type: DialogType.GENERAL);
    }

    setState(() {
      isVisible = false;
    });
  }

  updateRpkJpjTestResult() async {
    controller.stop();
    var a = {
      'Result': [{}]
    };
    for (var element in ruleList) {
      a['Result']![0][element.ruleCode] =
          element.isCheck == null || element.isCheck == false ? '0' : 1;
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
    if (mounted) {
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
            context: context,
            content: result.message,
            type: DialogType.WARNING);
      }
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
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('RPK'),
          automaticallyImplyLeading: false,
          actions: const [
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
                  ProfileWidget(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Nama: ${widget.rpkName ?? ''}',
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
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
                                const Text('Tarikh'),
                                Text(widget.testDate!.substring(0, 10),
                                    style: textStyle),
                              ],
                            ),
                            TableRow(
                              children: [
                                const Text('Nama'),
                                Text(widget.rpkName!, style: textStyle),
                              ],
                            ),
                            TableRow(
                              children: [
                                const Text('NRIC'),
                                Text(widget.nric!, style: textStyle),
                              ],
                            ),
                            TableRow(
                              children: [
                                const Text('No Giliran'),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              'Tandakan ✖️ Untuk Demerit',
                                              style: TextStyle(
                                                fontSize: 20,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                            Countdown(
                                              countdownController: controller,
                                              builder: (_, Duration time) {
                                                return Row(
                                                  children: [
                                                    const Icon(Icons.timer),
                                                    Text(
                                                      '${format(time.inMinutes)}:${format(time.inSeconds % 60)}',
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
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
                                              padding: const EdgeInsets.all(10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Flexible(
                                                    child: Text(
                                                      "1. Pemeriksaan Kenderaan Ujian",
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                          style: const TextStyle(
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
                                          collapsed: const SizedBox(),
                                          expanded: ListView(
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
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
                                                    child: customCheckbox(
                                                      '1.${i + 1}',
                                                      snapshot.data.data[i],
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
                          return const Center(
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
                                style: const TextStyle(color: Colors.black))),
                        Center(
                            child: Text(
                                AppLocalizations.of(context)!
                                    .translate('normal_mistake_mark'),
                                style: const TextStyle(color: Colors.black))),
                        Center(
                            child: Text(
                                AppLocalizations.of(context)!
                                    .translate('mandatory_mistake_mark'),
                                style: const TextStyle(color: Colors.black))),
                      ]),
                      TableRow(children: [
                        const Center(
                            child: Text('R',
                                style: TextStyle(color: Colors.black))),
                        Center(
                            child: RichText(
                                text: TextSpan(
                                    text: ruleList
                                        .where((c) => c.isCheck)
                                        .length
                                        .toString(),
                                    style: const TextStyle(color: Colors.black),
                                    children: const <TextSpan>[
                              TextSpan(
                                  text: '/24',
                                  style: TextStyle(color: Colors.black)),
                            ]))),
                        const Center(
                            child: Text('-',
                                style: TextStyle(color: Colors.black))),
                      ]),
                    ],
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    'Jumlah Markah: ${ruleList.where((c) => c.isCheck).length.toString()}/24',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  ElevatedButton(
                    onPressed: updateRpkJpjTestResult,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: const Size(88, 36),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(2)),
                      ),
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.translate('submit_btn'),
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

  Widget customCheckbox(String index, var item) {
    return ListTile(
      title: Text(
        '$index. ${item.ruleDesc}',
        style: TextStyle(
          fontWeight:
              item.mandatory == 'false' ? FontWeight.normal : FontWeight.bold,
        ),
      ),
      trailing: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: (item.isCheck == null || item.isCheck == false)
                ? Colors.blue
                : Colors.grey.shade700,
          ),
          color: (item.isCheck == null || item.isCheck == false)
              ? Colors.blue
              : Colors.white,
        ),
        child: (item.isCheck == null || item.isCheck == false)
            ? const Icon(
                Icons.close,
                size: 18,
                color: Colors.white,
              )
            : const SizedBox(
                height: 18,
                width: 18,
              ),
      ),
    );
  }
}
