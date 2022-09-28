import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:jpj_qto/common_library/services/model/etesting_model.dart';
import 'package:jpj_qto/common_library/services/repository/etesting_repository.dart';
import 'package:jpj_qto/router.gr.dart';

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
  bool skimCheck = false;
  bool litarCheck = false;
  bool sistemCheck = false;
  bool skimCheckSelectAll = false;
  bool litarCheckSelectAll = false;
  bool sistemCheckSelectAll = false;

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
          status: AppLocalizations.of(context)!.translate('updating'));

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
        if (element.mandatory == 'true' &&
            (element.isCheck == null || element.isCheck == false)) {
          isUntickMandatory = true;
        }
        checklistSkimArr.add(JpjCheckListJson(
          checkCode: element.checkCode,
          status: (element.isCheck != null && element.isCheck) ? '1' : '0',
          remark: '',
        ));
      }

      EasyLoading.show(
          status: AppLocalizations.of(context)!.translate('updating'));

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
        if (mounted) {
          setState(() {
            skimCheck = true;
          });
        }

        if (isUntickMandatory) {
          await showDialog(
            context: context,
            barrierDismissible: true, // user must tap button!
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('JPJ QTO APP'),
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
      if (element.mandatory == 'true' &&
          (element.isCheck == null || element.isCheck == false)) {
        isUntickMandatory = true;
      }
      checklistLitarArr.add(JpjCheckListJson(
        checkCode: element.checkCode,
        status: (element.isCheck != null && element.isCheck) ? '1' : '0',
        remark: '',
      ));
    }

    EasyLoading.show(
        status: AppLocalizations.of(context)!.translate('updating'));

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
              title: const Text('JPJ QTO APP'),
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
      if (element.mandatory == 'true' &&
          (element.isCheck == null || element.isCheck == false)) {
        isUntickMandatory = true;
      }
      checklistSystemArr.add(JpjCheckListJson(
        checkCode: element.checkCode,
        status: (element.isCheck != null && element.isCheck) ? '1' : '0',
        remark: '',
      ));
    }

    EasyLoading.show(
        status: AppLocalizations.of(context)!.translate('updating'));

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
              title: const Text('JPJ QTO APP'),
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
        backgroundColor: ColorConstant.primaryColor,
        title: Text(AppLocalizations.of(context)!.translate('checklist')),
        actions: [
          IconButton(
            onPressed: () {
              context.router.push(ChecklistResultRoute());
            },
            icon: Icon(
              Icons.history,
            ),
          ),
          // IconButton(
          //   onPressed: () {
          //     updateJpjCheckList();
          //   },
          //   icon: Icon(
          //     Icons.save,
          //   ),
          // ),
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
                  children: <Widget>[
                    SizedBox(
                      height: 16.0,
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
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "SKIM",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Spacer(),
                                        Builder(
                                          builder: (context) {
                                            var controller =
                                                ExpandableController.of(context,
                                                    required: true)!;
                                            return skimCheck
                                                ? ElevatedButton.icon(
                                                    onPressed: () {
                                                      if (!controller
                                                          .expanded) {
                                                        controller.toggle();
                                                      }
                                                      updateJpjCheckListSkimA();
                                                    },
                                                    icon: Icon(
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
                                                      updateJpjCheckListSkimA();
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
                                  collapsed: SizedBox(),
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
                                                      margin:
                                                          EdgeInsets.symmetric(
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
                                                            ? Icon(Icons.check)
                                                            : SizedBox(),
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
                                      CheckboxListTile(
                                        title: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(AppLocalizations.of(context)!
                                                .translate('select_all')),
                                          ],
                                        ),
                                        value: skimCheckSelectAll,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            skimCheckSelectAll = value ?? false;
                                            for (var element
                                                in checklist[0].data) {
                                              element.isCheck = value;
                                            }
                                          });
                                        },
                                      ),
                                      Divider(
                                        height: 1,
                                      ),
                                      ListView.separated(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: checklist[0].data.length,
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return Divider(
                                            height: 1,
                                          );
                                        },
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return CheckboxListTile(
                                            title: Text(
                                              checklist[0]
                                                  .data[index]
                                                  .checkDesc,
                                              style: TextStyle(
                                                fontWeight: checklist[0]
                                                            .data[index]
                                                            .mandatory ==
                                                        'false'
                                                    ? FontWeight.normal
                                                    : FontWeight.bold,
                                              ),
                                            ),
                                            value: checklist[0]
                                                    .data[index]
                                                    .isCheck ??
                                                false,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                checklist[0]
                                                    .data[index]
                                                    .isCheck = value;
                                                int checkCount = checklist[0]
                                                    .data
                                                    .where((i) =>
                                                        i.isCheck != null &&
                                                        i.isCheck)
                                                    .toList()
                                                    .length;
                                                skimCheckSelectAll =
                                                    checkCount ==
                                                        checklist[0]
                                                            .data
                                                            .length;
                                              });
                                            },
                                          );
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
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "LITAR",
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
                                        Spacer(),
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
                                                    icon: Icon(
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
                                  collapsed: SizedBox(),
                                  expanded: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      CheckboxListTile(
                                        title: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(AppLocalizations.of(context)!
                                                .translate('select_all')),
                                          ],
                                        ),
                                        value: litarCheckSelectAll,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            litarCheckSelectAll =
                                                value ?? false;
                                            for (var element
                                                in checklist[1].data) {
                                              element.isCheck = value;
                                            }
                                          });
                                        },
                                      ),
                                      ListView.separated(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: checklist[1].data.length,
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return Divider(
                                            height: 1,
                                          );
                                        },
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return CheckboxListTile(
                                            title: Text(
                                              checklist[1]
                                                  .data[index]
                                                  .checkDesc,
                                              style: TextStyle(
                                                fontWeight: checklist[1]
                                                            .data[index]
                                                            .mandatory ==
                                                        'false'
                                                    ? FontWeight.normal
                                                    : FontWeight.bold,
                                              ),
                                            ),
                                            value: checklist[1]
                                                    .data[index]
                                                    .isCheck ??
                                                false,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                checklist[1]
                                                    .data[index]
                                                    .isCheck = value;

                                                int checkCount = checklist[1]
                                                    .data
                                                    .where((i) =>
                                                        i.isCheck != null &&
                                                        i.isCheck)
                                                    .toList()
                                                    .length;
                                                litarCheckSelectAll =
                                                    checkCount ==
                                                        checklist[1]
                                                            .data
                                                            .length;
                                              });
                                            },
                                          );
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
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Bilik kawalan",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Spacer(),
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
                                                    icon: Icon(
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
                                  collapsed: SizedBox(),
                                  expanded: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      CheckboxListTile(
                                        title: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(AppLocalizations.of(context)!
                                                .translate('select_all')),
                                          ],
                                        ),
                                        value: sistemCheckSelectAll,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            sistemCheckSelectAll =
                                                value ?? false;
                                            for (var element
                                                in checklist[2].data) {
                                              element.isCheck = value;
                                            }
                                          });
                                        },
                                      ),
                                      ListView.separated(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: checklist[2].data.length,
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return Divider(
                                            height: 1,
                                          );
                                        },
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return CheckboxListTile(
                                            title: Text(
                                              checklist[2]
                                                  .data[index]
                                                  .checkDesc,
                                              style: TextStyle(
                                                fontWeight: checklist[2]
                                                            .data[index]
                                                            .mandatory ==
                                                        'false'
                                                    ? FontWeight.normal
                                                    : FontWeight.bold,
                                              ),
                                            ),
                                            value: checklist[2]
                                                    .data[index]
                                                    .isCheck ??
                                                false,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                checklist[2]
                                                    .data[index]
                                                    .isCheck = value;

                                                int checkCount = checklist[2]
                                                    .data
                                                    .where((i) =>
                                                        i.isCheck != null &&
                                                        i.isCheck)
                                                    .toList()
                                                    .length;
                                                sistemCheckSelectAll =
                                                    checkCount ==
                                                        checklist[2]
                                                            .data
                                                            .length;
                                              });
                                            },
                                          );
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
                    SizedBox(
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
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
