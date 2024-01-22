import 'package:auto_route/auto_route.dart';
import 'package:edriving_qti_app/base/page_base_class.dart';
import 'package:edriving_qti_app/common_library/services/location.dart';
import 'package:edriving_qti_app/common_library/services/model/auth_model.dart';
import 'package:edriving_qti_app/common_library/services/model/etesting_model.dart';
import 'package:edriving_qti_app/common_library/services/repository/auth_repository.dart';
import 'package:edriving_qti_app/common_library/services/repository/etesting_repository.dart';
import 'package:edriving_qti_app/common_library/services/response.dart';
import 'package:edriving_qti_app/common_library/utils/custom_dialog.dart';
import 'package:edriving_qti_app/pages/login/select.dart';
import 'package:edriving_qti_app/utils/constants.dart';
import 'package:edriving_qti_app/utils/device_info.dart';
import 'package:edriving_qti_app/utils/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:edriving_qti_app/common_library/utils/app_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../common_library/utils/uppercase_formatter.dart';
import '../../router.gr.dart';

class NewLoginForm extends StatefulWidget {
  const NewLoginForm({super.key});

  @override
  State<NewLoginForm> createState() => _NewLoginFormState();
}

class _NewLoginFormState extends State<NewLoginForm> with PageBaseClass {
  final authRepo = AuthRepo();

  final _formKey = GlobalKey<FormBuilderState>();

  final FocusNode _phoneFocus = FocusNode();

  final FocusNode _passwordFocus = FocusNode();
  static const platform = MethodChannel('samples.flutter.dev/battery');
  List<Map<String, dynamic>> ownerCategoryList = [];
  List<String> category = [];
  String selectedCategory = '';
  String status = '';
  String readMyKad = '';
  String fingerPrintVerify = 'Please scan your fingerprint.';
  final icController = TextEditingController();
  final icFocus = FocusNode();
  final customDialog = CustomDialog();

  final primaryColor = ColorConstant.primaryColor;

  final localStorage = LocalStorage();

  bool _isLoading = false;

  String? _password;
  String? _loginMessage = '';

  // var _height = ScreenUtil().setHeight(1300);

  // var _height = ScreenUtil.screenHeight / 4.5;

  Location location = Location();

  DeviceInfo deviceInfo = DeviceInfo();
  // String _deviceModel = '';
  bool isKeyInIC = false;
  bool isCallVerifyWithMyKad = false;

  final etestingRepo = EtestingRepo();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await EasyLoading.show(
        maskType: EasyLoadingMaskType.black,
      );
      _getDeviceInfo();
      _getCategory();
      _formKey.currentState?.fields['permitCode']
          ?.didChange(await localStorage.getPermitCode());
      if (_formKey.currentState?.fields['permitCode']?.value != '') {
        await verifyWithMyKad();
      }

      await EasyLoading.dismiss();
    });
  }

  Future verifyWithMyKad() async {
    Response<List<VerifyWithMyKad>> result = await authRepo.verifyWithMyKad(
        diCode: _formKey.currentState?.fields['permitCode']?.value ?? '');
    isCallVerifyWithMyKad = true;
    isKeyInIC = true;
    if (result.data![0].mykadLogin == 'false') {
      setState(() {
        isKeyInIC = true;
      });
    }
  }

  readIc() async {
    EasyLoading.show(
      maskType: EasyLoadingMaskType.black,
    );
    try {
      final result = await platform.invokeMethod<String>('onCreate');
      setState(() {
        status = result.toString();
      });
    } on PlatformException catch (e) {
      setState(() {
        status = "'${e.message}'.";
      });
    }
    if (status == "Connect success") {
      if (!context.mounted) return;
      await EasyLoading.dismiss();
      if (!mounted) return;
      await customDialog.show(
        context: context,
        title: const Center(
          child: Icon(
            Icons.check_circle_outline,
            color: Colors.green,
            size: 120,
          ),
        ),
        content: 'Connected Success',
        barrierDismissable: false,
        type: DialogType.SUCCESS,
        onPressed: () async {
          await context.router.pop();
          EasyLoading.show(
            status: 'Reading my kad',
            maskType: EasyLoadingMaskType.black,
          );
          try {
            final result = await platform.invokeMethod<String>('onReadMyKad');
            setState(
              () {
                readMyKad = result.toString();
              },
            );
          } on PlatformException catch (e) {
            setState(() {
              readMyKad = "${e.message}";
            });
          }
          setState(() {
            if (readMyKad != 'Fail to power up my kad') {
              EasyLoading.dismiss();
              customDialog.show(
                context: context,
                title: const Center(
                  child: Icon(
                    Icons.check_circle_outline,
                    color: Colors.green,
                    size: 120,
                  ),
                ),
                content: 'IC number read will be $readMyKad',
                barrierDismissable: false,
                type: DialogType.SUCCESS,
                onPressed: () async {
                  context.router.pop();
                  try {
                    final result = await platform
                        .invokeMethod<String>('onFingerprintVerify');
                    setState(() {
                      fingerPrintVerify = result.toString();
                    });
                    EasyLoading.show(
                      status: fingerPrintVerify,
                      maskType: EasyLoadingMaskType.black,
                    );
                    if (result ==
                        'Please place your thumb on the fingerprint reader...') {
                      final result =
                          await platform.invokeMethod<String>(
                              'onFingerprintVerify2');
                      setState(() {
                        fingerPrintVerify = result.toString();
                      });
                    }
                    if (fingerPrintVerify ==
                        "Fingerprint matches fingerprint in MyKad") {
                      await EasyLoading.dismiss();
                      icController.text = readMyKad;
                      await _showCategory();
                    } else {
                      await EasyLoading.dismiss();
                    }
                  } on PlatformException catch (e) {
                    setState(() {
                      fingerPrintVerify = "${e.message}";
                    });
                  }
                },
              );
            } else {
              EasyLoading.dismiss();
              customDialog.show(
                context: context,
                content: readMyKad,
                onPressed: () => Navigator.pop(context),
                type: DialogType.ERROR,
              );
            }
          });
        },
      );
    } else {
      if (!context.mounted) return;
      await EasyLoading.dismiss();
      if (!context.mounted) return;
      await customDialog.show(
        context: context,
        content: 'Fail to connect device',
        onPressed: () => Navigator.pop(context),
        type: DialogType.ERROR,
      );
    }
  }

  _getDeviceInfo() async {
    // get device info
    await deviceInfo.getDeviceInfo();

    // _deviceModel = deviceInfo.model;

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
        boxShadow: const [
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
        padding: const EdgeInsets.only(
            left: 16.0, right: 16.0, top: 16.0, bottom: 20.0),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 35.h,
              ),
              isKeyInIC
                  ? FormBuilderTextField(
                      name: 'ic',
                      focusNode: _phoneFocus,
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 16.0),
                        hintStyle: TextStyle(
                          color: primaryColor,
                        ),
                        labelText: 'IC/NO',
                        fillColor: Colors.grey.withOpacity(.25),
                        filled: true,
                        prefixIcon: const Icon(Icons.account_circle),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
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
                    )
                  : TextFormField(
                      style: const TextStyle(
                          color: Colors.black,
                          // fontWeight: FontWeight.bold,
                          fontSize: 15),
                      controller: icController,
                      focusNode: icFocus,
                      readOnly: true,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.withOpacity(.25),
                        filled: true,
                        prefixIcon: const Icon(Icons.account_circle),
                        focusedErrorBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.red)),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 3, color: Colors.blue),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        contentPadding: const EdgeInsets.all(5.0),
                        hintStyle: TextStyle(
                          color: primaryColor,
                        ),
                        labelText: 'Click to read IC',
                      ),
                      onTap: () async {
                        if (_formKey
                                .currentState?.fields['permitCode']?.value! ==
                            '') {
                          _formKey.currentState?.fields['permitCode']
                              ?.invalidate('');
                          return;
                        }
                        if (!isCallVerifyWithMyKad) {
                          await EasyLoading.show(
                            maskType: EasyLoadingMaskType.black,
                          );
                          await verifyWithMyKad();
                          await EasyLoading.dismiss();
                          if (isKeyInIC) {
                            _formKey.currentState?.fields['ic']?.focus();
                            return;
                          }
                        }

                        readIc();
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please click to read IC';
                        }
                        return null;
                      },
                    ),
              SizedBox(
                height: 70.h,
              ),
              FormBuilderTextField(
                name: 'permitCode',
                initialValue: '',
                focusNode: _passwordFocus,
                inputFormatters: [UpperCaseTextFormatter()],
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
                  hintStyle: TextStyle(color: primaryColor),
                  labelText: 'Permit Code',
                  fillColor: Colors.grey.withOpacity(.25),
                  filled: true,
                  prefixIcon: const Icon(Icons.lock),
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
                    borderSide: const BorderSide(color: Colors.transparent),
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
                          ? SizedBox(
                              width: 800.w,
                              height: 800.h,
                              child: SingleChildScrollView(
                                child: Text(
                                  _loginMessage!,
                                  style: const TextStyle(color: Colors.red),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
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
              padding: const EdgeInsets.symmetric(vertical: 11.0),
              buttonColor: primaryColor,
              shape: const StadiumBorder(),
              child: ElevatedButton(
                onPressed: () {
                  _submitLogin();
                }, // () => localStorage.reset(),
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
        content: SingleChildScrollView(child: Text(message)),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'OK');
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
    setState(() {
      _isLoading = false;
      _loginMessage = message;
    });
  }

  _getCategory() async {
    var result = await etestingRepo.getOwnerIdCategoryList();

    if (result.isSuccess) {
      for (var i = 0; i < result.data.length; i++) {
        setState(() {
          category.add(result.data[i].ownerCatDesc);
          ownerCategoryList.add({
            'owner_cat_desc': result.data[i].ownerCatDesc,
            'owner_cat': result.data[i].ownerCat,
          });
        });
      }
      return result.data;
    }
    return result.message;
  }

  Future<String?> _showCategory() async {
    String? message = '';
    final String? selected = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return Select(
              groupId: category,
              initialSelectedGroup: '',
              title: "Select Category");
        });
    if (selected != null) {
      var results = ownerCategoryList.firstWhere(
        (item) => item['owner_cat_desc'] == selected,
        orElse: () => {'owner_cat_desc': '', 'owner_cat': ''},
      );
      setState(() {
        selectedCategory = results['owner_cat_desc'];
        _isLoading = false;
      });
      message = await _jpjQTIloginBO(results['owner_cat']);
      // if (!mounted) return;
      // Navigator.of(context).pop();
    } else {
      setState(() {
        _isLoading = false;
      });
    }
    return message;
  }

  Future<String?> _jpjQTIloginBO(String id) async {
    EasyLoading.show(
      status: 'Checking jpjQTIloginBO',
      maskType: EasyLoadingMaskType.black,
    );
    var result = await authRepo.getLoginBO(
      idCategory: id,
      mySikapId: isKeyInIC
          ? _formKey.currentState?.fields['ic']?.value!
          : icController.text,
      permitCode: _formKey.currentState?.fields['permitCode']?.value!,
      skipThumbPrint: 'True',
    );

    if (result.isSuccess) {
      await EasyLoading.dismiss();
      if (!context.mounted) return '';
      await customDialog.show(
        context: context,
        title: const Center(
          child: Icon(
            Icons.check_circle_outline,
            color: Colors.green,
            size: 120,
          ),
        ),
        content: 'Success',
        barrierDismissable: false,
        onPressed: () {
          Navigator.of(context).pop();
          _submitLogin();
        },
        type: DialogType.SUCCESS,
      );
      return result.data;
    } else {
      await EasyLoading.dismiss();
      if (!context.mounted) return '';
      await customDialog.show(
        context: context,
        content: result.message,
        onPressed: () => Navigator.pop(context),
        type: DialogType.ERROR,
      );
      return result.message;
    }
  }

  _submitLogin() async {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      FocusScope.of(context).requestFocus(FocusNode());

      setState(() {
        _isLoading = true;
        _loginMessage = '';
      });

      Response<List<Result>> result = await authRepo.jpjQtiLoginWithMySikap(
        mySikapId: isKeyInIC
            ? _formKey.currentState?.fields['ic']?.value!
            : icController.text,
        permitCode: _formKey.currentState?.fields['permitCode']?.value!,
      );
      if(result.message != null){
        setState(() {
          _isLoading = false;
        });
        if (!context.mounted) return;
        await customDialog.show(
          context: context,
          content: result.message,
          onPressed: () => Navigator.pop(context),
          type: DialogType.ERROR,
        );
        return result.message;
      }
      if (result.data![0].result == 'False') {
        if (isKeyInIC) {
          if (!mounted) return;
          await _showCategory();
          print('object');
        } else {
          return;
        }
      } else {
        await localStorage.saveUserId(result.data![0].userId ?? '');
        await localStorage
            .saveDiCode(_formKey.currentState?.fields['permitCode']?.value!);
        await localStorage.saveMerchantDbCode(
            _formKey.currentState?.fields['permitCode']?.value!);
        await localStorage.saveMySikapId(isKeyInIC
            ? _formKey.currentState?.fields['ic']?.value!
            : icController.text);

        await localStorage
            .savePermitCode(_formKey.currentState?.fields['permitCode']?.value!);

        Response<List<Result2>?> result3 =
            await etestingRepo.getUserIdByMySikapId();
        if (!result3.isSuccess) {
          loginFail(result3.message!);
          return;
        }

        await localStorage.saveName(result3.data![0].firstName ?? '');

        await localStorage.saveLoginTime(DateTime.now().toString());
        if (!mounted) return;
        context.router.replace(const HomeSelect());
      }
      
    }
  }
}
