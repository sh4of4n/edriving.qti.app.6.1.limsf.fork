import 'package:auto_route/auto_route.dart';
import 'package:edriving_qti_app/pages/eTestingSolution/list_part_2.dart';
import 'package:edriving_qti_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:edriving_qti_app/common_library/utils/app_localizations.dart';
import '../../router.gr.dart';

@RoutePage(name: 'StartLearning')
class StartLearning extends StatefulWidget {
  final studentIC;

  const StartLearning(this.studentIC, {super.key});

  @override
  _StartLearningState createState() => _StartLearningState();
}

class _StartLearningState extends State<StartLearning> {
  final image = ImagesConstant();

  String? _ic = '';
  String? _name = '';

// Default Radio Button Selected Item When App Starts.
  String groupId = 'D';
  String courseCode = 'KPP';
  String part = '2';
  // Group Value for Radio Button.
  int _groupId = 1;
  int _courseCodeId = 1;
  int _partId = 1;

  @override
  void initState() {
    super.initState();
    _getUserInfo();
  }

  _getUserInfo() async {
    String? name = await localStorage.getName();
    String? ic = await localStorage.getStudentIc();

    setState(() {
      _name = name;
      _ic = ic;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(
                  height: ScreenUtil().setHeight(60),
                ),
                Wrap(
                  children: <Widget>[
                    Text(
                      AppLocalizations.of(context)!.translate('instructor_name'),
                    ),
                    Text(_name!),
                  ],
                ),
                Wrap(
                  children: <Widget>[
                    const Text('    IC NO : '),
                    Text(_ic!),
                  ],
                ),
                const Divider(),
                const Text(
                  'Student Info',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                SizedBox(height: ScreenUtil().setHeight(40)),
                Table(
                  columnWidths: const {
                    0: FlexColumnWidth(1),
                    1: FlexColumnWidth(2),
                  },
                  children: [
                    /* TableRow(
                      children: [
                        Align(
                            alignment: Alignment.topCenter,
                            child: Text('Student Info')),
                        Container(),
                      ]
                    ),*/
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            image: DecorationImage(
                              image: AssetImage(image.feedSample),
                              fit: BoxFit.cover,
                            ),
                          ),
                          width: ScreenUtil().setWidth(380),
                          height: ScreenUtil().setWidth(380),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: <Widget>[
                              const Text('YEOH SAN JIEK '),
                              SizedBox(height: ScreenUtil().setHeight(20)),
                              Text(widget.studentIC),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ],
                ),
                SizedBox(height: ScreenUtil().setHeight(30)),
                const Divider(),
                SizedBox(height: ScreenUtil().setHeight(30)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: <Widget>[
                        const Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Group :',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Wrap(
                              children: <Widget>[
                                Radio(
                                  activeColor: ColorConstant.primaryColor,
                                  value: 1,
                                  groupValue: _groupId,
                                  onChanged: (dynamic val) {
                                    setState(() {
                                      groupId = 'D';
                                      _groupId = 1;
                                    });
                                  },
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 16),
                                  child: Text(
                                    'MANUAL',
                                  ),
                                ),
                              ],
                            ),
                            Wrap(
                              children: <Widget>[
                                Radio(
                                  activeColor: ColorConstant.primaryColor,
                                  value: 2,
                                  groupValue: _groupId,
                                  onChanged: (dynamic val) {
                                    setState(() {
                                      groupId = 'DA';
                                      _groupId = 2;
                                    });
                                  },
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 16),
                                  child: Text(
                                    'AUTO',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Course :',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Wrap(
                              children: <Widget>[
                                Radio(
                                  activeColor: ColorConstant.primaryColor,
                                  value: 1,
                                  groupValue: _courseCodeId,
                                  onChanged: (dynamic val) {
                                    setState(() {
                                      courseCode = 'KPP';
                                      _courseCodeId = 1;
                                    });
                                  },
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 16),
                                  child: Text(
                                    'E-LEARNING',
                                  ),
                                ),
                              ],
                            ),
                            Wrap(
                              children: <Widget>[
                                Radio(
                                  activeColor: ColorConstant.primaryColor,
                                  value: 2,
                                  groupValue: _courseCodeId,
                                  onChanged: (dynamic val) {
                                    setState(() {
                                      courseCode = 'QTI';
                                      _courseCodeId = 2;
                                    });
                                  },
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 16),
                                  child: Text(
                                    'QTI',
                                  ),
                                ),
                              ],
                            ),
                            Wrap(
                              children: <Widget>[
                                Radio(
                                  activeColor: ColorConstant.primaryColor,
                                  value: 3,
                                  groupValue: _courseCodeId,
                                  onChanged: (dynamic val) {
                                    setState(() {
                                      courseCode = 'JPJ';
                                      _courseCodeId = 3;
                                    });
                                  },
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 16),
                                  child: Text(
                                    'JPJ',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'part :',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Wrap(
                              children: <Widget>[
                                Radio(
                                  activeColor: ColorConstant.primaryColor,
                                  value: 1,
                                  groupValue: _partId,
                                  onChanged: (dynamic val) {
                                    setState(() {
                                      part = '2';
                                      _partId = 1;
                                    });
                                  },
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 16),
                                  child: Text(
                                    'PART II',
                                  ),
                                ),
                              ],
                            ),
                            Wrap(
                              children: <Widget>[
                                Radio(
                                  activeColor: ColorConstant.primaryColor,
                                  value: 2,
                                  groupValue: _partId,
                                  onChanged: (dynamic val) {
                                    setState(() {
                                      part = '3';
                                      _partId = 2;
                                    });
                                  },
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 16),
                                  child: Text(
                                    'PART III',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              child: Text(
                AppLocalizations.of(context)!.translate('start_lbl'),
              ),
              onPressed: () {
                context.router.push(
                  CriteriaList(
                    studentIc: widget.studentIC,
                    startDateTime: DateTime.now().toString(),
                    group: groupId,
                    course: courseCode,
                    part: part,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
