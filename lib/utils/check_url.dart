import 'package:edriving_qti_app/utils/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../common_library/services/repository/auth_repository.dart';
import '../main.dart';
import 'app_config.dart';

class CheckUrl {
  Box wsUrlBox = Hive.box('ws_url');
  late SnackBar snackBar;
  final AuthRepo authRepo = AuthRepo();
  final AppConfig appConfig = AppConfig();
  LocalStorage localStorage = LocalStorage();

  Future<String> pingme(String caUid, String caPwd) async {
    if ((await wsUrlBox.get('userDefinedUrl') != null &&
        await wsUrlBox.get('userDefinedUrl') != '')) {
      print('Connecting to Custom URL...');
      String url = (await wsUrlBox.get('userDefinedUrl'))
          .toString()
          .replaceAll('_wsver_', appConfig.wsVer);
      var result =
          await authRepo.pingme(wsUrl: '$url/webapi', milliseconds: 3000);
      if (result.isSuccess) {
        await wsUrlBox.put('wsUrl', url);
        return 'Connection to Custom URL is successful.';
      }
    }

    // print('Connecting to Default URL...');
    // var defaultUrlResult = await authRepo.pingme(
    //     wsUrl: '${await wsUrlBox.get('defaultUrl')}/webapi',
    //     milliseconds: 3000);
    // if (defaultUrlResult.isSuccess) {
    //   await wsUrlBox.put('wsUrl', await wsUrlBox.get('defaultUrl'));
    //   return 'Connection to Default URL is successful.';
    // }

    print('Connecting to CA URL...');
    var getWsUrlResult = await authRepo.getWsUrl(
      acctUid: caUid,
      acctPwd: caPwd,
      loginType: appConfig.wsCodeCrypt,
    );

    if (!getWsUrlResult.isSuccess) {
      return getWsUrlResult.message ?? 'Connection to CA URL is failed.';
    }

    var result = await authRepo.pingme();
    if (result.isSuccess) {
      return 'Connection to CA URL is successful.';
    }

    return 'Connection to all URL is failed.';
  }

  Future checkUrl(String caUid, String caPwd) async {
    if (caUid == '') {
      caUid = await localStorage.getCaUid() ?? '';
    }
    if (caPwd == '') {
      caPwd = await localStorage.getCaPwdEncode() ?? '';
    }
    String result = await pingme(caUid, caPwd);
    SnackBar snackBar = SnackBar(
      content: Text(result),
    );
    navigatorKey.currentState?.showSnackBar(snackBar);
  }
}
