import 'dart:convert';

import 'package:edriving_qti_app/common_library/services/model/etesting_model.dart';

import '../../../services/api/networking.dart';
import '../../../services/response.dart';
import '../../../utils/app_config.dart';
import '../../../utils/local_storage.dart';

class EtestingRepo {
  final localStorage = LocalStorage();
  final appConfig = AppConfig();
  final networking = Networking();

  Future<Response> getRule({
    required elementCode,
  }) async {
    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwd();
    String? diCode = await localStorage.getMerchantDbCode();
    String? userId = await localStorage.getUserId();

    String path =
        'wsCodeCrypt=${appConfig.wsCodeCrypt}&caUid=$caUid&caPwd=$caPwd&userId=$userId&diCode=$diCode&elementCode=$elementCode';

    var response = await networking.getData(
      path: 'GetRule?$path',
    );

    if (response.isSuccess && response.data != null) {
      RuleResponse ruleResponse = RuleResponse.fromJson(response.data);

      return Response(true, data: ruleResponse.rule);
    }

    return Response(false, message: response.message, data: []);
  }

  Future<Response> updateMySikapStatusOut() async {
    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwd();
    String? diCode = await localStorage.getMerchantDbCode();
    String? userId = await localStorage.getUserId();

    ResultRequest params = ResultRequest(
      wsCodeCrypt: appConfig.wsCodeCrypt,
      caUid: caUid,
      caPwd: caPwd,
      userId: userId,
      permitCode: diCode,
    );

    String body = jsonEncode(params);
    String api = 'UpdateMySikapStatusOut';
    Map<String, String> headers = {'Content-Type': 'application/json'};

    var response =
        await networking.postData(api: api, body: body, headers: headers);

    // Success
    if (response.isSuccess &&
        response.data != null &&
        response.data.isNotEmpty) {
      await localStorage.reset();
      return Response(true, data: response.data);
    }
    return Response(false, message: response.message, data: []);
  }

  Future<Response> getOwnerIdCategoryList() async {
    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwd();

    String path =
        'wsCodeCrypt=${appConfig.wsCodeCrypt}&caUid=$caUid&caPwd=$caPwd';

    var response = await networking.getData(
      path: 'GetOwnerIdCategoryList?$path',
    );

    if (response.isSuccess && response.data != null) {
      OwnerIdCategoryResponse ruleResponse =
          OwnerIdCategoryResponse.fromJson(response.data);

      return Response(true, data: ruleResponse.ownerIdCategoryList);
    }

    return Response(false, message: response.message, data: []);
  }
}
