import 'dart:convert';

import 'package:edriving_qti_app/common_library/utils/custom_dialog.dart';
import 'package:edriving_qti_app/utils/local_storage.dart';
import '../../../utils/app_config.dart';
import '../model/epandu_model.dart';
import '../networking.dart';
import '../response.dart';
import 'package:html_unescape/html_unescape_small.dart';

class EpanduRepo {
  final appConfig = AppConfig();
  final localStorage = LocalStorage();
  final networking = Networking();
  final unescape = HtmlUnescape();
  final customDialog = CustomDialog();

  Future<Response> getEnrollByCode({groupId}) async {
    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwdEncode();
    //  Temporarily use TBS as diCode
    String diCode = appConfig.diCode;
    // String diCode = await localStorage.getDiCode();
    // String groupId = '';
    String? icNo = await localStorage.getStudentIc();

    String path =
        'wsCodeCrypt=${appConfig.wsCodeCrypt}&caUid=$caUid&caPwd=$caPwd&diCode=$diCode&icNo=$icNo&groupId=${groupId ?? ''}';

    var response = await networking.getData(
      path: 'GetEnrollByCode?$path',
    );

    if (response.isSuccess && response.data != null) {
      GetEnrollmentResponse getEnrollmentResponse;

      getEnrollmentResponse = GetEnrollmentResponse.fromJson(response.data);

      // not relevant anymore as there could be more than one enrollment
      // localStorage.saveEnrolledGroupId(getEnrollmentResponse.enroll[0].groupId);
      // localStorage.saveBlacklisted(getEnrollmentResponse.enroll[0].blacklisted);

      return Response(true, data: getEnrollmentResponse.enroll);
    }

    return Response(false, message: 'You have no class enrolled.');
  }

  Future<Response> getCollectionByStudent(
      {required context, startIndex}) async {
    assert(context != null);

    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwdEncode();

    //  Temporarily use TBS as diCode
    String diCode = appConfig.diCode;
    // String diCode = await localStorage.getDiCode();
    String? icNo = await localStorage.getStudentIc();

    String path =
        'wsCodeCrypt=${appConfig.wsCodeCrypt}&caUid=$caUid&caPwd=$caPwd&diCode=$diCode&icNo=$icNo&startIndex=$startIndex&noOfRecords=10';

    var response = await networking.getData(
      path: 'GetCollectionByStudentV2?$path',
    );

    if (response.isSuccess && response.data != null) {
      StudentPaymentResponse studentPaymentResponse;

      studentPaymentResponse = StudentPaymentResponse.fromJson(response.data);

      return Response(true, data: studentPaymentResponse.collectTrn);
    }

    return Response(false, message: 'You have no payment history');
  }

  Future<Response> getCollectionDetailByRecpNo(
      {required context, recpNo}) async {
    assert(context != null);

    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwdEncode();

    //  Temporarily use TBS as diCode
    String diCode = appConfig.diCode;
    // String diCode = await localStorage.getDiCode();

    String path =
        'wsCodeCrypt=${appConfig.wsCodeCrypt}&caUid=$caUid&caPwd=$caPwd&diCode=$diCode&recpNo=$recpNo';

    var response = await networking.getData(
      path: 'GetCollectionDetailByRecpNo?$path',
    );

    if (response.isSuccess && response.data != null) {
      GetCollectionDetailByRecpNoResponse getCollectionDetailByRecpNoResponse;

      getCollectionDetailByRecpNoResponse =
          GetCollectionDetailByRecpNoResponse.fromJson(response.data);

      return Response(true,
          data: getCollectionDetailByRecpNoResponse.collectDetail);
    }

    return Response(false, message: 'No records found.');
  }

  Future<Response> getDTestByCode({required context}) async {
    assert(context != null);

    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwdEncode();

    //  Temporarily use TBS as diCode
    String? diCode = await localStorage.getDiCode();
    // String diCode = await localStorage.getDiCode();
    // String groupId = await localStorage.getEnrolledGroupId();
    String? icNo = await localStorage.getStudentIc();

    String path =
        'wsCodeCrypt=${appConfig.wsCodeCrypt}&caUid=$caUid&caPwd=$caPwd&diCode=$diCode&icNo=$icNo&groupId=';

    var response = await networking.getData(
      path: 'GetDTestByCode?$path',
    );

    if (response.isSuccess && response.data != null) {
      GetDTestByCodeResponse getDTestByCodeResponse;

      getDTestByCodeResponse = GetDTestByCodeResponse.fromJson(response.data);

      return Response(true, data: getDTestByCodeResponse.dTest);
    }

    return Response(false, message: 'You have no booking.');
  }

  // booking
  /* Future<Response> getBookingTest({
    context,
    groupId,
    testType,
  }) async {
    assert(context != null);

    String caUid = await localStorage.getCaUid();
    String caPwd = await localStorage.getCaPwdEncode();

    String diCode = await localStorage.getDiCode();
    // String groupId = await localStorage.getEnrolledGroupId();
    String icNo = await localStorage.getStudentIc();

    String path =
        'wsCodeCrypt=${appConfig.wsCodeCrypt}&caUid=$caUid&caPwd=$caPwd&diCode=$diCode&groupId=${groupId ?? ''}&testType=${testType ?? ''}&icNo=$icNo';

    var response = await networking.getData(
      path: 'GetBookingTest?$path',
    );

    if (response.isSuccess && response.data != null) {
      GetBookingTestResponse getBookingTestResponse;

      getBookingTestResponse = GetBookingTestResponse.fromJson(response.data);

      return Response(true, data: getBookingTestResponse.dTest);
    } else if (response.message != null &&
        response.message.contains('timeout')) {
      return Response(false,
          message: AppLocalizations.of(context).translate('timeout_exception'));
    } else if (response.message != null &&
        response.message.contains('socket')) {
      return Response(false,
          message: AppLocalizations.of(context).translate('socket_exception'));
    } else if (response.message != null && response.message.contains('http')) {
      return Response(false,
          message: AppLocalizations.of(context).translate('http_exception'));
    } else if (response.message != null &&
        response.message.contains('format')) {
      return Response(false,
          message: AppLocalizations.of(context).translate('format_exception'));
    }

    return Response(false,
        message: AppLocalizations.of(context).translate('no_records_found'));
  } */

  Future<Response> getTestListGroupId({
    required context,
  }) async {
    assert(context != null);

    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwdEncode();

    String? diCode = await localStorage.getDiCode();
    // String groupId = await localStorage.getEnrolledGroupId();

    String path =
        'wsCodeCrypt=${appConfig.wsCodeCrypt}&caUid=$caUid&caPwd=$caPwd&diCode=$diCode';

    var response = await networking.getData(
      path: 'GetTestListGroupId?$path',
    );

    if (response.isSuccess && response.data != null) {
      GetTestListGroupIdResponse getTestListGroupIdResponse;

      getTestListGroupIdResponse =
          GetTestListGroupIdResponse.fromJson(response.data);

      return Response(true, data: getTestListGroupIdResponse.test);
    }

    return Response(false, message: 'No records found.');
  }

  Future<Response> getTestListGroupIdByIcNo({
    required context,
  }) async {
    assert(context != null);

    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwdEncode();
    String? icNo = await localStorage.getStudentIc();
    String? diCode = await localStorage.getDiCode();
    // String groupId = await localStorage.getEnrolledGroupId();

    String path =
        'wsCodeCrypt=${appConfig.wsCodeCrypt}&caUid=$caUid&caPwd=$caPwd&diCode=$diCode&icNo=$icNo';

    var response = await networking.getData(
      path: 'GetTestListGroupIdByIcNo?$path',
    );

    if (response.isSuccess && response.data != null) {
      GetTestListGroupIdResponse getTestListGroupIdResponse;

      getTestListGroupIdResponse =
          GetTestListGroupIdResponse.fromJson(response.data);

      return Response(true, data: getTestListGroupIdResponse.test);
    }

    return Response(false, message: 'No records found.');
  }

  Future<Response> getTestListTestType({
    required context,
    groupId,
  }) async {
    assert(context != null);

    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwdEncode();

    String? diCode = await localStorage.getDiCode();
    // String groupId = await localStorage.getEnrolledGroupId();

    String path =
        'wsCodeCrypt=${appConfig.wsCodeCrypt}&caUid=$caUid&caPwd=$caPwd&diCode=$diCode&groupId=$groupId';

    var response = await networking.getData(
      path: 'GetTestListTestType?$path',
    );

    if (response.isSuccess && response.data != null) {
      GetTestListTestTypeResponse getTestListTestTypeResponse;

      getTestListTestTypeResponse =
          GetTestListTestTypeResponse.fromJson(response.data);

      return Response(true, data: getTestListTestTypeResponse.test);
    }

    return Response(false, message: 'No records found.');
  }

  Future<Response> getTestList({
    required context,
    groupId,
    testType,
  }) async {
    assert(context != null);

    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwdEncode();

    String? diCode = await localStorage.getDiCode();
    // String groupId = await localStorage.getEnrolledGroupId();

    String path =
        'wsCodeCrypt=${appConfig.wsCodeCrypt}&caUid=$caUid&caPwd=$caPwd&diCode=$diCode&groupId=${groupId ?? ''}&testType=${testType ?? ''}';

    var response = await networking.getData(
      path: 'GetTestList?$path',
    );

    if (response.isSuccess && response.data != null) {
      GetTestListResponse getTestListResponse;

      getTestListResponse = GetTestListResponse.fromJson(response.data);

      return Response(true, data: getTestListResponse.test);
    }

    return Response(false, message: 'No records found.');
  }

  Future<Response> getCourseSectionList({
    required context,
    groupId,
  }) async {
    assert(context != null);

    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwdEncode();

    String? diCode = await localStorage.getDiCode();
    // String groupId = await localStorage.getEnrolledGroupId();

    String path =
        'wsCodeCrypt=${appConfig.wsCodeCrypt}&caUid=$caUid&caPwd=$caPwd&diCode=$diCode&groupId=${groupId ?? ''}';

    var response = await networking.getData(
      path: 'GetCourseSectionList?$path',
    );

    if (response.isSuccess && response.data != null) {
      GetCourseSectionListResponse getCourseSectionListResponse;

      getCourseSectionListResponse =
          GetCourseSectionListResponse.fromJson(response.data);

      return Response(true, data: getCourseSectionListResponse.courseSection);
    }

    return Response(false, message: 'No records found.');
  }

  Future<Response> saveBookingTest({
    context,
    userId,
    groupId,
    testType,
    testDate,
    courseSection,
  }) async {
    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwd();
    String? diCode = await localStorage.getDiCode();
    String? icNo = await localStorage.getStudentIc();

    SaveBookingTestRequest saveUserPasswordRequest = SaveBookingTestRequest(
      wsCodeCrypt: appConfig.wsCodeCrypt,
      caUid: caUid,
      caPwd: caPwd,
      diCode: diCode,
      groupId: groupId,
      testType: testType,
      testDate: testDate,
      courseSection: courseSection,
      icNo: icNo,
      userId: userId,
    );

    String body = jsonEncode(saveUserPasswordRequest);
    String api = 'SaveBookingTest';
    Map<String, String> headers = {'Content-Type': 'application/json'};

    var response =
        await networking.postData(api: api, body: body, headers: headers);

    if (response.isSuccess && response.data == 'True') {
      return Response(true);
    }

    return Response(false,
        message: response.message!.replaceAll(r'\u000d\u000a', ''));
  }

  Future<Response> getJpjTestCheckIn() async {
    // String customUrl =
    //     'http://192.168.168.2/etesting.MainService/${appConfig.wsVer}/MainService.svc';

    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwdEncode();
    String? icNo = await localStorage.getStudentIc();
    String? userId = await localStorage.getUserId();

    String? diCode = await localStorage.getDiCode();
    // String groupId = await localStorage.getEnrolledGroupId();

    String path =
        'wsCodeCrypt=${appConfig.wsCodeCrypt}&caUid=$caUid&caPwd=$caPwd&diCode=$diCode&userId=$userId&icNo=$icNo';

    var response = await networking.getData(
      path: 'GetJpjTestCheckIn?$path',
    );

    if (response.isSuccess && response.data != null) {
      GetJpjTestCheckInResponse getJpjTestCheckInResponse;

      getJpjTestCheckInResponse =
          GetJpjTestCheckInResponse.fromJson(response.data);

      return Response(true, data: getJpjTestCheckInResponse.jpjTestTrn);
    }

    return Response(false, message: 'No records found.');
  }

  Future<Response> getLastJpjTestCheckInByInterval({
    String? intervalInSeconds,
  }) async {
    // String customUrl =
    //     'http://192.168.168.2/etesting.MainService/${appConfig.wsVer}/MainService.svc';

    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwdEncode();
    String? diCode = await localStorage.getMerchantDbCode();
    // String groupId = await localStorage.getEnrolledGroupId();

    String path =
        'wsCodeCrypt=${appConfig.wsCodeCrypt}&caUid=$caUid&caPwd=$caPwd&diCode=$diCode&intervalInSeconds=${intervalInSeconds ?? ''}';

    var response = await networking.getData(
      path: 'GetLastJpjTestCheckInByInterval?$path',
    );

    if (response.isSuccess && response.data != null) {
      GetLastJpjTestCheckInByIntervalResponse
          getLastJpjTestCheckInByIntervalResponse;

      getLastJpjTestCheckInByIntervalResponse =
          GetLastJpjTestCheckInByIntervalResponse.fromJson(response.data);

      return Response(true,
          data: getLastJpjTestCheckInByIntervalResponse.jpjTestTrn);
    }

    return Response(false, message: 'No records found.');
  }

  Future<Response> verifyScanCode({
    context,
    required qrcodeJson,
    required icNo,
  }) async {
    // String customUrl =
    //     'http://192.168.168.2/etesting.MainService/${appConfig.wsVer}/MainService.svc';

    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwd();
    String? diCode = await localStorage.getMerchantDbCode();
    String? userId = await localStorage.getUserId();

    VerifyScanCodeRequest verifyScanCodeRequest = VerifyScanCodeRequest(
      wsCodeCrypt: appConfig.wsCodeCrypt,
      caUid: caUid,
      caPwd: caPwd,
      icNo: icNo,
      diCode: diCode,
      userId: userId,
      qrcodeJson: qrcodeJson,
    );

    /* customDialog.show(
      context: context,
      title: Text('$customUrl/webapi/VerifyScanCodeByIcNo'),
      content:
          'wsCodeCrypt: ${appConfig.wsCodeCrypt}, caUid: $caUid, caPwd: $caPwd, icNo: $icNo, merchantNo: $diCode, userId: $userId, qrCodeJson: $qrcodeJson',
      customActions: [
        TextButton(
          child: Text(AppLocalizations.of(context).translate('ok_btn')),
          onPressed: () => ExtendedNavigator.of(context).pop(),
        ),
      ],
      type: DialogType.GENERAL,
    ); */

    String body = jsonEncode(verifyScanCodeRequest);
    String api = 'VerifyScanCodeByIcNo';
    Map<String, String> headers = {'Content-Type': 'application/json'};

    var response =
        await networking.postData(api: api, body: body, headers: headers);

    if (response.isSuccess && response.data != null) {
      VerifyScanCodeResponse verifyScanCodeResponse =
          VerifyScanCodeResponse.fromJson(response.data);

      return Response(true, data: verifyScanCodeResponse.jpjTestTrn);
    }

    return Response(false,
        message: response.message == null || response.message!.isEmpty
            ? 'Queue number not created. Please try again.'
            : response.message!.replaceAll(r'\u000d\u000a', ''));
  }

  Future<Response> getScanCodeByAction() async {
    // String customUrl =
    //     'https://192.168.168.2/etesting.MainService/${appConfig.wsVer}/MainService.svc';

    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwdEncode();
    String? diCode = await localStorage.getMerchantDbCode();

    String path =
        'wsCodeCrypt=${appConfig.wsCodeCrypt}&caUid=$caUid&caPwd=$caPwd&diCode=$diCode&userId=&action=JPJ_PART2_CHECK_IN';

    var response = await networking.getData(
      path: 'GetScanCodeByAction?$path',
    );

    if (response.isSuccess && response.data != null) {
      GetScanCodeByActionResponse getScanCodeByActionResponse =
          GetScanCodeByActionResponse.fromJson(response.data);

      return Response(true, data: getScanCodeByActionResponse.table1);
    }

    return Response(false,
        message: response.message == null || response.message!.isEmpty
            ? 'Failed to receive QR code data. Please try again.'
            : response.message!.replaceAll(r'\u000d\u000a', ''));
  }

  Future<Response> getLastCallingJpjTestQueueNumber({context}) async {
    // String customUrl =
    //     'http://192.168.168.2/etesting.MainService/${appConfig.wsVer}/MainService.svc';

    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwdEncode();
    String? diCode = await localStorage.getMerchantDbCode();

    String path =
        'wsCodeCrypt=${appConfig.wsCodeCrypt}&caUid=$caUid&caPwd=$caPwd&diCode=$diCode';

    /* customDialog.show(
      context: context,
      title: Text('GetLastCallingJpjTestQueueNumber'),
      content:
          '$customUrl/webapi/GetLastCallingJpjTestQueueNumber?wsCodeCrypt=${appConfig.wsCodeCrypt}&caUid=$caUid&caPwd=$caPwd&diCode=W1007',
      customActions: [
        TextButton(
          child: Text(AppLocalizations.of(context).translate('ok_btn')),
          onPressed: () => ExtendedNavigator.of(context).pop(),
        ),
      ],
      type: DialogType.GENERAL,
    ); */

    var response = await networking.getData(
      path: 'GetLastCallingJpjTestQueueNumber?$path',
    );

    if (response.isSuccess && response.data != null) {
      GetLastCallingJpjTestQueueNumberResponse
          getLastCallingJpjTestQueueNumberResponse =
          GetLastCallingJpjTestQueueNumberResponse.fromJson(response.data);

      return Response(true,
          data: getLastCallingJpjTestQueueNumberResponse.jpjTestTrn);
    }

    return Response(false,
        message: response.message == null || response.message!.isEmpty
            ? 'Tiada nombor giliran.'
            : response.message!.replaceAll(r'\u000d\u000a', ''));
  }

  Future<Response> getPart3AvailableToCallJpjTestList(
      {vehNo, required part3Type}) async {
    // String customUrl =
    //     'http://192.168.168.2/etesting.MainService/${appConfig.wsVer}/MainService.svc';

    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwdEncode();
    String? userId = await localStorage.getUserId();
    String? diCode = await localStorage.getMerchantDbCode();

    String path =
        'wsCodeCrypt=${appConfig.wsCodeCrypt}&caUid=$caUid&caPwd=$caPwd&diCode=$diCode&userId=$userId&vehNo=$vehNo&part3Type=${Uri.encodeComponent(part3Type)}';

    var response = await networking.getData(
      path: 'GetPart3AvailableToCallJpjTestList?$path',
    );

    if (response.isSuccess && response.data != null) {
      GetPart3AvailableToCallJpjTestListResponse
          getPart3AvailableToCallJpjTestListResponse =
          GetPart3AvailableToCallJpjTestListResponse.fromJson(response.data);

      return Response(true,
          data: getPart3AvailableToCallJpjTestListResponse.jpjTestTrn);
    }

    return Response(false,
        message: response.message == null || response.message!.isEmpty
            ? 'Tidak ada calon dalam barisan.'
            : response.message!.replaceAll(r'\u000d\u000a', ''));
  }

  Future<Response> callPart3JpjTest({
    context,
    required vehNo,
    required part3Type,
    required groupId,
    required icNo,
    required testCode,
  }) async {
    // String customUrl =
    //     'http://192.168.168.2/etesting.MainService/${appConfig.wsVer}/MainService.svc';

    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwd();
    String? diCode = await localStorage.getMerchantDbCode();
    String? userId = await localStorage.getUserId();

    CallPart3JpjTestRequest verifyScanCodeRequest = CallPart3JpjTestRequest(
      wsCodeCrypt: appConfig.wsCodeCrypt,
      caUid: caUid,
      caPwd: caPwd,
      diCode: diCode,
      userId: userId,
      vehNo: vehNo,
      part3Type: part3Type,
      groupId: groupId,
      nricNo: icNo,
      testCode: testCode,
    );

    String body = jsonEncode(verifyScanCodeRequest);
    String api = 'CallPart3JpjTest';
    Map<String, String> headers = {'Content-Type': 'application/json'};

    var response =
        await networking.postData(api: api, body: body, headers: headers);

    if (response.isSuccess && response.data != null) {
      CallPart3JpjTestResponse verifyScanCodeResponse =
          CallPart3JpjTestResponse.fromJson(response.data);

      return Response(true, data: verifyScanCodeResponse.jpjTestTrn);
    }

    return Response(false,
        message: response.message == null || response.message!.isEmpty
            ? 'Tiada data.'
            : response.message!.replaceAll(r'\u000d\u000a', ''));
  }

  Future<Response> cancelCallPart3JpjTest({
    context,
    required part3Type,
    required groupId,
    required icNo,
    required testCode,
  }) async {
    // String customUrl =
    //     'http://192.168.168.2/etesting.MainService/${appConfig.wsVer}/MainService.svc';

    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwd();
    String? diCode = await localStorage.getMerchantDbCode();
    String? userId = await localStorage.getUserId();

    CancelCallPart3JpjTestRequest verifyScanCodeRequest =
        CancelCallPart3JpjTestRequest(
      wsCodeCrypt: appConfig.wsCodeCrypt,
      caUid: caUid,
      caPwd: caPwd,
      diCode: diCode,
      userId: userId,
      part3Type: part3Type,
      groupId: groupId,
      nricNo: icNo,
      testCode: testCode,
    );

    String body = jsonEncode(verifyScanCodeRequest);
    String api = 'CancelCallPart3JpjTest';
    Map<String, String> headers = {'Content-Type': 'application/json'};

    var response =
        await networking.postData(api: api, body: body, headers: headers);

    if (response.isSuccess && response.data != null) {
      CancelCallPart3JpjTestResponse verifyScanCodeResponse =
          CancelCallPart3JpjTestResponse.fromJson(response.data);

      return Response(true, data: verifyScanCodeResponse.jpjTestTrn);
    }

    return Response(false,
        message: response.message == null || response.message!.isEmpty
            ? 'Tiada data.'
            : response.message!.replaceAll(r'\u000d\u000a', ''));
  }

  Future<Response> cancelCallRpkJpjTest({
    context,
    required part3Type,
    required groupId,
    required icNo,
    required testCode,
  }) async {
    // String customUrl =
    //     'http://192.168.168.2/etesting.MainService/${appConfig.wsVer}/MainService.svc';

    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwd();
    String? diCode = await localStorage.getMerchantDbCode();
    String? userId = await localStorage.getUserId();

    CancelCallRpkJpjTestRequest verifyScanCodeRequest =
        CancelCallRpkJpjTestRequest(
      wsCodeCrypt: appConfig.wsCodeCrypt,
      caUid: caUid,
      caPwd: caPwd,
      diCode: diCode,
      userId: userId,
      // part3Type: part3Type,
      groupId: groupId,
      nricNo: icNo,
      testCode: testCode,
    );

    String body = jsonEncode(verifyScanCodeRequest);
    String api = 'CancelCallRpkJpjTest';
    Map<String, String> headers = {'Content-Type': 'application/json'};

    var response =
        await networking.postData(api: api, body: body, headers: headers);

    if (response.isSuccess && response.data != null) {
      CancelCallRpkJpjTestResponse verifyScanCodeResponse =
          CancelCallRpkJpjTestResponse.fromJson(response.data);

      return Response(true, data: verifyScanCodeResponse.jpjTestTrn);
    }

    return Response(false,
        message: response.message == null || response.message!.isEmpty
            ? 'Tiada data.'
            : response.message!.replaceAll(r'\u000d\u000a', ''));
  }

  Future<Response> updatePart3JpjTestStart({
    context,
    required part3Type,
    required groupId,
    required icNo,
    required testCode,
  }) async {
    // String customUrl =
    //     'http://192.168.168.2/etesting.MainService/${appConfig.wsVer}/MainService.svc';

    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwd();
    String? diCode = await localStorage.getMerchantDbCode();
    String? userId = await localStorage.getUserId();

    CancelCallPart3JpjTestRequest verifyScanCodeRequest =
        CancelCallPart3JpjTestRequest(
      wsCodeCrypt: appConfig.wsCodeCrypt,
      caUid: caUid,
      caPwd: caPwd,
      diCode: diCode,
      userId: userId,
      part3Type: part3Type,
      groupId: groupId,
      nricNo: icNo,
      testCode: testCode,
    );

    String body = jsonEncode(verifyScanCodeRequest);
    String api = 'UpdatePart3JpjTestStart';
    Map<String, String> headers = {'Content-Type': 'application/json'};

    var response =
        await networking.postData(api: api, body: body, headers: headers);

    if (response.isSuccess && response.data != null) {
      CancelCallPart3JpjTestResponse verifyScanCodeResponse =
          CancelCallPart3JpjTestResponse.fromJson(response.data);

      return Response(true, data: verifyScanCodeResponse.jpjTestTrn);
    }

    return Response(false,
        message: response.message == null || response.message!.isEmpty
            ? 'Tiada data.'
            : response.message!.replaceAll(r'\u000d\u000a', ''));
  }

  Future<Response> updateRpkJpjTestStart({
    context,
    required part3Type,
    required groupId,
    required icNo,
    required testCode,
  }) async {
    // String customUrl =
    //     'http://192.168.168.2/etesting.MainService/${appConfig.wsVer}/MainService.svc';

    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwd();
    String? diCode = await localStorage.getMerchantDbCode();
    String? userId = await localStorage.getUserId();

    CancelCallRpkJpjTestRequest verifyScanCodeRequest =
        CancelCallRpkJpjTestRequest(
      wsCodeCrypt: appConfig.wsCodeCrypt,
      caUid: caUid,
      caPwd: caPwd,
      diCode: diCode,
      userId: userId,
      part3Type: part3Type,
      groupId: groupId,
      nricNo: icNo,
      testCode: testCode,
    );

    String body = jsonEncode(verifyScanCodeRequest);
    String api = 'UpdateRpkJpjTestStart';
    Map<String, String> headers = {'Content-Type': 'application/json'};

    var response =
        await networking.postData(api: api, body: body, headers: headers);

    if (response.isSuccess && response.data != null) {
      CancelCallPart3JpjTestResponse verifyScanCodeResponse =
          CancelCallPart3JpjTestResponse.fromJson(response.data);

      return Response(true, data: verifyScanCodeResponse.jpjTestTrn);
    }

    return Response(false,
        message: response.message == null || response.message!.isEmpty
            ? 'Tiada data.'
            : response.message!.replaceAll(r'\u000d\u000a', ''));
  }

  Future<Response> updatePart3JpjTestResult({
    context,
    required vehNo,
    required part3Type,
    required groupId,
    required icNo,
    required testCode,
    required resultJson,
  }) async {
    // String customUrl =
    //     'http://192.168.168.2/etesting.MainService/${appConfig.wsVer}/MainService.svc';

    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwd();
    String? diCode = await localStorage.getMerchantDbCode();
    String? userId = await localStorage.getUserId();

    UpdatePart3JpjTestResultRequest verifyScanCodeRequest =
        UpdatePart3JpjTestResultRequest(
      wsCodeCrypt: appConfig.wsCodeCrypt,
      caUid: caUid,
      caPwd: caPwd,
      diCode: diCode,
      userId: userId,
      vehNo: vehNo,
      part3Type: part3Type,
      groupId: groupId,
      nricNo: icNo,
      testCode: testCode,
      resultJson: resultJson,
    );

    String body = jsonEncode(verifyScanCodeRequest);
    String api = 'UpdatePart3JpjTestResult';
    Map<String, String> headers = {'Content-Type': 'application/json'};

    var response =
        await networking.postData(api: api, body: body, headers: headers);

    if (response.isSuccess && response.data != null) {
      if (part3Type == 'RPK') {
        UpdatePart3JpjTestResultRpkResponse
            updatePart3JpjTestResultRpkResponse =
            UpdatePart3JpjTestResultRpkResponse.fromJson(response.data);

        return Response(true,
            data: updatePart3JpjTestResultRpkResponse.jpjTestRpk);
      } else {
        UpdatePart3JpjTestResultJrResponse updatePart3JpjTestResultJrResponse =
            UpdatePart3JpjTestResultJrResponse.fromJson(response.data);

        return Response(true,
            data: updatePart3JpjTestResultJrResponse.jpjTestDdtl);
      }
    }

    return Response(false,
        message: response.message == null || response.message!.isEmpty
            ? 'Gagal mengemas kini rekod.'
            : response.message!.replaceAll(r'\u000d\u000a', ''));
  }

  Future<Response> updateRpkJpjTestResult({
    context,
    required vehNo,
    required part3Type,
    required groupId,
    required icNo,
    required testCode,
    required resultJson,
  }) async {
    // String customUrl =
    //     'http://192.168.168.2/etesting.MainService/${appConfig.wsVer}/MainService.svc';

    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwd();
    String? diCode = await localStorage.getMerchantDbCode();
    String? userId = await localStorage.getUserId();

    UpdateRpkJpjTestResultRequest verifyScanCodeRequest =
        UpdateRpkJpjTestResultRequest(
      wsCodeCrypt: appConfig.wsCodeCrypt,
      caUid: caUid,
      caPwd: caPwd,
      diCode: diCode,
      userId: userId,
      vehNo: vehNo,
      part3Type: part3Type,
      groupId: groupId,
      nricNo: icNo,
      testCode: testCode,
      resultJson: resultJson,
    );

    String body = jsonEncode(verifyScanCodeRequest);
    String api = 'UpdateRpkJpjTestResult';
    Map<String, String> headers = {'Content-Type': 'application/json'};

    var response =
        await networking.postData(api: api, body: body, headers: headers);

    if (response.isSuccess && response.data != null) {
      if (part3Type == 'RPK') {
        UpdateRpkJpjTestResultResponse updatePart3JpjTestResultRpkResponse =
            UpdateRpkJpjTestResultResponse.fromJson(response.data);

        return Response(true,
            data: updatePart3JpjTestResultRpkResponse.jpjTestRpk);
      } else {
        UpdateRpkJpjTestResultJrResponse updatePart3JpjTestResultJrResponse =
            UpdateRpkJpjTestResultJrResponse.fromJson(response.data);

        return Response(true,
            data: updatePart3JpjTestResultJrResponse.jpjTestDdtl);
      }
    }

    return Response(false,
        message: response.message == null || response.message!.isEmpty
            ? 'Gagal mengemas kini rekod.'
            : response.message!.replaceAll(r'\u000d\u000a', ''));
  }

  Future<Response> getRpkAvailableToCallJpjTestList({vehNo}) async {
    // String customUrl =
    //     'http://192.168.168.2/etesting.MainService/${appConfig.wsVer}/MainService.svc';

    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwdEncode();
    String? userId = await localStorage.getUserId();
    String? diCode = await localStorage.getMerchantDbCode();

    String path =
        'wsCodeCrypt=${appConfig.wsCodeCrypt}&caUid=$caUid&caPwd=$caPwd&diCode=$diCode&userId=$userId&vehNo=$vehNo';

    var response = await networking.getData(
      path: 'GetRpkAvailableToCallJpjTestList?$path',
    );

    if (response.isSuccess && response.data != null) {
      GetRpkAvailableToCallJpjTestListResponse
          getPart3AvailableToCallJpjTestListResponse =
          GetRpkAvailableToCallJpjTestListResponse.fromJson(response.data);

      return Response(true,
          data: getPart3AvailableToCallJpjTestListResponse.jpjTestTrn);
    }

    return Response(false,
        message: response.message == null || response.message!.isEmpty
            ? 'Tidak ada calon dalam barisan.'
            : response.message!.replaceAll(r'\u000d\u000a', ''));
  }

  Future<Response> callRpkJpjTest({
    context,
    required vehNo,
    required groupId,
    required icNo,
    required testCode,
  }) async {
    // String customUrl =
    //     'http://192.168.168.2/etesting.MainService/${appConfig.wsVer}/MainService.svc';

    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwd();
    String? diCode = await localStorage.getMerchantDbCode();
    String? userId = await localStorage.getUserId();

    CallRpkJpjTestRequest verifyScanCodeRequest = CallRpkJpjTestRequest(
      wsCodeCrypt: appConfig.wsCodeCrypt,
      caUid: caUid,
      caPwd: caPwd,
      diCode: diCode,
      userId: userId,
      vehNo: vehNo,
      groupId: groupId,
      nricNo: icNo,
      testCode: testCode,
    );

    String body = jsonEncode(verifyScanCodeRequest);
    String api = 'CallRpkJpjTest';
    Map<String, String> headers = {'Content-Type': 'application/json'};

    var response =
        await networking.postData(api: api, body: body, headers: headers);

    if (response.isSuccess && response.data != null) {
      CallRpkJpjTestResponse verifyScanCodeResponse =
          CallRpkJpjTestResponse.fromJson(response.data);

      return Response(true, data: verifyScanCodeResponse.jpjTestTrn);
    }

    return Response(false,
        message: response.message == null || response.message!.isEmpty
            ? 'Tiada data.'
            : response.message!.replaceAll(r'\u000d\u000a', ''));
  }
}
