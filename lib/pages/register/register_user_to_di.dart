import 'package:auto_route/auto_route.dart';
import 'package:edriving_qti_app/common_library/utils/custom_button.dart';
import 'package:edriving_qti_app/common_library/utils/custom_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:edriving_qti_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:edriving_qti_app/common_library/services/repository/auth_repository.dart';

import 'package:edriving_qti_app/common_library/utils/app_localizations.dart';

@RoutePage(name: 'RegisterUserToDi')
class RegisterUserToDi extends StatelessWidget {
  final data;

  RegisterUserToDi(this.data, {super.key});

  final authRepo = AuthRepo();
  final customDialog = CustomDialog();
  final image = ImagesConstant();
  final primaryColor = ColorConstant.primaryColor;
  final inputStyle = TextStyle(
    fontSize: 70.sp,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              primaryColor,
            ],
            stops: const [0.45, 0.85],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Image.asset(image.logo2, height: 90.h),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 130.w),
            child: Column(
              children: <Widget>[
                data.status == 'success'
                    ? Text(
                        '${'${AppLocalizations.of(context)!
                                .translate('scan_success')} ' +
                            data.barcode.qRCode[0].name} ${AppLocalizations.of(context)!
                                .translate('organisation')}',
                        style: inputStyle)
                    : Text(
                        '${'${AppLocalizations.of(context)!.translate('scan_fail')} ' +
                            data.barcode.qRCode[0].name} ${AppLocalizations.of(context)!
                                .translate('organisation')}',
                        style: inputStyle),
                CustomButton(
                  onPressed: () => context.router.popUntil(
                    ModalRoute.withName('Home'),
                  ),
                  buttonColor: Colors.blue,
                  title: AppLocalizations.of(context)!.translate('ok_btn'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
