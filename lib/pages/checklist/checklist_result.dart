import 'package:dropdown_search/dropdown_search.dart';
import 'package:edriving_qti_app/component/profile.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:edriving_qti_app/common_library/services/model/etesting_model.dart';
import 'package:edriving_qti_app/common_library/services/repository/etesting_repository.dart';
import 'package:edriving_qti_app/common_library/utils/app_localizations.dart';

import '../../common_library/services/repository/checklist_repository.dart';
import '../../utils/constants.dart';

class ChecklistResultPage extends StatefulWidget {
  ChecklistResultPage({Key? key}) : super(key: key);

  @override
  State<ChecklistResultPage> createState() => _ChecklistResultPageState();
}

class _ChecklistResultPageState extends State<ChecklistResultPage> {
  Future? _checklistFuture;
  Future? _skimFuture;
  final checklistRepo = ChecklistRepo();
  var checklist = [];
  final _formKey = GlobalKey<FormBuilderState>();
  List<MysikapVehicle> vehicleArr = [];
  final etestingRepo = EtestingRepo();

  Future getCheckListSkim() async {
    return await checklistRepo.getJpjCheckListSkim(
        plateNo: _formKey.currentState?.fields['plateNo']!.value);
  }

  Future getCheckListLitar() async {
    return await checklistRepo.getJpjCheckListLitar(
        plateNo: _formKey.currentState?.fields['plateNo']!.value);
  }

  Future getCheckListSystem() async {
    return await checklistRepo.getJpjCheckListSistem(
        plateNo: _formKey.currentState?.fields['plateNo']!.value);
  }

  Future getMySikapVehicleListByStatus() async {
    var result =
        await etestingRepo.getMySikapVehicleListByStatus(status: 'CHECKED');
    if (mounted) {
      if (result.isSuccess && result.data != null) {
        setState(() {
          vehicleArr = result.data;
        });
      }
    }

    return result;
  }

  @override
  void initState() {
    super.initState();
    _checklistFuture = Future.wait([
      // getCheckListSkim(),
      getCheckListLitar(),
      getCheckListSystem(),
      getMySikapVehicleListByStatus(),
    ]);
    storeChecklist();
  }

  void storeChecklist() async {
    checklist = await _checklistFuture;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.primaryColor,
        title: Text(AppLocalizations.of(context)!.translate('checklist')),
      ),
      body: FutureBuilder(
        future: _checklistFuture,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      ProfileWidget(),
                      ExpandableNotifier(
                        initialExpanded: true,
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
                                      tapBodyToCollapse: true,
                                    ),
                                    header: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        "1. Pemeriksaan Kenderaan Ujian",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    collapsed: SizedBox(),
                                    expanded: ListView(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: FormBuilder(
                                            key: _formKey,
                                            child: Column(
                                              children: [
                                                FormBuilderField(
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
                                                          labelText:
                                                              AppLocalizations.of(
                                                                      context)!
                                                                  .translate(
                                                                      'plate_no'),
                                                          filled: true,
                                                        ),
                                                      ),
                                                      validator:
                                                          (MysikapVehicle? i) {
                                                        if (i == null)
                                                          return field
                                                              .errorText;
                                                        return null;
                                                      },

                                                      itemAsString:
                                                          (MysikapVehicle u) =>
                                                              u.plateNo!,
                                                      compareFn: (i, s) =>
                                                          i.plateNo ==
                                                          s.plateNo,
                                                      onChanged: ((value) {
                                                        field.didChange(
                                                            value!.plateNo);

                                                        setState(() {
                                                          _skimFuture =
                                                              getCheckListSkim();
                                                        });
                                                      }),
                                                      popupProps:
                                                          PopupPropsMultiSelection
                                                              .modalBottomSheet(
                                                        isFilterOnline: true,
                                                        showSelectedItems: true,
                                                        showSearchBox: true,
                                                        itemBuilder: (context,
                                                            item, isSelected) {
                                                          return Container(
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        8),
                                                            decoration: !isSelected
                                                                ? null
                                                                : BoxDecoration(
                                                                    border: Border.all(
                                                                        color: Theme.of(context)
                                                                            .primaryColor),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(5),
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                            child: ListTile(
                                                              selected:
                                                                  isSelected,
                                                              title: Text(
                                                                  item.plateNo ??
                                                                      ''),
                                                              subtitle: Text(
                                                                  '${item.groupId?.toString() ?? ''}, ${item.carNo?.toString() ?? ''}'),
                                                              trailing: item
                                                                          .checked ==
                                                                      'true'
                                                                  ? Icon(Icons
                                                                      .check)
                                                                  : SizedBox(),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    );
                                                  },
                                                  validator:
                                                      FormBuilderValidators
                                                          .compose([
                                                    FormBuilderValidators
                                                        .required(),
                                                  ]),
                                                ),
                                                // SizedBox(
                                                //   width: double.infinity,
                                                //   child: ElevatedButton(
                                                //     onPressed: () {
                                                //       if (_formKey
                                                //               .currentState
                                                //               ?.saveAndValidate() ??
                                                //           false) {
                                                //         setState(() {
                                                //           _checklistFuture =
                                                //               Future
                                                //                   .wait([
                                                //             getCheckListSkim(),
                                                //             getCheckListLitar(),
                                                //             getCheckListSystem(),
                                                //           ]);
                                                //           storeChecklist();
                                                //         });
                                                //       }
                                                //     },
                                                //     child: Text('Search'),
                                                //   ),
                                                // ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        FutureBuilder(
                                          future: _skimFuture,
                                          builder: (BuildContext context,
                                              AsyncSnapshot snapshot2) {
                                            switch (snapshot2.connectionState) {
                                              case ConnectionState.waiting:
                                                return Center(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            16.0),
                                                    child:
                                                        CircularProgressIndicator(),
                                                  ),
                                                );
                                              default:
                                                if (snapshot2.hasData) {
                                                  return Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      ListView.separated(
                                                        shrinkWrap: true,
                                                        physics:
                                                            NeverScrollableScrollPhysics(),
                                                        itemCount: snapshot2
                                                            .data.data.length,
                                                        separatorBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index) {
                                                          return Divider(
                                                            height: 1,
                                                          );
                                                        },
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index) {
                                                          return customCheckbox(
                                                              '1.${index + 1}',
                                                              snapshot2.data
                                                                  .data[index]);
                                                        },
                                                      ),
                                                    ],
                                                  );
                                                } else if (snapshot.hasError) {
                                                  return Center(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        const Icon(
                                                          Icons.error_outline,
                                                          color: Colors.red,
                                                          size: 60,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 16),
                                                          child: Text(
                                                              'Error: ${snapshot.error}'),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                } else {
                                                  return SizedBox();
                                                }
                                            }
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
                        initialExpanded: true,
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
                                      tapBodyToCollapse: true,
                                    ),
                                    header: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        "2. LITAR",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    collapsed: SizedBox(),
                                    expanded: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        ListView.separated(
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount: checklist[0].data.length,
                                          separatorBuilder:
                                              (BuildContext context,
                                                  int index) {
                                            return Divider(
                                              height: 1,
                                            );
                                          },
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return customCheckbox(
                                                '2.${index + 1}',
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
                        initialExpanded: true,
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
                                      tapBodyToCollapse: true,
                                    ),
                                    header: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        "3. Bilik kawalan",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    collapsed: SizedBox(),
                                    expanded: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        ListView.separated(
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount: checklist[1].data.length,
                                          separatorBuilder:
                                              (BuildContext context,
                                                  int index) {
                                            return Divider(
                                              height: 1,
                                            );
                                          },
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return customCheckbox(
                                                '3.${index + 1}',
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
                      SizedBox(
                        height: 16.0,
                      ),
                    ],
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
          }
        },
      ),
    );
  }

  Widget customCheckbox(String index, var item) {
    return ListTile(
      title: Text(
        '$index. ${item.checkDesc}',
        style: TextStyle(
          fontWeight:
              item.mandatory == 'false' ? FontWeight.normal : FontWeight.bold,
        ),
      ),
      subtitle:
          item.checkDesc.toLowerCase() == 'lain-lain' && item.status == 'false'
              ? FormBuilderTextField(
                  name: 'skimLain',
                  readOnly: true,
                  initialValue: item.remark,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Remark',
                  ),
                )
              : null,
      trailing: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: item.status == 'false' ? Colors.blue : Colors.grey.shade700,
          ),
          color: item.status == 'false' ? Colors.blue : Colors.white,
        ),
        child: item.status == 'false'
            ? Icon(
                Icons.close,
                size: 18,
                color: Colors.white,
              )
            : SizedBox(
                height: 18,
                width: 18,
              ),
      ),
    );
  }
}
