import 'package:edriving_qti_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'main_part_2.dart';
import 'main_part_3.dart';

class RsmRpkTabs extends StatefulWidget {
  @override
  _RsmRpkTabsState createState() => _RsmRpkTabsState();
}

class _RsmRpkTabsState extends State<RsmRpkTabs>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  final image = ImagesConstant();

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
    /* _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: 0,
    )..addListener(() {
      setState(() {
        _tabController.index = 0;
      });
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120),
          child: AppBar(
            automaticallyImplyLeading: false,
            flexibleSpace: Column(
              children: <Widget>[
                SizedBox(
                  height: ScreenUtil().setHeight(20),
                ),
                Container(
                  child: Text(
                    'PERMIT NO',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Table(
                  columnWidths: {
                    0: FlexColumnWidth(7),
                    1: FlexColumnWidth(4),
                  },
                  children: [
                    TableRow(children: [
                      Row(
                        children: <Widget>[
                          Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: new DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(image.feedSample),
                                  ))),
                          Column(
                            children: <Widget>[
                              Container(
                                child: Text(
                                  'Yeoh San Jiek',
                                  style: TextStyle(color: Colors.black),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Container(
                                child: Text(
                                  '960529-07-5175',
                                  style: TextStyle(color: Colors.grey[700]),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Container(
                                child: Text(
                                  'No Queue',
                                  style: TextStyle(color: Colors.grey[700]),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Table(
                        children: [
                          TableRow(children: [
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Text(
                                  DateTime.now().toString().substring(0, 10),
                                  style: TextStyle(color: Colors.black),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Text(
                                  'PBH 1234',
                                  style: TextStyle(color: Colors.grey[700]),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Text(
                                  'Route No',
                                  style: TextStyle(color: Colors.grey[700]),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ),
                          ]),
                        ],
                      )
                    ])
                  ],
                ),
              ],
            ),
            /*  Container(
            child: Text('2020/5/29',style: TextStyle(fontSize: ScreenUtil().setSp(50),color: Colors.black),textAlign: TextAlign.left,),
          ),*/
            bottom: TabBar(
              labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                  fontFamily: 'Family Name'),
              unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10.0,
                  fontFamily: 'Family Name'),
              labelColor: Colors.black,
              unselectedLabelColor: Colors.black,
              tabs: [
                new Tab(text: 'Part II'),
                new Tab(text: 'Part III'),
              ],
              controller: _tabController,
              indicatorColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
            bottomOpacity: 1,
          ),
        ),
        //drawer: RPKDrawer(),
        body: TabBarView(
          children: [
            Part2Main(),
            Part3Main(),
          ],
          controller: _tabController,
        ),
      ),
    );
  }
}
