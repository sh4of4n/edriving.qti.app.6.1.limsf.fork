import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:edriving_qti_app/common_library/services/repository/etesting_repository.dart';
import 'package:edriving_qti_app/common_library/utils/app_localizations.dart';
import 'package:edriving_qti_app/common_library/services/model/provider_model.dart';
import 'package:edriving_qti_app/common_library/services/repository/auth_repository.dart';
import 'package:edriving_qti_app/main.dart';
import 'package:edriving_qti_app/router.dart';
import 'package:edriving_qti_app/utils/app_config.dart';

import 'package:edriving_qti_app/utils/device_info.dart';
import 'package:edriving_qti_app/utils/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../../common_library/services/response.dart';
import '../../router.gr.dart';
import '../../utils/check_url.dart';
import '../../utils/constants.dart';

@RoutePage(name: 'Authentication')
class Authentication extends StatefulWidget {
  const Authentication({super.key});

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  final AuthRepo authRepo = AuthRepo();
  final AppConfig appConfig = AppConfig();
  final LocalStorage localStorage = LocalStorage();

  DeviceInfo deviceInfo = DeviceInfo();
  String deviceModel = '';
  String deviceVersion = '';
  String deviceId = '';
  Timer? timer;
  final etestingRepo = EtestingRepo();
  CheckUrl checkUrl = CheckUrl();

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 5), (Timer t) {
      checkUserLoginStatus();
    });

    // _getWsUrl();
    _setLocale();
    checkUrl.checkUrl('', '').then((value) => _checkExistingLogin());
  }

  checkUserLoginStatus() async {
    String? userId = await localStorage.getUserId();
    if (userId != null && userId.isNotEmpty) {
      Response result = await etestingRepo.checkUserLoginStatus();
      if (result.isSuccess) {
        if (result.data[0].result == 'false') {
          const snackBar = SnackBar(
            content: Text('Your session has expired. Please login again.'),
            behavior: SnackBarBehavior.floating,
          );
          navigatorKey.currentState!.showSnackBar(snackBar);
          await localStorage.reset();
          await getIt<AppRouter>().replaceAll([const Login()]);
        } else {
          // const snackBar = SnackBar(
          //   content: Text('yes'),
          //   behavior: SnackBarBehavior.floating,
          // );
          // navigatorKey.currentState!.showSnackBar(snackBar);
        }
      }
    }
  }

  _getWsUrl() async {
    // final wsUrlBox = Hive.box('ws_url');

    // localStorage.reset();

    // String wsUrl = wsUrlBox.get('wsUrl');
    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwd();

    // if (wsUrl == null) {
    await authRepo.getWsUrl(
      acctUid: caUid,
      acctPwd: caPwd,
      loginType: appConfig.wsCodeCrypt,
    );
    // }

    _checkExistingLogin();
  }

  _setLocale() async {
    String? locale = await localStorage.getLocale();

    if (locale == 'en') {
      Provider.of<LanguageModel>(context, listen: false).selectedLanguage(
          AppLocalizations.of(context)!.translate('english_lbl'));
    } else {
      Provider.of<LanguageModel>(context, listen: false).selectedLanguage(
          AppLocalizations.of(context)!.translate('malay_lbl'));
    }
  }

  _checkExistingLogin() async {
    String? userId = await localStorage.getUserId();
    String? groupId = await localStorage.getEnrolledGroupId();
    String? carNo = await localStorage.getCarNo();
    String? plateNo = await localStorage.getPlateNo();
    String? type = await localStorage.getType();
    String? mySikapId = await localStorage.getMySikapId();
    if (mounted) {
      if (userId != null && userId.isNotEmpty) {
        await Sentry.configureScope(
          (scope) => scope.setUser(SentryUser(
            id: mySikapId,
          )),
        );
        if (!mounted) return;
        if (groupId != null &&
            groupId.isNotEmpty &&
            carNo != null &&
            carNo.isNotEmpty &&
            plateNo != null &&
            plateNo.isNotEmpty) {
          if (type == "RPK") {
            context.router.replace(const HomePageRpk());
          } else {
            context.router.replace(const Home());
          }
        } else {
          // context.router.replace(GetVehicleInfo());
          context.router.replace(const HomeSelect());
        }
      } else {
        context.router.replace(const Login());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(1440, 2960),
    );

    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [
            Colors.amber.shade50,
            Colors.amber.shade100,
            Colors.amber.shade200,
            Colors.amber.shade300,
            ColorConstant.primaryColor,
          ],
          stops: const [0.2, 0.4, 0.6, 0.7, 1],
          radius: 0.7,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                ImagesConstant().logo,
                width: 1000.w,
                height: 600.h,
              ),
              const SizedBox(
                height: 50,
              ),
              const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
