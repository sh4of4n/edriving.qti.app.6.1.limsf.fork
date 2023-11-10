import 'package:edriving_qti_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../router.gr.dart';
import 'home_icon.dart';

class HomeModule extends StatelessWidget {
  final imageConstant = ImagesConstant();

  HomeModule({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      SizedBox(
        height: ScreenUtil().setHeight(30),
      ),
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
      //   children: <Widget>[
      //     Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: <Widget>[
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: <Widget>[
      //             HomeIcon(
      //               //component: Router.backOrder,
      //               //component: Navigator.pushNamed(context, ETestingMain),
      //               image: imageConstant.kppIcon,
      //               name: 'KPP02',
      //             ),
      //           ],
      //         ),
      //       ],
      //     ),
      //     Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: <Widget>[
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: <Widget>[
      //             HomeIcon(
      //               //component: Router.customStatusJobList,
      //               image: imageConstant.kppIcon,
      //               name: 'KPP03',
      //             ),
      //           ],
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
      SizedBox(height: ScreenUtil().setHeight(80)),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          //  Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: <Widget>[
          //         HomeIcon(
          //           component: RpkCandidateDetails(),
          //           image: imageConstant.kppIcon,
          //           name: 'RPK',
          //         ),
          //       ],
          //     ),
          //   ],
          // ), 
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  HomeIcon(
                    component: const JrCandidateDetails(),
                    image: imageConstant.kppIcon,
                    name: 'Bahagian III',
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      // SizedBox(height: ScreenUtil().setHeight(80)),
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
      //   children: <Widget>[
      //     Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: <Widget>[
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: <Widget>[
      //             HomeIcon(
      //               component: Routes.learningEnterStudentIC,
      //               image: imageConstant.kppIcon,
      //               name: 'eLearning',
      //             ),
      //           ],
      //         ),
      //       ],
      //     ),

      //     /*Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: <Widget>[
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: <Widget>[
      //             HomeIcon(
      //               //component: Router.holidayList,
      //               image: imageConstant.kppIcon,
      //               name: 'eTesting',
      //             ),
      //           ],
      //         ),
      //       ],
      //     ),*/
      //   ],
      // ),
      SizedBox(height: ScreenUtil().setHeight(80)),
      /*Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  HomeIcon(
                    //component: Router.leaveMainPage,
                    image: imageConstant.kppIcon,
                    name: 'Setting',
                  ),
                ],
              ),
            ],
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  HomeIcon(
                    //component: Router.customStatusJobList,
                    image: imageConstant.kppIcon,
                    name: 'Expenses Claim',
                  ),
                ],
              ),
            ],
          ),

        ],
      ),*/
      /* Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  HomeIcon(
                    //component: Router.leaveMainPage,
                    image: imageConstant.kppIcon,
                    name: 'eLeave',
                  ),
                ],
              ),
            ],
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  HomeIcon(
                    //component: Router.customStatusJobList,
                    image: imageConstant.kppIcon,
                    name: 'Expenses Claim',
                  ),
                ],
              ),
            ],
          ),

        ],
      ),
      SizedBox(height: ScreenUtil().setHeight(80)),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  HomeIcon(
                    //component: Router.backOrder,
                    image: imageConstant.kppIcon,
                    name: 'Attendance Clocking',
                  ),
                ],
              ),
            ],
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  HomeIcon(
                    //component: Router.customStatusJobList,
                    image: imageConstant.kppIcon,
                    name: 'Attendance Records',
                  ),
                ],
              ),
            ],
          ),

        ],
      ),
      SizedBox(height: ScreenUtil().setHeight(80)),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  HomeIcon(
                    //component: Router.ohRmain,
                    image: imageConstant.kppIcon,
                    name: 'Company Notice',
                  ),
                ],
              ),
            ],
          ),

        ],
      ),*/
      SizedBox(height: ScreenUtil().setHeight(100)),
    ]);
  }
}
