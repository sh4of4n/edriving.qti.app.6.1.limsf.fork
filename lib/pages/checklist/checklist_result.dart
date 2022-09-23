import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:edriving_qti_app/common_library/utils/app_localizations.dart';

import '../../common_library/services/repository/checklist_repository.dart';
import '../../common_library/utils/uppercase_formatter.dart';
import '../../utils/constants.dart';

class ChecklistResultPage extends StatefulWidget {
  ChecklistResultPage({Key? key}) : super(key: key);

  @override
  State<ChecklistResultPage> createState() => _ChecklistResultPageState();
}

class _ChecklistResultPageState extends State<ChecklistResultPage> {
  Future? _checklistFuture;
  final checklistRepo = ChecklistRepo();
  var checklist = [];
  final _formKey = GlobalKey<FormBuilderState>();

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

  @override
  void initState() {
    super.initState();
    _checklistFuture = Future.wait([
      getCheckListSkim(),
      getCheckListLitar(),
      getCheckListSystem(),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    FormBuilderTextField(
                      name: 'plateNo',
                      inputFormatters: [UpperCaseTextFormatter()],
                      decoration: const InputDecoration(labelText: 'Plate No.'),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.saveAndValidate() ??
                              false) {
                            setState(() {
                              _checklistFuture = Future.wait([
                                getCheckListSkim(),
                                getCheckListLitar(),
                                getCheckListSystem(),
                              ]);
                              storeChecklist();
                            });
                          }
                        },
                        child: Text('Search'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            FutureBuilder(
              future: _checklistFuture,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return CircularProgressIndicator();
                  default:
                    if (snapshot.hasData) {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
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
                                                ExpandablePanelHeaderAlignment
                                                    .center,
                                            tapBodyToCollapse: true,
                                          ),
                                          header: Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Text(
                                              "SKIM",
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          collapsed: SizedBox(),
                                          expanded: ListView(
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            children: [
                                              for (var item
                                                  in checklist[0].data)
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
                                                  child: CheckboxListTile(
                                                    title: Text(item.checkDesc),
                                                    value: item.status == 'true'
                                                        ? true
                                                        : false,
                                                    onChanged: (bool? value) {},
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
                                                ExpandablePanelHeaderAlignment
                                                    .center,
                                            tapBodyToCollapse: true,
                                          ),
                                          header: Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Text(
                                              "LITAR",
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          collapsed: SizedBox(),
                                          expanded: ListView(
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            children: [
                                              for (var item
                                                  in checklist[1].data)
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
                                                  child: CheckboxListTile(
                                                    title: Text(item.checkDesc),
                                                    value: item.status == 'true'
                                                        ? true
                                                        : false,
                                                    onChanged: (bool? value) {},
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
                                                ExpandablePanelHeaderAlignment
                                                    .center,
                                            tapBodyToCollapse: true,
                                          ),
                                          header: Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Text(
                                              "Bilik kawalan",
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          collapsed: SizedBox(),
                                          expanded: ListView(
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            children: [
                                              for (var item
                                                  in checklist[2].data)
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
                                                  child: CheckboxListTile(
                                                    title: Text(item.checkDesc),
                                                    value: item.status == 'true'
                                                        ? true
                                                        : false,
                                                    onChanged: (bool? value) {},
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
          ],
        ),
      ),
    );
  }
}
