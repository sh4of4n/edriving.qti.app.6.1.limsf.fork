import 'dart:convert';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:edriving_qti_app/common_library/services/model/etesting_model.dart';
import 'package:edriving_qti_app/common_library/services/repository/etesting_repository.dart';
import 'package:edriving_qti_app/services/response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:edriving_qti_app/common_library/utils/app_localizations.dart';
import 'package:edriving_qti_app/common_library/utils/custom_button.dart';
import 'package:edriving_qti_app/common_library/utils/custom_dialog.dart';
import 'package:edriving_qti_app/common_library/utils/uppercase_formatter.dart';
import 'package:edriving_qti_app/utils/local_storage.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../router.gr.dart';

class GetVehicleInfo extends StatefulWidget {
  final String type;
  GetVehicleInfo({Key? key, required this.type}) : super(key: key);

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
  QRViewController? qrController;
  bool showCameraIcon = true;
  bool showQR = false;
  List<MysikapVehicle> vehicleArr = [];
  @override
  void initState() {
    super.initState();
    localStorage.getPermitCode().then((value) {
      _formKey.currentState!.fields['permitNo']!.didChange(value);
    });
    getMySikapVehicleListByStatus();
    //getSavedInfo();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      qrController?.pauseCamera();
    } else if (Platform.isIOS) {
      qrController?.resumeCamera();
    }
  }

  Future getMySikapVehicleListByStatus() async {
    EasyLoading.show(
      maskType: EasyLoadingMaskType.black,
    );
    var result =
        await etestingRepo.getMySikapVehicleListByStatus(status: 'CHECKED');
    if (result.isSuccess) {
      setState(() {
        vehicleArr = result.data;
      });
    }
    EasyLoading.dismiss();
    return result;
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 200.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Colors.red,
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: scanArea,
      ),
    );
  }

  Future<void> _onQRViewCreated(QRViewController qrController) async {
    setState(() {
      this.qrController = qrController;
    });
    await qrController.resumeCamera();
    qrController.scannedDataStream.listen((scanData) async {
      await qrController.pauseCamera();

      try {
        setState(() {
          _formKey.currentState!.patchValue({
            'groupId': jsonDecode(scanData.code!)['Table1'][0]['group_id'],
            'permitNo': jsonDecode(scanData.code!)['Table1'][0]['merchant_no'],
            'carNo': jsonDecode(scanData.code!)['Table1'][0]['car_no'],
            'plateNo': jsonDecode(scanData.code!)['Table1'][0]['plate_no'],
          });

          showCameraIcon = true;
          showQR = false;
        });
      } catch (e) {
        customDialog.show(
          barrierDismissable: true,
          context: context,
          content: AppLocalizations.of(context)!.translate('invalid_qr'),
          customActions: [
            TextButton(
              onPressed: () {
                context.router.pop();

                qrController.resumeCamera();
              },
              child: Text('Ok'),
            ),
          ],
          type: DialogType.GENERAL,
        );
      }
    });
  }

  @override
  void dispose() {
    groupIdFocus.dispose();
    plateNoFocus.dispose();
    carNoFocus.dispose();
    qrController?.dispose();
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

  _submit() {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      FocusScope.of(context).requestFocus(new FocusNode());

      localStorage
          .saveEnrolledGroupId(_formKey.currentState?.fields['groupId']?.value);
      localStorage.saveCarNo(
          _formKey.currentState?.fields['carNo']?.value.replaceAll(' ', ''));
      localStorage.savePlateNo(
          _formKey.currentState?.fields['plateNo']?.value.replaceAll(' ', ''));
      localStorage.saveMerchantDbCode(
          _formKey.currentState?.fields['permitNo']?.value.replaceAll(' ', ''));
      localStorage.saveType(widget.type);
      if (widget.type == "RPK") {
        context.router.pushAndPopUntil(HomePageRpk(), predicate: (r) => false);
      } else if (widget.type == "Jalan Raya") {
        context.router.pushAndPopUntil(Home(), predicate: (r) => false);
      }
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
            title: Text('Get Vehicle Info'),
          ),
          body: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              child: FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      width: 1300.w,
                      margin: EdgeInsets.symmetric(vertical: 30.h),
                      child: FormBuilderDropdown(
                        name: 'groupId',
                        items: ['D', 'DA']
                            .map(
                              (gender) => DropdownMenuItem(
                                value: gender,
                                child: Text(gender),
                              ),
                            )
                            .toList(),
                        focusNode: groupIdFocus,
                        decoration: InputDecoration(
                          labelText: 'Group ID',
                        ),
                        validator: FormBuilderValidators.compose(
                          [FormBuilderValidators.required()],
                        ),
                      ),
                    ),
                    Container(
                      width: 1300.w,
                      margin: EdgeInsets.symmetric(vertical: 30.h),
                      child: FormBuilderTextField(
                        name: 'carNo',
                        inputFormatters: [UpperCaseTextFormatter()],
                        focusNode: carNoFocus,
                        decoration: InputDecoration(
                          labelText: 'Car No',
                          suffixIcon: IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () {
                              _formKey.currentState!.fields['carNo']?.reset();
                            },
                          ),
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                      ),
                    ),
                    Container(
                      width: 1300.w,
                      margin: EdgeInsets.symmetric(vertical: 30.h),
                      child: FormBuilderField(
                        name: 'plateNo',
                        builder: (field) {
                          return DropdownSearch<MysikapVehicle>(
                            items: vehicleArr,
                            selectedItem: field.value != null
                                ? MysikapVehicle(
                                    plateNo: field.value.toString(),
                                  )
                                : MysikapVehicle(
                                    plateNo: '',
                                  ),
                            dropdownDecoratorProps: DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
                                labelText: AppLocalizations.of(context)!
                                    .translate('plate_no'),
                              ),
                            ),
                            validator: (MysikapVehicle? i) {
                              if (i == null) return field.errorText;
                              return null;
                            },
                            itemAsString: (MysikapVehicle u) => u.plateNo!,
                            compareFn: (i, s) => i.plateNo == s.plateNo,
                            onChanged: ((value) {
                              field.didChange(value!.plateNo);
                            }),
                            popupProps:
                                PopupPropsMultiSelection.modalBottomSheet(
                              isFilterOnline: true,
                              showSelectedItems: true,
                              showSearchBox: true,
                              itemBuilder: (context, item, isSelected) {
                                return Container(
                                  margin: EdgeInsets.symmetric(horizontal: 8),
                                  decoration: !isSelected
                                      ? null
                                      : BoxDecoration(
                                          border: Border.all(
                                              color: Theme.of(context)
                                                  .primaryColor),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.white,
                                        ),
                                  child: ListTile(
                                    selected: isSelected,
                                    title: Text(item.plateNo ?? ''),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                      ),

                      // FormBuilderTextField(
                      //   name: 'plateNo',
                      //   inputFormatters: [UpperCaseTextFormatter()],
                      //   focusNode: plateNoFocus,
                      //   decoration: InputDecoration(
                      //     labelText: 'Plate No',
                      //   ),
                      //   validator: FormBuilderValidators.compose([
                      //     FormBuilderValidators.required(),
                      //   ]),
                      // ),
                    ),
                    Container(
                      width: 1300.w,
                      margin: EdgeInsets.symmetric(vertical: 30.h),
                      child: FormBuilderTextField(
                        name: 'permitNo',
                        inputFormatters: [UpperCaseTextFormatter()],
                        focusNode: merchantNoFocus,
                        decoration: InputDecoration(
                          labelText: 'Permit No',
                          suffixIcon: IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () {
                              _formKey.currentState!.fields['permitNo']
                                  ?.reset();
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Permit No is required.';
                          }
                          return null;
                        },
                      ),
                    ),
                    Visibility(
                      visible: showQR,
                      child: Container(
                        width: 300,
                        height: 300,
                        child: _buildQrView(context),
                      ),
                    ),
                    Visibility(
                      visible: showCameraIcon,
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 100.h),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              showQR = true;
                              showCameraIcon = false;
                            });
                          },
                          iconSize: 250,
                          icon: Icon(Icons.camera_alt),
                        ),
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
            ? Icon(
                Icons.close,
                size: 18,
                color: Colors.white,
              )
            : SizedBox(
                height: 18,
                width: 18,
              ),
      ),
    );
  }
}
