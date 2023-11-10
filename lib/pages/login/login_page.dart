import 'package:auto_route/auto_route.dart';
import 'package:edriving_qti_app/common_library/utils/custom_dialog.dart';
import 'package:edriving_qti_app/pages/login/new_login_form.dart';
import 'package:edriving_qti_app/pages/login/new_login_tablet_form.dart';
import 'package:edriving_qti_app/utils/constants.dart';
import 'package:edriving_qti_app/utils/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'login_bottom_card.dart';
import 'login_tablet_bottom_card.dart';

@RoutePage(name: 'Login')
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();
  final primaryColor = ColorConstant.primaryColor;
  final localStorage = LocalStorage();
  final customDialog = CustomDialog();

  @override
  Widget build(BuildContext context) {
    return defaultLayout();
  }

  defaultLayout() {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Colors.amber.shade50,
              Colors.amber.shade100,
              Colors.amber.shade200,
              Colors.amber.shade300,
              primaryColor
            ],
            stops: const [0.2, 0.4, 0.6, 0.7, 1],
            radius: 0.7,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 200.h),
                    child: Image.asset(
                      ImagesConstant().logo,
                      width: 1000.w,
                      height: 600.h,
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.fromLTRB(0, 400.h, 0, 100.h),
                  //   child: Text(
                  //     'JPJ QTO',
                  //     style: GoogleFonts.lato(
                  //       fontSize: 280.sp,
                  //       fontWeight: FontWeight.w900,
                  //       color: Color(0xff35368D),
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 140.w),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 120.h,
                        ),
                        // LoginForm(),
                        const NewLoginForm()
                      ],
                    ),
                  ),
                  const LoginBottomCard(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  tabLayout() {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Colors.amber.shade50,
              Colors.amber.shade100,
              Colors.amber.shade200,
              Colors.amber.shade300,
              primaryColor
            ],
            stops: const [0.2, 0.4, 0.6, 0.7, 1],
            radius: 0.7,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 500.h),
                    child: Image.asset(
                      ImagesConstant().logo,
                      width: 1000.w,
                      height: 600.h,
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(top: 300.h),
                  //   child: Text(
                  //     'JPJ QTO',
                  //     style: GoogleFonts.lato(
                  //       fontSize: 280.sp,
                  //       fontWeight: FontWeight.w900,
                  //       color: Color(0xff35368D),
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 220.w),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 120.h,
                        ),
                        // LoginTabletForm(),
                        const NewLoginTabletForm(),
                      ],
                    ),
                  ),
                  const LoginTabletBottomCard(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
