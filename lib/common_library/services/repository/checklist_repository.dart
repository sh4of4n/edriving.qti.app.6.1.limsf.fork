import 'dart:convert';

import '../../../services/api/networking.dart';
import '../../../services/response.dart';
import '../../../utils/app_config.dart';
import '../../../utils/local_storage.dart';
import '../model/checklist_model.dart';

class ChecklistRepo {
  final networking = Networking();
  final localStorage = LocalStorage();
  final appConfig = AppConfig();

  Future<Response> getCheckList({
    required checkType,
  }) async {
    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwdEncode();
    String? userId = await localStorage.getUserId();
    String? diCode = await localStorage.getDiCode();

    String path =
        'wsCodeCrypt=${appConfig.wsCodeCrypt}&caUid=$caUid&caPwd=$caPwd&diCode=$diCode&userId=$userId&checkType=$checkType';

    var response = await networking.getData(
      path: 'GetCheckList?$path',
    );

    if (response.isSuccess && response.data != null) {
      GetCheckListResponse getCheckListResponse =
          GetCheckListResponse.fromJson(response.data);

      return Response(true, data: getCheckListResponse.checkList);
    }

    return Response(
      false,
      message: response.message,
      data: [],
    );
  }

  Future<Response> updateJpjCheckListSkim({
    required String plateNo,
    required String checkListJson,
  }) async {
    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwdEncode();
    String? userId = await localStorage.getUserId();
    String? diCode = await localStorage.getMerchantDbCode();

    GetCheckListRequest params = GetCheckListRequest(
      wsCodeCrypt: appConfig.wsCodeCrypt,
      caUid: caUid,
      caPwd: caPwd,
      userId: userId,
      diCode: diCode,
      checkListJson: checkListJson,
      plateNo: plateNo,
    );

    String body = jsonEncode(params);
    String api = 'UpdateJpjCheckListSkim';
    Map<String, String> headers = {'Content-Type': 'application/json'};

    var response =
        await networking.postData(api: api, body: body, headers: headers);

    if (response.isSuccess && response.data != null) {
      GetCheckListResponse getCheckListResponse =
          GetCheckListResponse.fromJson(response.data);
      return Response(true, data: getCheckListResponse);
    }
    return Response(false, message: '', data: []);
  }

  Future<Response> updateJpjCheckListLitar({
    required String checkListJson,
  }) async {
    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwdEncode();
    String? userId = await localStorage.getUserId();
    String? diCode = await localStorage.getMerchantDbCode();

    GetCheckListRequest params = GetCheckListRequest(
      wsCodeCrypt: appConfig.wsCodeCrypt,
      caUid: caUid,
      caPwd: caPwd,
      userId: userId,
      diCode: diCode,
      checkListJson: checkListJson,
    );

    String body = jsonEncode(params);
    String api = 'UpdateJpjCheckListLitar';
    Map<String, String> headers = {'Content-Type': 'application/json'};

    var response =
        await networking.postData(api: api, body: body, headers: headers);

    if (response.isSuccess && response.data != null) {
      GetCheckListResponse getCheckListResponse =
          GetCheckListResponse.fromJson(response.data);
      return Response(true, data: getCheckListResponse);
    }
    return Response(false, message: '', data: []);
  }

  Future<Response> updateJpjCheckListSistem({
    required String checkListJson,
  }) async {
    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwdEncode();
    String? userId = await localStorage.getUserId();
    String? diCode = await localStorage.getMerchantDbCode();

    GetCheckListRequest params = GetCheckListRequest(
      wsCodeCrypt: appConfig.wsCodeCrypt,
      caUid: caUid,
      caPwd: caPwd,
      userId: userId,
      diCode: diCode,
      checkListJson: checkListJson,
    );

    String body = jsonEncode(params);
    String api = 'UpdateJpjCheckListSistem';
    Map<String, String> headers = {'Content-Type': 'application/json'};

    var response =
        await networking.postData(api: api, body: body, headers: headers);

    if (response.isSuccess && response.data != null) {
      GetCheckListResponse getCheckListResponse =
          GetCheckListResponse.fromJson(response.data);
      return Response(true, data: getCheckListResponse);
    }
    return Response(false, message: '', data: []);
  }

  Future<Response> getJpjCheckListSkim({
    required plateNo,
  }) async {
    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwdEncode();
    String? userId = await localStorage.getUserId();
    String? diCode = await localStorage.getMerchantDbCode();

    String path =
        'wsCodeCrypt=${appConfig.wsCodeCrypt}&caUid=$caUid&caPwd=$caPwd&diCode=$diCode&userId=$userId&plateNo=$plateNo';

    var response = await networking.getData(
      path: 'GetJpjCheckListSkim?$path',
    );

    if (response.isSuccess && response.data != null) {
      JpjCheckListResponse getCheckListResponse =
          JpjCheckListResponse.fromJson(response.data);

      return Response(true, data: getCheckListResponse.jpjCheckList);
    }

    return Response(
      false,
      message: response.message,
      data: [],
    );
  }

  Future<Response> getJpjCheckListLitar({
    required plateNo,
  }) async {
    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwdEncode();
    String? userId = await localStorage.getUserId();
    String? diCode = await localStorage.getMerchantDbCode();

    String path =
        'wsCodeCrypt=${appConfig.wsCodeCrypt}&caUid=$caUid&caPwd=$caPwd&diCode=$diCode&userId=$userId&plateNo=$plateNo';

    var response = await networking.getData(
      path: 'GetJpjCheckListLitar?$path',
    );

    if (response.isSuccess && response.data != null) {
      JpjCheckListResponse getCheckListResponse =
          JpjCheckListResponse.fromJson(response.data);

      return Response(true, data: getCheckListResponse.jpjCheckList);
    }

    return Response(
      false,
      message: response.message,
      data: [],
    );
  }

  Future<Response> getJpjCheckListSistem({
    required plateNo,
  }) async {
    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwdEncode();
    String? userId = await localStorage.getUserId();
    String? diCode = await localStorage.getMerchantDbCode();

    String path =
        'wsCodeCrypt=${appConfig.wsCodeCrypt}&caUid=$caUid&caPwd=$caPwd&diCode=$diCode&userId=$userId&plateNo=$plateNo';

    var response = await networking.getData(
      path: 'GetJpjCheckListSistem?$path',
    );

    if (response.isSuccess && response.data != null) {
      JpjCheckListResponse getCheckListResponse =
          JpjCheckListResponse.fromJson(response.data);

      return Response(true, data: getCheckListResponse.jpjCheckList);
    }

    return Response(
      false,
      message: response.message,
      data: [],
    );
  }
}
