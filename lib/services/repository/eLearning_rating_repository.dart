import 'dart:convert';

import 'package:edriving_qti_app/services/api/model/eLearning_rating_model.dart';
import 'package:edriving_qti_app/utils/app_config.dart';
import 'package:edriving_qti_app/utils/local_storage.dart';
import 'package:intl/intl.dart';

import 'package:edriving_qti_app/common_library/utils/app_localizations.dart';
import '../../common_library/services/networking.dart';
import '../../common_library/services/response.dart';

class LearnRepo {
  final appConfig = AppConfig();
  final localStorage = LocalStorage();
  final networking = Networking();

  Future<Response> addLearnResult({
    context,
    String? groupId,
    String? courseCode,
    String? part,
    String? studentIc,
    required String dateTimeFromString,
    required String dateTimeToString,
    String? remark,
    String? detlInJson,
  }) async {
    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwd();
    String? diCode = await localStorage.getDiCode();
    String? getUserId = await localStorage.getUserId();

    AddLearnResult params = AddLearnResult(
      wsCodeCrypt: appConfig.wsCodeCrypt,
      caUid: caUid,
      caPwd: caPwd,
      appId: appConfig.appId,
      userId: getUserId,
      diCode: diCode ?? appConfig.diCode,
      icNo: studentIc,
      groupId: groupId,
      courseCode: courseCode,
      part: part, //
      dateTimeFromString: DateFormat('yyyy/MM/dd HH:mm:ss')
          .format(DateTime.parse(dateTimeFromString)),
      dateTimeToString: DateFormat('yyyy/MM/dd').format(DateTime.now()) +
          ' ' +
          dateTimeToString,
      remark: remark,
      detlInJson: detlInJson,
    );

    String body = jsonEncode(params);
    //print('---------------');
    //print(body.replaceAll('\\', ''));
    String api = 'AddLearnResult';
    Map<String, String> headers = {'Content-Type': 'application/json'};

    var response =
        await networking.postData(api: api, body: body, headers: headers);

    // Success
    if (response.isSuccess) {
      return Response(true,
          message: AppLocalizations.of(context)!.translate('ekpp_submit_lbl'));
    } else if (response.message != null &&
        response.message!.contains('timeout')) {
      return Response(false,
          message:
              AppLocalizations.of(context)!.translate('timeout_exception'));
    } else if (response.message != null &&
        response.message!.contains('socket')) {
      return Response(false,
          message: AppLocalizations.of(context)!.translate('socket_exception'));
    } else if (response.message != null && response.message!.contains('http')) {
      return Response(false,
          message: AppLocalizations.of(context)!.translate('http_exception'));
    } else if (response.message != null &&
        response.message!.contains('format')) {
      return Response(false,
          message: AppLocalizations.of(context)!.translate('format_exception'));
    }

    return Response(false, message: response.message);
  }
}
