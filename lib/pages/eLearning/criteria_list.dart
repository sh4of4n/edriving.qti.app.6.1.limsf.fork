import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:edriving_qti_app/common_library/utils/custom_dialog.dart';
import 'package:edriving_qti_app/services/api/model/eLearning_rating_model.dart';
import 'package:edriving_qti_app/services/repository/eLearning_rating_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'package:edriving_qti_app/common_library/utils/app_localizations.dart';

class CriteriaList extends StatefulWidget {
  final String studentIc;
  final String startDateTime;
  final String group;
  final String course;
  final String part;

  CriteriaList(
    this.studentIc,
    this.startDateTime,
    this.group,
    this.course,
    this.part,
  );

  @override
  _CriteriaListState createState() => _CriteriaListState();
}

class _CriteriaListState extends State<CriteriaList> {
  final learn = LearnRepo();
  final customDialog = CustomDialog();
  final timeFormat = DateFormat("h:mm a");
  final _timeFocus = FocusNode();
  final _timeController = TextEditingController();

  double c1Rate = 3.0;
  double c2Rate = 3.0;
  double c3Rate = 3.0;
  double c4Rate = 3.0;
  double c5Rate = 3.0;
  double c6Rate = 3.0;
  double c7Rate = 3.0;
  double c8Rate = 3.0;
  double c9Rate = 3.0;
  String ekppTag = '';

  final _c1Controller = TextEditingController();
  final _c2Controller = TextEditingController();
  final _c3Controller = TextEditingController();
  final _c4Controller = TextEditingController();
  final _c5Controller = TextEditingController();
  final _c6Controller = TextEditingController();
  final _c7Controller = TextEditingController();
  final _c8Controller = TextEditingController();
  // final _c9Controller = TextEditingController();
  final _remarkController = TextEditingController();
  @override
  void initState() {
    super.initState();
    print(widget.startDateTime);
  }

  Future addLearnResult(String time) async {
    List<EkppTag> tags = [
      EkppTag('ekpp01', c1Rate.toString(), _c1Controller.text),
      EkppTag('ekpp02', c2Rate.toString(), _c2Controller.text),
      EkppTag('ekpp03', c3Rate.toString(), _c3Controller.text),
      EkppTag('ekpp04', c4Rate.toString(), _c4Controller.text),
      EkppTag('ekpp05', c5Rate.toString(), _c5Controller.text),
      EkppTag('ekpp06', c6Rate.toString(), _c6Controller.text),
      EkppTag('ekpp07', c7Rate.toString(), _c7Controller.text),
      EkppTag('ekpp08', c8Rate.toString(), _c8Controller.text),
    ];
    //String jsonTags = jsonEncode(tags);
    //print(jsonTags);

    EkppTagReturn tutorial = EkppTagReturn(tags);
    String _ekppTag = jsonEncode(tutorial);
    setState(() {
      ekppTag = _ekppTag;
    });
    print(ekppTag);

    var addLearnResult = await learn.addLearnResult(
      context: context,
      groupId: widget.group,
      courseCode: widget.course,
      part: widget.part,
      dateTimeFromString: widget.startDateTime,
      dateTimeToString: time,
      studentIc: widget.studentIc,
      remark: _remarkController.text,
      detlInJson: ekppTag,
    );

    if (addLearnResult.isSuccess) {
      context.router.pop();
      context.router.pop();
      context.router.pop();
      print(addLearnResult.message);
    } else {
      customDialog.show(
          context: context,
          type: DialogType.ERROR,
          content: addLearnResult.message
              .toString()
              .replaceAll('\\u000d\\u000a\\u000d\\u000a', ''),
          onPressed: () {
            context.router.pop();
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criteria'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Card(
                color: Colors.blueGrey[400],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 0, 20, 15),
                  child: Column(
                    children: <Widget>[
                      RatingBar.builder(
                        itemSize: 25,
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 8.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          setState(() {
                            c1Rate = rating;
                          });
                          print(c1Rate);
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text('Memandu kenderaan dengan selamat.',
                            style: TextStyle(
                                color: Colors.black,
                                letterSpacing: 1,
                                fontSize: ScreenUtil().setSp(60))),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(40),
                      ),
                      TextFormField(
                        controller: _c1Controller,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20),
                          labelStyle: TextStyle(
                            fontSize: ScreenUtil().setSp(60),
                            color: Colors.grey[800],
                          ),
                          labelText: AppLocalizations.of(context)!
                              .translate('feedback_lbl'),
                          fillColor: Colors.white,
                          focusColor: Colors.black,
                          filled: true,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.blueGrey[400],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 0, 20, 15),
                  child: Column(
                    children: <Widget>[
                      RatingBar.builder(
                        itemSize: 25,
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 8.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          setState(() {
                            c2Rate = rating;
                          });
                          print(c2Rate);
                        },
                      ),
                      Text('Cara menggunakan brek tangan dengan betul.',
                          style: TextStyle(
                              color: Colors.black,
                              letterSpacing: 1,
                              fontSize: ScreenUtil().setSp(60))),
                      SizedBox(
                        height: ScreenUtil().setHeight(40),
                      ),
                      TextFormField(
                        controller: _c2Controller,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20),
                          labelStyle: TextStyle(
                            fontSize: ScreenUtil().setSp(60),
                            color: Colors.grey[800],
                          ),
                          labelText: AppLocalizations.of(context)!
                              .translate('feedback_lbl'),
                          fillColor: Colors.white,
                          filled: true,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.blueGrey[400],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 0, 20, 15),
                  child: Column(
                    children: <Widget>[
                      RatingBar.builder(
                        itemSize: 25,
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 8.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          setState(() {
                            c3Rate = rating;
                          });
                          print(c3Rate);
                        },
                      ),
                      Text('Cara mengguna cekam dengan betul.',
                          style: TextStyle(
                              color: Colors.black,
                              letterSpacing: 1,
                              fontSize: ScreenUtil().setSp(60))),
                      SizedBox(
                        height: ScreenUtil().setHeight(40),
                      ),
                      TextFormField(
                        controller: _c3Controller,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20),
                          labelStyle: TextStyle(
                            fontSize: ScreenUtil().setSp(60),
                            color: Colors.grey[800],
                          ),
                          labelText: AppLocalizations.of(context)!
                              .translate('feedback_lbl'),
                          fillColor: Colors.white,
                          filled: true,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.blueGrey[400],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 0, 20, 15),
                  child: Column(
                    children: <Widget>[
                      RatingBar.builder(
                        itemSize: 25,
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 8.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          setState(() {
                            c4Rate = rating;
                          });
                          print(c4Rate);
                        },
                      ),
                      Text('Cara mengguna stereng yang betul.',
                          style: TextStyle(
                              color: Colors.black,
                              letterSpacing: 1,
                              fontSize: ScreenUtil().setSp(60))),
                      SizedBox(
                        height: ScreenUtil().setHeight(40),
                      ),
                      TextFormField(
                        controller: _c4Controller,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20),
                          labelStyle: TextStyle(
                            fontSize: ScreenUtil().setSp(60),
                            color: Colors.grey[800],
                          ),
                          labelText: AppLocalizations.of(context)!
                              .translate('feedback_lbl'),
                          fillColor: Colors.white,
                          filled: true,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.blueGrey[400],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 0, 20, 15),
                  child: Column(
                    children: <Widget>[
                      RatingBar.builder(
                        itemSize: 25,
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 8.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          setState(() {
                            c5Rate = rating;
                          });
                          print(c5Rate);
                        },
                      ),
                      Text('Menekankan brek dengan lancar.',
                          style: TextStyle(
                              color: Colors.black,
                              letterSpacing: 1,
                              fontSize: ScreenUtil().setSp(60))),
                      SizedBox(
                        height: ScreenUtil().setHeight(40),
                      ),
                      TextFormField(
                        controller: _c5Controller,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20),
                          labelStyle: TextStyle(
                            fontSize: ScreenUtil().setSp(60),
                            color: Colors.grey[800],
                          ),
                          labelText: AppLocalizations.of(context)!
                              .translate('feedback_lbl'),
                          fillColor: Colors.white,
                          filled: true,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.blueGrey[400],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 0, 20, 15),
                  child: Column(
                    children: <Widget>[
                      RatingBar.builder(
                        itemSize: 25,
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 8.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          setState(() {
                            c6Rate = rating;
                          });
                          print(c6Rate);
                        },
                      ),
                      Text('Memandu kenderaan dengan lancar.',
                          style: TextStyle(
                              color: Colors.black,
                              letterSpacing: 1,
                              fontSize: ScreenUtil().setSp(60))),
                      SizedBox(
                        height: ScreenUtil().setHeight(40),
                      ),
                      TextFormField(
                        controller: _c6Controller,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20),
                          labelStyle: TextStyle(
                            fontSize: ScreenUtil().setSp(60),
                            color: Colors.grey[800],
                          ),
                          labelText: AppLocalizations.of(context)!
                              .translate('feedback_lbl'),
                          fillColor: Colors.white,
                          filled: true,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.blueGrey[400],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 0, 20, 15),
                  child: Column(
                    children: <Widget>[
                      RatingBar.builder(
                        itemSize: 25,
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 8.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          setState(() {
                            c7Rate = rating;
                          });
                          print(c7Rate);
                        },
                      ),
                      Text('Menggunakan gear yang sesuai.',
                          style: TextStyle(
                              color: Colors.black,
                              letterSpacing: 1,
                              fontSize: ScreenUtil().setSp(60))),
                      SizedBox(
                        height: ScreenUtil().setHeight(40),
                      ),
                      TextFormField(
                        controller: _c7Controller,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20),
                          labelStyle: TextStyle(
                            fontSize: ScreenUtil().setSp(60),
                            color: Colors.grey[800],
                          ),
                          labelText: AppLocalizations.of(context)!
                              .translate('feedback_lbl'),
                          fillColor: Colors.white,
                          filled: true,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.blueGrey[400],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 0, 20, 15),
                  child: Column(
                    children: <Widget>[
                      RatingBar.builder(
                        itemSize: 25,
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 8.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          setState(() {
                            c8Rate = rating;
                          });
                          print(c8Rate);
                        },
                      ),
                      Text('Menggunakan pemecut dengan lancar dan betul.',
                          style: TextStyle(
                              color: Colors.black,
                              letterSpacing: 1,
                              fontSize: ScreenUtil().setSp(60))),
                      SizedBox(
                        height: ScreenUtil().setHeight(40),
                      ),
                      TextFormField(
                        controller: _c8Controller,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20),
                          labelStyle: TextStyle(
                            fontSize: ScreenUtil().setSp(60),
                            color: Colors.grey[800],
                          ),
                          labelText: AppLocalizations.of(context)!
                              .translate('feedback_lbl'),
                          fillColor: Colors.white,
                          filled: true,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(50),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey[200],
                  borderRadius: new BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                    controller: _remarkController,
                    style: TextStyle(
                      //fontSize: 58.sp,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      hintText:
                          AppLocalizations.of(context)!.translate('remark_lbl'),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(100),
              ),
              ElevatedButton(
                child:
                    Text(AppLocalizations.of(context)!.translate('next_btn')),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20.0)), //this right here
                          child: Container(
                            height: 250,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, bottom: 10),
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Select end time to proceed.',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, bottom: 15),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Wrap(
                                        children: [
                                          Text(AppLocalizations.of(context)!
                                                  .translate('start_time_lbl') +
                                              ' : '),
                                          Text(
                                              DateFormat('hh:mm a').format(
                                                  DateTime.tryParse(
                                                      widget.startDateTime)!),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black)),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: DateTimeField(
                                      focusNode: _timeFocus,
                                      format: timeFormat,
                                      controller: _timeController,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                          vertical: 50.h,
                                        ),
                                        labelStyle: TextStyle(
                                          color: Color(0xff808080),
                                        ),
                                        labelText: AppLocalizations.of(context)!
                                            .translate('end_time_lbl'),
                                        fillColor: Colors.white,
                                        filled: true,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blue, width: 1.3),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blue, width: 1.3),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blue[700]!,
                                              width: 1.6),
                                          // borderRadius: BorderRadius.circular(0),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        prefixIcon: Icon(Icons.av_timer),
                                      ),
                                      onShowPicker:
                                          (context, currentValue) async {
                                        final time = await showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.fromDateTime(
                                              currentValue ?? DateTime.now()),
                                        );
                                        return DateTimeField.convert(time);
                                      },
                                      onChanged: (value) {
                                        //

                                        print(DateFormat("HH:mm:ss")
                                            .format(DateFormat.jm()
                                                .parse(_timeController.text))
                                            .toString());
                                      },
                                      validator: (value) {
                                        if (value == null) {
                                          return AppLocalizations.of(context)!
                                              .translate('time_required');
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 320.0,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        addLearnResult(DateFormat("HH:mm:ss")
                                            .format(DateFormat.jm()
                                                .parse(_timeController.text))
                                            .toString());
                                      },
                                      child: Text(
                                        "Save",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        textStyle: TextStyle(
                                          color: const Color(0xFF1BC0C5),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      });

                  //Navigator.pushNamed(context, RsmRpkTab);
                },
              ),
              SizedBox(
                height: ScreenUtil().setHeight(100),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
