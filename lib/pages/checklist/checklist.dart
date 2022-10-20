import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:edriving_qti_app/common_library/services/model/etesting_model.dart';
import 'package:edriving_qti_app/common_library/services/repository/etesting_repository.dart';
import 'package:edriving_qti_app/router.gr.dart';

import '../../common_library/services/model/checklist_model.dart';
import '../../common_library/services/repository/checklist_repository.dart';
import '../../common_library/utils/app_localizations.dart';
import '../../common_library/utils/custom_dialog.dart';
import '../../utils/constants.dart';

class CheckListPage extends StatefulWidget {
  CheckListPage({Key? key}) : super(key: key);

  @override
  State<CheckListPage> createState() => _CheckListPageState();
}

class _CheckListPageState extends State<CheckListPage> {
  final checklistRepo = ChecklistRepo();
  final etestingRepo = EtestingRepo();
  Future? _checklistFuture;
  var checklist = [];
  List<JpjCheckListJson> checklistSkimArr = [];
  List<JpjCheckListJson> checklistLitarArr = [];
  List<JpjCheckListJson> checklistSystemArr = [];
  bool litarCheck = false;
  bool sistemCheck = false;

  final _formKey = GlobalKey<FormBuilderState>();
  final customDialog = CustomDialog();

  List<MysikapVehicle> vehicleArr = [];

  ExpandableController expandableControllerSkim = ExpandableController();

  Future getCheclkListSkim() async {
    return await checklistRepo.getCheckList(checkType: 'SKIM');
  }

  Future getCheclkListLitar() async {
    return await checklistRepo.getCheckList(checkType: 'LITAR');
  }

  Future getCheclkListSystem() async {
    return await checklistRepo.getCheckList(checkType: 'SISTEM');
  }

  Future getMySikapVehicleListByStatus() async {
    var result = await etestingRepo.getMySikapVehicleListByStatus(status: '');
    setState(() {
      vehicleArr = result.data;
    });

    return result;
  }

  // Future<List<MysikapVehicle>> getMySikapVehicleListByStatus() async {
  //   var result = await etestingRepo.getMySikapVehicleListByStatus(status: '');
  //   if (result.isSuccess) {
  //     List<MysikapVehicle> a = result.data
  //         .map((item) => MySikapVehicleListResponse.fromJson(result.data))
  //         .toList();

  //     return a;
  //   }
  //   return [];
  // }

  Future updateJpjCheckListSkim(requestSkim) async {
    var a = checklistRepo.updateJpjCheckListSkim(
        checkListJson: jsonEncode(requestSkim.toJson()),
        plateNo: _formKey.currentState?.fields['plateNo']!.value);
    return a;
  }

  Future updateJpjCheckListLitar(requestLitar) async {
    var a = checklistRepo.updateJpjCheckListLitar(
      checkListJson: jsonEncode(requestLitar.toJson()),
    );
    return a;
  }

  Future updateJpjCheckListSistem(requestSystem) async {
    var a = checklistRepo.updateJpjCheckListSistem(
      checkListJson: jsonEncode(requestSystem.toJson()),
    );
    return a;
  }

  void updateJpjCheckList() async {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      checklistSkimArr = [];
      checklistLitarArr = [];
      checklistSystemArr = [];

      for (var element in checklist[0].data) {
        if (element.mandatory == 'true' &&
            (element.isCheck == null || element.isCheck == false)) {
          customDialog.show(
            context: context,
            content: AppLocalizations.of(context)!
                .translate('select_all_mandatory_field'),
            type: DialogType.INFO,
          );
          return;
        }
        checklistSkimArr.add(JpjCheckListJson(
          checkCode: element.checkCode,
          status: (element.isCheck != null && element.isCheck) ? '1' : '0',
          remark: '',
        ));
      }

      for (var element in checklist[1].data) {
        if (element.mandatory == 'true' &&
            (element.isCheck == null || element.isCheck == false)) {
          customDialog.show(
            context: context,
            content: AppLocalizations.of(context)!
                .translate('select_all_mandatory_field'),
            type: DialogType.INFO,
          );
          return;
        }
        checklistLitarArr.add(JpjCheckListJson(
          checkCode: element.checkCode,
          status: (element.isCheck != null && element.isCheck) ? '1' : '0',
          remark: '',
        ));
      }

      for (var element in checklist[2].data) {
        if (element.mandatory == 'true' &&
            (element.isCheck == null || element.isCheck == false)) {
          customDialog.show(
            context: context,
            content: AppLocalizations.of(context)!
                .translate('select_all_mandatory_field'),
            type: DialogType.INFO,
          );
          return;
        }
        checklistSystemArr.add(JpjCheckListJson(
          checkCode: element.checkCode,
          status: (element.isCheck != null && element.isCheck) ? '1' : '0',
          remark: '',
        ));
      }

      EasyLoading.show(
        status: AppLocalizations.of(context)!.translate('updating'),
        maskType: EasyLoadingMaskType.black,
      );

      JpjCheckListRequest requestSkim = JpjCheckListRequest(
        jpjCheckList: checklistSkimArr,
      );

      JpjCheckListRequest requestLitar = JpjCheckListRequest(
        jpjCheckList: checklistLitarArr,
      );

      JpjCheckListRequest requestSystem = JpjCheckListRequest(
        jpjCheckList: checklistSystemArr,
      );

      var updateFuture = Future.wait([
        updateJpjCheckListSkim(requestSkim),
        updateJpjCheckListLitar(requestLitar),
        updateJpjCheckListSistem(requestSystem),
      ]);

      try {
        var updateResult = await updateFuture;
        for (var element in updateResult) {
          if (!element.isSuccess) {
            await EasyLoading.dismiss();
            const snackBar = SnackBar(
              behavior: SnackBarBehavior.floating,
              content: Text('Something went wrong'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            return;
          }
        }
        await EasyLoading.dismiss();
        customDialog.show(
            context: context,
            content: AppLocalizations.of(context)!
                .translate('checklist_updated_successfully'),
            type: DialogType.SUCCESS,
            barrierDismissable: false,
            onPressed: () async {
              context.router
                  .popUntil((route) => route.settings.name == 'HomeSelect');
            });
      } catch (e) {
        await EasyLoading.dismiss();
      }
    }
  }

  void updateJpjCheckListSkimA() async {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      checklistSkimArr = [];
      bool isUntickMandatory = false;

      for (var element in checklist[0].data) {
        if (element.mandatory == 'true' && element.isCheck == true) {
          isUntickMandatory = true;
        }
        checklistSkimArr.add(JpjCheckListJson(
          checkCode: element.checkCode,
          status: (element.isCheck != null && element.isCheck) ? '0' : '1',
          remark: '',
        ));
      }

      EasyLoading.show(
        status: AppLocalizations.of(context)!.translate('updating'),
        maskType: EasyLoadingMaskType.black,
      );

      JpjCheckListRequest requestSkim = JpjCheckListRequest(
        jpjCheckList: checklistSkimArr,
      );

      var updateFuture = await checklistRepo.updateJpjCheckListSkim(
          checkListJson: jsonEncode(requestSkim.toJson()),
          plateNo: _formKey.currentState?.fields['plateNo']!.value);

      try {
        if (!updateFuture.isSuccess) {
          await EasyLoading.dismiss();
          const snackBar = SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text('Something went wrong'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          return;
        }

        EasyLoading.dismiss();

        if (isUntickMandatory) {
          await showDialog(
            context: context,
            barrierDismissible: true, // user must tap button!
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('eDriving QTI App'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text(
                          AppLocalizations.of(context)!.translate('fail_skim')),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text(
                      AppLocalizations.of(context)!.translate('ok_btn'),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        }

        if (expandableControllerSkim.expanded) {
          expandableControllerSkim.toggle();
        }

        setState(() {
          for (var element in checklist[0].data) {
            element.isCheck = false;
          }
        });

        customDialog.show(
            context: context,
            content: AppLocalizations.of(context)!
                .translate('checklist_updated_successfully'),
            type: DialogType.SUCCESS,
            barrierDismissable: false,
            onPressed: () async {
              await context.router.pop();
              // context.router
              //     .popUntil((route) => route.settings.name == 'HomeSelect');
            });
      } catch (e) {
        await EasyLoading.dismiss();
      }
    }
  }

  void updateJpjCheckListLitarA() async {
    checklistLitarArr = [];
    bool isUntickMandatory = false;

    for (var element in checklist[1].data) {
      if (element.mandatory == 'true' && element.isCheck == true) {
        isUntickMandatory = true;
      }
      checklistLitarArr.add(JpjCheckListJson(
        checkCode: element.checkCode,
        status: (element.isCheck != null && element.isCheck) ? '0' : '1',
        remark: '',
      ));
    }

    EasyLoading.show(
      status: AppLocalizations.of(context)!.translate('updating'),
      maskType: EasyLoadingMaskType.black,
    );

    JpjCheckListRequest requestLitar = JpjCheckListRequest(
      jpjCheckList: checklistLitarArr,
    );

    try {
      var updateResult = await checklistRepo.updateJpjCheckListLitar(
        checkListJson: jsonEncode(requestLitar.toJson()),
      );
      EasyLoading.dismiss();
      if (!updateResult.isSuccess) {
        const snackBar = SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text('Something went wrong'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return;
      }
      if (mounted) {
        setState(() {
          litarCheck = true;
        });
      }

      if (isUntickMandatory) {
        await showDialog(
          context: context,
          barrierDismissible: true, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('eDriving QTI App'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(AppLocalizations.of(context)!.translate('fail_litar')),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text(
                    AppLocalizations.of(context)!.translate('ok_btn'),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }

      customDialog.show(
          context: context,
          content: AppLocalizations.of(context)!
              .translate('checklist_updated_successfully'),
          type: DialogType.SUCCESS,
          barrierDismissable: false,
          onPressed: () async {
            await context.router.pop();
          });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  void updateJpjCheckListSistemA() async {
    checklistSystemArr = [];
    bool isUntickMandatory = false;

    for (var element in checklist[2].data) {
      if (element.mandatory == 'true' && element.isCheck == true) {
        isUntickMandatory = true;
      }
      checklistSystemArr.add(JpjCheckListJson(
        checkCode: element.checkCode,
        status: (element.isCheck != null && element.isCheck) ? '0' : '1',
        remark: '',
      ));
    }

    EasyLoading.show(
      status: AppLocalizations.of(context)!.translate('updating'),
      maskType: EasyLoadingMaskType.black,
    );

    JpjCheckListRequest requestSystem = JpjCheckListRequest(
      jpjCheckList: checklistSystemArr,
    );

    try {
      var updateResult = await checklistRepo.updateJpjCheckListSistem(
        checkListJson: jsonEncode(requestSystem.toJson()),
      );

      if (!updateResult.isSuccess) {
        await EasyLoading.dismiss();
        const snackBar = SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text('Something went wrong'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return;
      }
      EasyLoading.dismiss();
      if (mounted) {
        setState(() {
          sistemCheck = true;
        });
      }

      if (isUntickMandatory) {
        await showDialog(
          context: context,
          barrierDismissible: true, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('eDriving QTI App'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(
                        AppLocalizations.of(context)!.translate('fail_sistem')),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text(
                    AppLocalizations.of(context)!.translate('ok_btn'),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }

      customDialog.show(
          context: context,
          content: AppLocalizations.of(context)!
              .translate('checklist_updated_successfully'),
          type: DialogType.SUCCESS,
          barrierDismissable: false,
          onPressed: () async {
            await context.router.pop();
          });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> storeChecklist() async {
    checklist = await _checklistFuture;
    for (var element in checklist[0].data) {
      element.isCheck = false;
    }
    for (var element in checklist[1].data) {
      element.isCheck = false;
    }
    for (var element in checklist[2].data) {
      element.isCheck = false;
    }
  }

  @override
  void initState() {
    super.initState();
    _checklistFuture = Future.wait([
      getCheclkListSkim(),
      getCheclkListLitar(),
      getCheclkListSystem(),
      getMySikapVehicleListByStatus(),
    ]);
    storeChecklist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.translate('checklist')),
        actions: [
          IconButton(
            onPressed: () {
              context.router.push(ChecklistResultRoute());
            },
            icon: const Icon(
              Icons.history,
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: _checklistFuture,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ExpandableTheme(
              data: const ExpandableThemeData(
                iconColor: Colors.blue,
                useInkWell: true,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Tandakan ✖️ Untuk Demerit',
                        style: TextStyle(
                          fontSize: 20,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    ExpandableNotifier(
                      controller: expandableControllerSkim,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                        ),
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
                                        ExpandablePanelHeaderAlignment.center,
                                    tapBodyToCollapse: false,
                                  ),
                                  header: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: Row(
                                      children: [
                                        const Text(
                                          "1. Pemeriksaan Kenderaan Ujian",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Spacer(),
                                        Builder(
                                          builder: (context) {
                                            var controller =
                                                ExpandableController.of(context,
                                                    required: true)!;
                                            return ElevatedButton(
                                              onPressed: () {
                                                if (!controller.expanded) {
                                                  controller.toggle();
                                                }
                                                updateJpjCheckListSkimA();
                                              },
                                              child: Text(
                                                  AppLocalizations.of(context)!
                                                      .translate('update')),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  collapsed: const SizedBox(),
                                  expanded: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: FormBuilder(
                                          key: _formKey,
                                          child: FormBuilderField(
                                            name: 'plateNo',
                                            builder: (field) {
                                              return DropdownSearch<
                                                  MysikapVehicle>(
                                                // asyncItems: (filter) =>
                                                //     getMySikapVehicleListByStatus(),
                                                items: vehicleArr,
                                                dropdownDecoratorProps:
                                                    DropDownDecoratorProps(
                                                  dropdownSearchDecoration:
                                                      InputDecoration(
                                                    labelText: AppLocalizations
                                                            .of(context)!
                                                        .translate('plate_no'),
                                                    filled: true,
                                                  ),
                                                ),
                                                validator: (MysikapVehicle? i) {
                                                  if (i == null)
                                                    return field.errorText;
                                                  return null;
                                                },

                                                itemAsString:
                                                    (MysikapVehicle u) =>
                                                        u.plateNo!,
                                                compareFn: (i, s) =>
                                                    i.plateNo == s.plateNo,
                                                onChanged: ((value) {
                                                  field.didChange(
                                                      value!.plateNo);
                                                }),
                                                popupProps:
                                                    PopupPropsMultiSelection
                                                        .modalBottomSheet(
                                                  isFilterOnline: true,
                                                  showSelectedItems: true,
                                                  showSearchBox: true,
                                                  itemBuilder: (context, item,
                                                      isSelected) {
                                                    return Container(
                                                      margin: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 8),
                                                      decoration: !isSelected
                                                          ? null
                                                          : BoxDecoration(
                                                              border: Border.all(
                                                                  color: Theme.of(
                                                                          context)
                                                                      .primaryColor),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                      child: ListTile(
                                                        selected: isSelected,
                                                        title: Text(
                                                            item.plateNo ?? ''),
                                                        subtitle: Text(item
                                                                .groupId
                                                                ?.toString() ??
                                                            ''),
                                                        trailing: item
                                                                    .checked ==
                                                                'true'
                                                            ? const Icon(
                                                                Icons.check)
                                                            : const SizedBox(),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              );
                                            },
                                            validator:
                                                FormBuilderValidators.compose([
                                              FormBuilderValidators.required(),
                                            ]),
                                          ),
                                        ),
                                      ),
                                      ListView.separated(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: checklist[0].data.length,
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return const Divider(
                                            height: 1,
                                          );
                                        },
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return customCheckbox(
                                              '1.${index + 1}',
                                              checklist[0].data[index]);
                                        },
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
                    ),
                    ExpandableNotifier(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                        ),
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
                                        ExpandablePanelHeaderAlignment.center,
                                    tapBodyToCollapse: false,
                                  ),
                                  header: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: Row(
                                      children: [
                                        const Text(
                                          "2. LITAR",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        // SizedBox(
                                        //   width: 8,
                                        // ),
                                        // Text(
                                        //   AppLocalizations.of(context)!
                                        //       .translate(
                                        //           'select_all_mandatory_field'),
                                        //   style: TextStyle(
                                        //     color: Colors.red,
                                        //   ),
                                        // ),
                                        const Spacer(),
                                        Builder(
                                          builder: (context) {
                                            var controller =
                                                ExpandableController.of(context,
                                                    required: true)!;
                                            return litarCheck
                                                ? ElevatedButton.icon(
                                                    onPressed: () {
                                                      if (!controller
                                                          .expanded) {
                                                        controller.toggle();
                                                      }
                                                      updateJpjCheckListLitarA();
                                                    },
                                                    icon: const Icon(
                                                      Icons.check_circle,
                                                    ),
                                                    label: Text(AppLocalizations
                                                            .of(context)!
                                                        .translate('updated')),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          Colors.green,
                                                    ),
                                                  )
                                                : ElevatedButton(
                                                    onPressed: () {
                                                      if (!controller
                                                          .expanded) {
                                                        controller.toggle();
                                                      }
                                                      updateJpjCheckListLitarA();
                                                    },
                                                    child: Text(AppLocalizations
                                                            .of(context)!
                                                        .translate('update')),
                                                  );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  collapsed: const SizedBox(),
                                  expanded: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      ListView.separated(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: checklist[1].data.length,
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return const Divider(
                                            height: 1,
                                          );
                                        },
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return customCheckbox(
                                              '2.${index + 1}',
                                              checklist[1].data[index]);
                                        },
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
                    ),
                    ExpandableNotifier(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                        ),
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
                                        ExpandablePanelHeaderAlignment.center,
                                    tapBodyToCollapse: false,
                                  ),
                                  header: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: Row(
                                      children: [
                                        const Text(
                                          "3. Bilik kawalan",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Spacer(),
                                        Builder(
                                          builder: (context) {
                                            var controller =
                                                ExpandableController.of(context,
                                                    required: true)!;
                                            return sistemCheck
                                                ? ElevatedButton.icon(
                                                    onPressed: () {
                                                      if (!controller
                                                          .expanded) {
                                                        controller.toggle();
                                                      }
                                                      updateJpjCheckListSistemA();
                                                    },
                                                    icon: const Icon(
                                                      Icons.check_circle,
                                                    ),
                                                    label: Text(AppLocalizations
                                                            .of(context)!
                                                        .translate('updated')),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          Colors.green,
                                                    ),
                                                  )
                                                : ElevatedButton(
                                                    onPressed: () {
                                                      if (!controller
                                                          .expanded) {
                                                        controller.toggle();
                                                      }
                                                      updateJpjCheckListSistemA();
                                                    },
                                                    child: Text(AppLocalizations
                                                            .of(context)!
                                                        .translate('update')),
                                                  );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  collapsed: const SizedBox(),
                                  expanded: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      ListView.separated(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: checklist[2].data.length,
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return const Divider(
                                            height: 1,
                                          );
                                        },
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return customCheckbox(
                                              '3.${index + 1}',
                                              checklist[2].data[index]);
                                        },
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
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                  ],
                ),
              ),
            );
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
                  )
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
    );
  }

  Widget customCheckbox(String index, var item) {
    return ListTile(
      onTap: () {
        setState(() {
          item.isCheck = !item.isCheck;
        });
      },
      title: Text(
        '$index. ${item.checkDesc}',
        style: TextStyle(
          fontWeight:
              item.mandatory == 'false' ? FontWeight.normal : FontWeight.bold,
        ),
      ),
      trailing: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: item.isCheck ? Colors.blue : Colors.grey.shade700,
          ),
          color: item.isCheck ? Colors.blue : Colors.white,
        ),
        child: item.isCheck
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
