import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:edriving_qti_app/router.gr.dart';

import '../../common_library/services/model/checklist_model.dart';
import '../../common_library/services/repository/checklist_repository.dart';
import '../../common_library/utils/app_localizations.dart';
import '../../common_library/utils/custom_dialog.dart';
import '../../common_library/utils/uppercase_formatter.dart';
import '../../utils/constants.dart';

class CheckListPage extends StatefulWidget {
  CheckListPage({Key? key}) : super(key: key);

  @override
  State<CheckListPage> createState() => _CheckListPageState();
}

class _CheckListPageState extends State<CheckListPage> {
  final checklistRepo = ChecklistRepo();
  Future? _checklistFuture;
  var checklist = [];
  List<JpjCheckListJson> checklistSkimArr = [];
  List<JpjCheckListJson> checklistLitarArr = [];
  List<JpjCheckListJson> checklistSystemArr = [];
  bool skimCheck = false;
  bool litarCheck = false;
  bool sistemCheck = false;

  final _formKey = GlobalKey<FormBuilderState>();
  final customDialog = CustomDialog();

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

        await EasyLoading.dismiss();
        if (mounted) {
          setState(() {
            skimCheck = true;
          });
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

    for (var element in checklist[1].data) {
      if (element.mandatory == 'true' &&
          (element.isCheck == null || element.isCheck == false)) {
        customDialog.show(
          context: context,
          content: AppLocalizations.of(context)!.translate('fail_litar'),
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

    EasyLoading.show(
        status: AppLocalizations.of(context)!.translate('updating'));

    JpjCheckListRequest requestLitar = JpjCheckListRequest(
      jpjCheckList: checklistLitarArr,
    );

    try {
      var updateResult = await checklistRepo.updateJpjCheckListLitar(
        checkListJson: jsonEncode(requestLitar.toJson()),
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
      await EasyLoading.dismiss();
      if (mounted) {
        setState(() {
          litarCheck = true;
        });
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

    for (var element in checklist[2].data) {
      if (element.mandatory == 'true' &&
          (element.isCheck == null || element.isCheck == false)) {
        customDialog.show(
          context: context,
          content: AppLocalizations.of(context)!
              .translate('fail_sistem'),
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
      await EasyLoading.dismiss();
      if (mounted) {
        setState(() {
          sistemCheck = true;
        });
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
                                                      primary: Colors.green,
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
                                          child: FormBuilderTextField(
                                            name: 'plateNo',
                                            inputFormatters: [
                                              UpperCaseTextFormatter()
                                            ],
                                            decoration: const InputDecoration(
                                              labelText: 'Plate No.',
                                              border: OutlineInputBorder(),
                                            ),
                                            validator:
                                                FormBuilderValidators.compose([
                                              FormBuilderValidators.required(),
                                            ]),
                                          ),
                                        ),
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
                                                      primary: Colors.green,
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
                                                      primary: Colors.green,
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
