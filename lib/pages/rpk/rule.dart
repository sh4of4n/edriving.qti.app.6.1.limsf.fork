import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:edriving_qti_app/common_library/services/repository/etesting_repository.dart';

class RulePage extends StatefulWidget {
  RulePage({Key? key}) : super(key: key);

  @override
  State<RulePage> createState() => _RulePageState();
}

class _RulePageState extends State<RulePage> {
  final etestingRepo = EtestingRepo();
  var ruleList;
  Future? ruleFuture;

  @override
  void initState() {
    super.initState();
    getRule();
  }

  Future<void> getRule() async {
    ruleFuture = etestingRepo.getRule(elementCode: 'RPK');
    ruleList = await ruleFuture;
  }

  void updatePart3JpjTestResult() {
    var a = {
      'Result': [{}]
    };
    for (var element in ruleList.data) {
      a['Result']![0][element.ruleCode] = element.isCheck == null || element.isCheck == false ? 0 : '1';
    }

    print(a);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
        actions: [
          IconButton(
            onPressed: () {
              updatePart3JpjTestResult();
            },
            icon: Icon(
              Icons.save,
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: ruleFuture,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.isSuccess) {
              return SingleChildScrollView(
                child: ExpandableNotifier(
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
                                physics: NeverScrollableScrollPhysics(),
                                children: [
                                  for (var item in snapshot.data.data)
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Colors.grey.shade400,
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                      child: CheckboxListTile(
                                        title: Text(item.ruleDesc),
                                        value: item.isCheck ?? false,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            item.isCheck = value;
                                          });
                                        },
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
                      child: Text('Error: ${snapshot.data.message}'),
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
    );
  }
}
