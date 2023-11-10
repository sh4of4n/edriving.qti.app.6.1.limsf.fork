import 'package:auto_route/auto_route.dart';
import 'package:edriving_qti_app/pages/login/client_acc_tablet_form.dart';
import 'package:edriving_qti_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'client_acc_form.dart';

@RoutePage(name: 'ClientAccount')
class ClientAccount extends StatefulWidget {
  final data;

  const ClientAccount(this.data, {super.key});

  @override
  _ClientAccountState createState() => _ClientAccountState();
}

class _ClientAccountState extends State<ClientAccount> {
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();
  final primaryColor = ColorConstant.primaryColor;

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
          body: SafeArea(
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 60.h),
                      child: Image.asset(
                        ImagesConstant().logo,
                        width: 1000.w,
                        height: 600.h,
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.only(top: 150.h),
                    //   child: Text(
                    //     'JPJ QTO',
                    //     style: GoogleFonts.lato(
                    //       fontSize: 280.sp,
                    //       fontWeight: FontWeight.w900,
                    //       color: Color(0xff35368D),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 120.w, right: 120.w, top: 180.0.h),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 510.h,
                        ),
                        ClientAccountForm(widget.data),
                      ],
                    ),
                  ),
                ),
              ],
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
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    left: 220.w, right: 220.w, top: 250.0.h, bottom: 100.h),
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      ImagesConstant().logo,
                      height: 600.h,
                    ),
                    // Text(
                    //   'JPJ QTO',
                    //   style: GoogleFonts.lato(
                    //     fontSize: 280.sp,
                    //     fontWeight: FontWeight.w900,
                    //     color: Color(0xff35368D),
                    //   ),
                    // ),
                    SizedBox(
                      height: 100.h,
                    ),
                    ClientAccountTabletForm(widget.data),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
