import 'package:auto_route/auto_route.dart';
import 'package:edriving_qti_app/base/page_base_class.dart';
import 'package:edriving_qti_app/common_library/services/location.dart';
import 'package:edriving_qti_app/common_library/services/repository/auth_repository.dart';
import 'package:edriving_qti_app/common_library/services/repository/etesting_repository.dart';
import 'package:edriving_qti_app/utils/constants.dart';
import 'package:edriving_qti_app/utils/device_info.dart';
import 'package:edriving_qti_app/utils/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:edriving_qti_app/common_library/utils/app_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../common_library/utils/uppercase_formatter.dart';
import '../../router.gr.dart';

class NewLoginForm extends StatefulWidget {
  @override
  _NewLoginFormState createState() => _NewLoginFormState();
}

class _NewLoginFormState extends State<NewLoginForm> with PageBaseClass {
  final authRepo = AuthRepo();

  final _formKey = GlobalKey<FormBuilderState>();

  final FocusNode _phoneFocus = FocusNode();

  final FocusNode _passwordFocus = FocusNode();

  final primaryColor = ColorConstant.primaryColor;

  final localStorage = LocalStorage();

  bool _isLoading = false;

  String? _phone;
  String? _password;
  String? _loginMessage = '';
  bool _obscureText = true;

  // var _height = ScreenUtil().setHeight(1300);

  // var _height = ScreenUtil.screenHeight / 4.5;

  Location location = Location();
  String _latitude = '';
  String _longitude = '';

  DeviceInfo deviceInfo = DeviceInfo();
  // String _deviceModel = '';
  String? _deviceVersion = '';
  String? _deviceId = '';
  String? _deviceOs = '';

  final etestingRepo = EtestingRepo();

  @override
  void initState() {
    super.initState();

    // _getCurrentLocation();
    _getDeviceInfo();

    localStorage.getPermitCode().then((value) {
      _formKey.currentState?.fields['permitCode']?.didChange(value);
    });
  }

  _getDeviceInfo() async {
    // get device info
    await deviceInfo.getDeviceInfo();

    // _deviceModel = deviceInfo.model;
    _deviceVersion = deviceInfo.version;
    _deviceId = deviceInfo.id;
    _deviceOs = deviceInfo.os;

    // print('deviceId: ' + deviceId);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: _height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0.0, 15.0),
            blurRadius: 15.0,
          ),
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0.0, -10.0),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Padding(
        padding:
            EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 20.0),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 35.h,
              ),
              FormBuilderTextField(
                name: 'ic',
                focusNode: _phoneFocus,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                  hintStyle: TextStyle(
                    color: primaryColor,
                  ),
                  labelText: 'IC/NO',
                  fillColor: Colors.grey.withOpacity(.25),
                  filled: true,
                  prefixIcon: Icon(Icons.account_circle),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(
                        errorText: AppLocalizations.of(context)!
                            .translate('ic_no_required_msg')),
                  ],
                ),
              ),
              SizedBox(
                height: 70.h,
              ),
              FormBuilderTextField(
                name: 'permitCode',
                focusNode: _passwordFocus,
                inputFormatters: [UpperCaseTextFormatter()],
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                  hintStyle: TextStyle(color: primaryColor),
                  labelText: 'Permit Code',
                  fillColor: Colors.grey.withOpacity(.25),
                  filled: true,
                  prefixIcon: Icon(Icons.lock),
                  // suffixIcon: IconButton(
                  //   icon: Icon(
                  //       _obscureText ? Icons.visibility_off : Icons.visibility),
                  //   onPressed: () {
                  //     setState(
                  //       () {
                  //         _obscureText = !_obscureText;
                  //       },
                  //     );
                  //   },
                  // ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(
                        errorText: AppLocalizations.of(context)!
                            .translate('permit_code_required_msg')),
                  ],
                ),
                onSaved: (value) {
                  if (value != _password) {
                    _password = value;
                  }
                },
              ),
              SizedBox(
                height: 60.h,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: <Widget>[
              //     InkWell(
              //       onTap: () {
              //         context.router.push(ForgotPassword());
              //       },
              //       child: Text(
              //         AppLocalizations.of(context)!
              //             .translate('forgot_password_lbl'),
              //         style: TextStyle(
              //           fontSize: 56.sp,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              // SizedBox(
              //   height: 40.h,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      _loginMessage!.isNotEmpty
                          ? LimitedBox(
                              maxWidth: 800.w,
                              child: Text(
                                _loginMessage!,
                                style: TextStyle(color: Colors.red),
                                textAlign: TextAlign.center,
                              ),
                            )
                          : SizedBox.shrink(),
                      _loginButton(),
                    ],
                  ),
                ],
              ),
              // SizedBox(
              //   height: 40.h,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: <Widget>[
              //     InkWell(
              //       onTap: () {
              //         context.router.push(RegisterMobile());
              //       },
              //       child: Text(
              //         AppLocalizations.of(context)!.translate('sign_up_btn'),
              //         style: TextStyle(
              //           fontSize: 56.sp,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }

  _loginButton() {
    return Container(
      child: _isLoading
          ? SpinKitFoldingCube(
              color: primaryColor,
            )
          : ButtonTheme(
              minWidth: 420.w,
              padding: EdgeInsets.symmetric(vertical: 11.0),
              buttonColor: primaryColor,
              shape: StadiumBorder(),
              child: ElevatedButton(
                onPressed: _submitLogin, // () => localStorage.reset(),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: Text(
                  AppLocalizations.of(context)!.translate('login_btn'),
                  style: TextStyle(
                    fontSize: 56.sp,
                  ),
                ),
              ),
            ),
    );
  }

  loginFail(String message) async {
    await showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.translate('login')),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              setState(() {
                _isLoading = false;
                _loginMessage = message;
              });
              Navigator.pop(context, 'OK');
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  _submitLogin() async {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      FocusScope.of(context).requestFocus(FocusNode());

      setState(() {
        _isLoading = true;
        _loginMessage = '';
      });

      var result = await authRepo.jpjQtiLoginWithMySikap(
        mySikapId: _formKey.currentState?.fields['ic']?.value!,
        permitCode: _formKey.currentState?.fields['permitCode']?.value!,
      );

      if (!result.isSuccess) {
        loginFail(result.message!);
        return;
      }

      await localStorage
          .savePermitCode(_formKey.currentState?.fields['permitCode']?.value!);

      var result3 = await etestingRepo.getUserIdByMySikapId();
      if (!result3.isSuccess) {
        loginFail(result3.message!);
        return;
      }

      await localStorage.saveName(result3.data[0].firstName);

      await localStorage.saveLoginTime(DateTime.now().toString());

      context.router.replace(HomeSelect());
    }
  }
}
