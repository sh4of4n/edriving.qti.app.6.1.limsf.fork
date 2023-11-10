import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:edriving_qti_app/component/profile.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:edriving_qti_app/common_library/services/model/etesting_model.dart';
import 'package:edriving_qti_app/common_library/services/repository/etesting_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:edriving_qti_app/common_library/utils/app_localizations.dart';
import 'package:edriving_qti_app/common_library/utils/custom_button.dart';
import 'package:edriving_qti_app/common_library/utils/custom_dialog.dart';
import 'package:edriving_qti_app/common_library/utils/uppercase_formatter.dart';
import 'package:edriving_qti_app/utils/local_storage.dart';

import '../../common_library/services/response.dart';
import '../../router.gr.dart';

@RoutePage(name: 'GetVehicleInfo')
class GetVehicleInfo extends StatefulWidget {
  final String type;
  const GetVehicleInfo({super.key, required this.type});

  @override
  _GetVehicleInfoState createState() => _GetVehicleInfoState();
}

class _GetVehicleInfoState extends State<GetVehicleInfo> {
  final _formKey = GlobalKey<FormBuilderState>();
  final localStorage = LocalStorage();
  final customDialog = CustomDialog();
  final groupIdFocus = FocusNode();
  final plateNoFocus = FocusNode();
  final carNoFocus = FocusNode();
  final merchantNoFocus = FocusNode();
  final etestingRepo = EtestingRepo();

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool showCameraIcon = true;
  List<MysikapVehicle> vehicleArr = [];
  @override
  void initState() {
    super.initState();
    localStorage.getPermitCode().then((value) {
      _formKey.currentState!.fields['permitNo']!.didChange(value);
    });
    // getMySikapVehicleListByStatusPart();
    //getSavedInfo();
  }

  Future getMySikapVehicleListByStatusPart() async {
    EasyLoading.show(
      maskType: EasyLoadingMaskType.black,
    );
    var result = await etestingRepo.getMySikapVehicleListByStatusPart(
        status: 'CHECKED', part: widget.type == 'RPK' ? 'RPK' : '3');
    if (result.isSuccess) {
      if (mounted) {
        setState(() {
          vehicleArr = result.data;
        });
      }
    }
    EasyLoading.dismiss();
    return result;
  }

  @override
  void dispose() {
    groupIdFocus.dispose();
    plateNoFocus.dispose();
    carNoFocus.dispose();
    super.dispose();
  }

  getSavedInfo() async {
    _formKey.currentState!.patchValue({
      'groupId': await localStorage.getEnrolledGroupId() ?? '',
      'permitNo': await localStorage.getMerchantDbCode() ?? '',
      'carNo': await localStorage.getCarNo() ?? '',
      'plateNo': await localStorage.getPlateNo() ?? '',
    });
  }

  _submit() async {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      FocusScope.of(context).requestFocus(FocusNode());

      localStorage
          .saveEnrolledGroupId(_formKey.currentState?.fields['groupId']?.value ?? '');
      localStorage.saveCarNo(
          (_formKey.currentState?.fields['carNo']?.value ?? '')
              .replaceAll(' ', ''));
      localStorage.savePlateNo(
          _formKey.currentState?.fields['plateNo']?.value.replaceAll(' ', ''));
      localStorage.saveMerchantDbCode(
          _formKey.currentState?.fields['permitNo']?.value.replaceAll(' ', ''));
      localStorage.saveType(widget.type);
      if (widget.type == "RPK") {
        context.router
            .pushAndPopUntil(const HomePageRpk(), predicate: (r) => false);
      } else if (widget.type == "Jalan Raya") {
        context.router.pushAndPopUntil(const Home(), predicate: (r) => false);
      }
    }
  }

  bool isJson(String str) {
    try {
      json.decode(str);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        EasyLoading.dismiss();
        return true;
      },
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Maklumat Kenderaan'),
          ),
          floatingActionButton: FloatingActionButton.extended(
            label: const Text('Scan QR Code'),
            onPressed: () async {
              var scanData = await context.router.push(QrScannerRoute());
              if (scanData != null) {
                try {
                  EasyLoading.show(
                    maskType: EasyLoadingMaskType.black,
                  );

                  String plateNo = '';
                  String groupId = '';
                  String merchantNo = '';
                  String carNo = '';
                  if (isJson(scanData.toString())) {
                    plateNo = jsonDecode(scanData.toString())['Table1'][0]
                        ['plate_no'];
                    groupId = jsonDecode(scanData.toString())['Table1'][0]
                        ['group_id'];
                    merchantNo = jsonDecode(scanData.toString())['Table1'][0]
                        ['merchant_no'];
                    carNo =
                        jsonDecode(scanData.toString())['Table1'][0]['car_no'];
                  } else {
                    Response decryptQrcode = await etestingRepo.decryptQrcode(
                      qrcodeJson: scanData.toString(),
                    );
                    if (!decryptQrcode.isSuccess) {
                      EasyLoading.dismiss();
                      if (!mounted) return;
                      await showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('JPJ QTI APP'),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: <Widget>[
                                  Text(decryptQrcode.message ?? ''),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                      EasyLoading.dismiss();
                      return;
                    }
                    plateNo = decryptQrcode.data[0].plateNo;
                    groupId = decryptQrcode.data[0].groupId;
                    merchantNo = decryptQrcode.data[0].merchantNo;
                    carNo = decryptQrcode.data[0].carNo;
                  }

                  var vehicleResult =
                      await etestingRepo.isVehicleAvailableByUserId(
                    plateNo: plateNo,
                  );
                  EasyLoading.dismiss();
                  if (vehicleResult.data != 'True') {
                    if (!mounted) return;
                    await showDialog(
                      context: context,
                      barrierDismissible: false, // user must tap button!
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('JPJ QTI APP'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Text(vehicleResult.message ?? ''),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                    return;
                  }

                  setState(() {
                    _formKey.currentState!.patchValue({
                      'groupId': groupId,
                      'permitNo': merchantNo,
                      'carNo': carNo,
                      'plateNo': plateNo,
                    });

                    showCameraIcon = true;
                  });
                } catch (e) {
                  EasyLoading.dismiss();
                  if (mounted) {
                    customDialog.show(
                      barrierDismissable: false,
                      context: context,
                      content:
                          AppLocalizations.of(context)!.translate('invalid_qr'),
                      customActions: [
                        TextButton(
                          onPressed: () {
                            context.router.pop();
                          },
                          child: const Text('Ok'),
                        ),
                      ],
                      type: DialogType.GENERAL,
                    );
                  }
                }
              }
            },
            icon: const Icon(Icons.qr_code_scanner),
          ),
          body: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    const ProfileWidget(),
                    // Container(
                    //   width: 1300.w,
                    //   margin: EdgeInsets.symmetric(vertical: 30.h),
                    //   child: FormBuilderField(
                    //     name: 'plateNo',
                    //     builder: (field) {
                    //       return InputDecorator(
                    //         decoration: InputDecoration(
                    //           errorText: field.errorText,
                    //           border: InputBorder.none,
                    //           contentPadding:
                    //               const EdgeInsets.only(top: 10.0, bottom: 0.0),
                    //         ),
                    //         child: DropdownSearch<MysikapVehicle>(
                    //           enabled: false,
                    //           items: vehicleArr,
                    //           selectedItem: field.value != null
                    //               ? MysikapVehicle(
                    //                   plateNo: field.value.toString(),
                    //                 )
                    //               : MysikapVehicle(
                    //                   plateNo: '',
                    //                 ),
                    //           dropdownDecoratorProps: DropDownDecoratorProps(
                    //             dropdownSearchDecoration: InputDecoration(
                    //               labelText: AppLocalizations.of(context)!
                    //                   .translate('plate_no'),
                    //             ),
                    //           ),
                    //           validator: (MysikapVehicle? i) {
                    //             if (i == null) return field.errorText;
                    //             return null;
                    //           },
                    //           itemAsString: (MysikapVehicle u) => u.plateNo!,
                    //           compareFn: (i, s) => i.plateNo == s.plateNo,
                    //           onChanged: ((value) {
                    //             field.didChange(value!.plateNo);
                    //             _formKey.currentState!.fields['groupId']!
                    //                 .didChange(value.groupId);
                    //             _formKey.currentState!.fields['carNo']!
                    //                 .didChange(value.carNo);
                    //           }),
                    //           popupProps:
                    //               PopupPropsMultiSelection.modalBottomSheet(
                    //             isFilterOnline: true,
                    //             showSelectedItems: true,
                    //             showSearchBox: true,
                    //             itemBuilder: (context, item, isSelected) {
                    //               return Container(
                    //                 margin: const EdgeInsets.symmetric(
                    //                     horizontal: 8),
                    //                 decoration: !isSelected
                    //                     ? null
                    //                     : BoxDecoration(
                    //                         border: Border.all(
                    //                             color: Theme.of(context)
                    //                                 .primaryColor),
                    //                         borderRadius:
                    //                             BorderRadius.circular(5),
                    //                         color: Colors.white,
                    //                       ),
                    //                 child: ListTile(
                    //                   selected: isSelected,
                    //                   title: Text(item.plateNo ?? ''),
                    //                   subtitle: Text(
                    //                       '${item.groupId?.toString() ?? ''}, ${item.carNo?.toString() ?? ''}'),
                    //                 ),
                    //               );
                    //             },
                    //           ),
                    //         ),
                    //       );
                    //     },
                    //     validator: FormBuilderValidators.compose([
                    //       FormBuilderValidators.required(
                    //           errorText: 'Please scan QR code'),
                    //     ]),
                    //   ),
                    // ),
                    Container(
                      width: 1300.w,
                      margin: EdgeInsets.symmetric(vertical: 30.h),
                      child: FormBuilderTextField(
                        name: 'plateNo',
                        enabled: false,
                        inputFormatters: [UpperCaseTextFormatter()],
                        focusNode: merchantNoFocus,
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!
                              .translate('plate_no'),
                        ),
                      ),
                    ),
                    Container(
                      width: 1300.w,
                      margin: EdgeInsets.symmetric(vertical: 30.h),
                      child: FormBuilderTextField(
                        name: 'groupId',
                        enabled: false,
                        inputFormatters: [UpperCaseTextFormatter()],
                        focusNode: merchantNoFocus,
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!
                              .translate('group_id'),
                        ),
                      ),
                    ),
                    Container(
                      width: 1300.w,
                      margin: EdgeInsets.symmetric(vertical: 30.h),
                      child: FormBuilderTextField(
                        name: 'carNo',
                        enabled: false,
                        inputFormatters: [UpperCaseTextFormatter()],
                        focusNode: carNoFocus,
                        decoration: InputDecoration(
                          labelText:
                              AppLocalizations.of(context)!.translate('car_no'),
                          // suffixIcon: IconButton(
                          //   icon: Icon(Icons.close),
                          //   onPressed: () {
                          //     _formKey.currentState!.fields['carNo']?.reset();
                          //   },
                          // ),
                        ),
                        // validator: FormBuilderValidators.compose([
                        //   FormBuilderValidators.required(),
                        // ]),
                      ),
                    ),
                    Container(
                      width: 1300.w,
                      margin: EdgeInsets.symmetric(vertical: 30.h),
                      child: FormBuilderTextField(
                        name: 'permitNo',
                        enabled: false,
                        inputFormatters: [UpperCaseTextFormatter()],
                        focusNode: merchantNoFocus,
                        decoration: const InputDecoration(
                          labelText: 'Permit No',
                          // suffixIcon: IconButton(
                          //   icon: const Icon(Icons.close),
                          //   onPressed: () {
                          //     _formKey.currentState!.fields['permitNo']
                          //         ?.reset();
                          //   },
                          // ),
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                              errorText: 'Permit No is required'),
                        ]),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 30.h),
                      child: CustomButton(
                        onPressed: _submit,
                        buttonColor: Colors.blue,
                        title: 'Save',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget customCheckbox(String index, var item) {
    return ListTile(
      onTap: () {
        setState(() {
          item.isCheck = !item.isCheck;
        });
      },
      title: Text(
        '$index. ${item.checkDesc}',
        style: TextStyle(
          fontWeight:
              item.mandatory == 'false' ? FontWeight.normal : FontWeight.bold,
        ),
      ),
      trailing: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: item.isCheck ? Colors.blue : Colors.grey.shade700,
          ),
          color: item.isCheck ? Colors.blue : Colors.white,
        ),
        child: item.isCheck
            ? const Icon(
                Icons.close,
                size: 18,
                color: Colors.white,
              )
            : const SizedBox(
                height: 18,
                width: 18,
              ),
      ),
    );
  }
}
