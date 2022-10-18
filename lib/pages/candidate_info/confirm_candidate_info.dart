import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:edriving_qti_app/common_library/services/repository/epandu_repository.dart';
import 'package:edriving_qti_app/common_library/utils/app_localizations.dart';
import 'package:edriving_qti_app/common_library/utils/custom_button.dart';
import 'package:edriving_qti_app/common_library/utils/custom_dialog.dart';
import 'package:edriving_qti_app/common_library/utils/loading_model.dart';
import 'package:edriving_qti_app/utils/constants.dart';
import 'package:edriving_qti_app/utils/local_storage.dart';

import '../../router.gr.dart';

class ConfirmCandidateInfo extends StatefulWidget {
  final String? part3Type;
  final String? nric;
  final String? candidateName;
  final String? qNo;
  final String? groupId;
  final String? testDate;
  final String? testCode;
  final String icPhoto;

  ConfirmCandidateInfo({
    required this.part3Type,
    required this.nric,
    required this.candidateName,
    required this.qNo,
    required this.groupId,
    required this.testDate,
    required this.testCode,
    required this.icPhoto,
  });

  @override
  _ConfirmCandidateInfoState createState() => _ConfirmCandidateInfoState();
}

class _ConfirmCandidateInfoState extends State<ConfirmCandidateInfo> {
  final localStorage = LocalStorage();
  final epanduRepo = EpanduRepo();
  final customDialog = CustomDialog();
  bool isLoading = false;
  String? vehNo = '';

  /* @override
  void initState() {
    super.initState();

    callPart3JpjTest();
  }

  Future<void> callPart3JpjTest() async {
    setState(() {
      isLoading = true;
    });

    vehNo = await localStorage.getPlateNo();

    // context.router.push(Routes.rpkPartIII,
    //     arguments: RpkPartIIIArguments(
    //       qNo: widget.qNo,
    //       nric: widget.nric,
    //       name: widget.name,
    //       testDate: widget.testDate,
    //       groupId: widget.groupId,
    //       testCode: widget.testCode,
    //       vehNo: vehNo,
    //     ));

    // context.router.push(Routes.jrPartIII,
    //     arguments: JrPartIIIArguments(
    //       qNo: widget.qNo,
    //       nric: widget.nric,
    //       name: widget.name,
    //       testDate: widget.testDate,
    //       groupId: widget.groupId,
    //       testCode: widget.testCode,
    //       vehNo: vehNo,
    //     ));

    var result = await epanduRepo.callPart3JpjTest(
      vehNo: vehNo,
      part3Type: widget.part3Type,
      groupId: widget.groupId,
      testCode: widget.testCode,
      icNo: widget.nric,
    );

    if (result.isSuccess) {
    } else {
      customDialog.show(
        context: context,
        content: result.message,
        type: DialogType.WARNING,
      );
    }

    setState(() {
      isLoading = false;
    });
  } */

  Future<bool> _onWillPop() async {
    bool result = await showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.translate('warning_title')),
          content: SingleChildScrollView(
              child: Text(AppLocalizations.of(context)!
                  .translate('confirm_exit_desc'))),
          actions: <Widget>[
            TextButton(
              child: Text(AppLocalizations.of(context)!.translate('yes_lbl')),
              onPressed: () async {
                await context.router.pop(true);
              },
            ),
            TextButton(
              child: Text(AppLocalizations.of(context)!.translate('no_lbl')),
              onPressed: () {
                context.router.pop(false);
              },
            ),
          ],
        );
      },
    );

    if (result) {
      EasyLoading.show(
        maskType: EasyLoadingMaskType.black,
      );
      if (widget.part3Type == 'RPK') {
        await cancelCallPart3RpkTest();
      } else {
        await cancelCallPart3JpjTest();
      }
      await EasyLoading.dismiss();
    }

    return result;
    // await CustomDialog().show(
    //   context: context,
    //   title: Text(AppLocalizations.of(context)!.translate('warning_title')),
    //   content: AppLocalizations.of(context)!.translate('confirm_exit_desc'),
    //   customActions: <Widget>[
    //     TextButton(
    //       child: Text(AppLocalizations.of(context)!.translate('yes_lbl')),
    //       onPressed: () {
    //         context.router.pop(true);
    //         context.router.pop(true);
    //         // cancelCallPart3JpjTest();
    //       },
    //     ),
    //     TextButton(
    //       child: Text(AppLocalizations.of(context)!.translate('no_lbl')),
    //       onPressed: () {
    //         context.router.pop(false);
    //       },
    //     ),
    //   ],
    //   type: DialogType.GENERAL,
    // );
  }

  Future<void> cancelCallPart3JpjTest() async {
    setState(() {
      isLoading = true;
    });

    var result = await epanduRepo.cancelCallPart3JpjTest(
      part3Type: widget.part3Type,
      groupId: widget.groupId,
      testCode: widget.testCode,
      icNo: widget.nric,
    );

    if (result.isSuccess) {
      // context.router.pop();
    } else {
      if (mounted) {
        customDialog.show(
          context: context,
          content: result.message,
          type: DialogType.WARNING,
        );
      }
    }

    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> cancelCallPart3RpkTest() async {
    setState(() {
      isLoading = true;
    });

    var result = await epanduRepo.cancelCallRpkJpjTest(
      part3Type: widget.part3Type,
      groupId: widget.groupId,
      testCode: widget.testCode,
      icNo: widget.nric,
    );

    if (result.isSuccess) {
      // context.router.pop();
    } else {
      if (mounted) {
        customDialog.show(
          context: context,
          content: result.message,
          type: DialogType.WARNING,
        );
      }
    }

    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  startTest() async {
    vehNo = await localStorage.getPlateNo();

    if (widget.part3Type == 'RPK') {
      context.router.push(
        RpkPartIII(
          qNo: widget.qNo,
          nric: widget.nric,
          rpkName: widget.candidateName,
          testDate: widget.testDate,
          groupId: widget.groupId,
          testCode: widget.testCode,
          vehNo: vehNo,
          skipUpdateRpkJpjTestStart: false,
        ),
      );
    } else {
      context.router.push(
        JrPartIII(
          qNo: widget.qNo,
          nric: widget.nric,
          jrName: widget.candidateName,
          testDate: widget.testDate,
          groupId: widget.groupId,
          testCode: widget.testCode,
          vehNo: vehNo,
          skipUpdateJrJpjTestStart: false,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Maklumat Calon'),
          actions: [
            IconButton(
              onPressed: () {
                customDialog.show(
                  context: context,
                  content: AppLocalizations.of(context)!
                      .translate('confirm_candidate_tooltip'),
                  type: DialogType.INFO,
                );
              },
              icon: const Icon(Icons.info_outline),
              tooltip: AppLocalizations.of(context)!
                  .translate('confirm_candidate_tooltip'),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 50.w),
                child: Column(
                  children: [
                    SizedBox(height: 30.h),
                    Text('Q-NO', style: TextStyle(fontSize: 100.sp)),
                    widget.icPhoto == ''
                        ? const SizedBox()
                        : CachedNetworkImage(
                            imageUrl: widget.icPhoto,
                            height: 200,
                          ),
                    Text(
                      widget.qNo!,
                      style: TextStyle(fontSize: 200.sp),
                    ),
                    Text(widget.nric!, style: TextStyle(fontSize: 80.sp)),
                    SizedBox(height: 20.h),
                    Text(widget.candidateName!,
                        style: TextStyle(fontSize: 80.sp)),
                    SizedBox(height: 30.h),
                    Text(
                      widget.groupId!,
                      style: TextStyle(fontSize: 250.sp),
                    ),
                    SizedBox(height: 30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(widget.testDate!.substring(0, 10),
                            style: TextStyle(fontSize: 60.sp)),
                        Text(widget.testDate!.substring(11, 16),
                            style: TextStyle(fontSize: 60.sp)),
                      ],
                    ),
                    SizedBox(height: 50.h),
                    Text(widget.testCode!, style: TextStyle(fontSize: 80.sp)),
                    SizedBox(height: 50.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomButton(
                          onPressed: () {
                            context.router.pop();
                          },
                          buttonColor: const Color(0xffdd0e0e),
                          title: AppLocalizations.of(context)!
                              .translate('cancel_btn'),
                        ),
                        CustomButton(
                          onPressed: startTest,
                          buttonColor: const Color(0xffdd0e0e),
                          title: AppLocalizations.of(context)!
                              .translate('start_test'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              LoadingModel(
                isVisible: isLoading,
                color: ColorConstant.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
