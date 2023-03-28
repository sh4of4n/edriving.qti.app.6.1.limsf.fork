import 'dart:async';

import 'package:edriving_qti_app/utils/app_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:edriving_qti_app/common_library/services/model/provider_model.dart';
import 'package:edriving_qti_app/utils/constants.dart';
import 'package:edriving_qti_app/utils/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:edriving_qti_app/common_library/utils/app_localizations_delegate.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'application.dart';
import 'common_library/services/model/bill_model.dart';
import 'common_library/services/model/kpp_model.dart';
import 'common_library/utils/custom_dialog.dart';
import 'router.gr.dart';

final getIt = GetIt.instance;
GlobalKey<ScaffoldMessengerState> navigatorKey =
    GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  EasyLoading.instance.userInteractions = false;
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(KppExamDataAdapter());
  // Hive.registerAdapter(EmergencyContactAdapter());
  Hive.registerAdapter(TelcoAdapter());
  Hive.registerAdapter(BillAdapter());
  // _setupLogging();
  await Hive.openBox('ws_url');

  // await Hive.box('ws_url').put(
  //     'defaultUrl',
  //     'http://192.168.168.2:88/etesting.mainservice/_wsver_/mainservice.svc'
  //         .replaceAll('_wsver_', AppConfig().wsVer));

  runZonedGuarded(() async {
    await SentryFlutter.init(
      (options) {
        options.dsn = kDebugMode
            ? ''
            : 'https://56a93727ddd3442f9acc49762a68b78b@o354605.ingest.sentry.io/6749453';
      },
    );

    getIt.registerSingleton<AppRouter>(AppRouter());
    getIt.registerSingleton<NavigatorState>(NavigatorState());

    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => LanguageModel(),
          ),
          ChangeNotifierProvider(
            create: (context) => JrSessionModel(),
          ),
          ChangeNotifierProvider(
            create: (context) => RpkSessionModel(),
          ),
        ],
        child: MyApp(),
      ),
    );
  }, (exception, stackTrace) async {
    await Sentry.captureException(exception, stackTrace: stackTrace);
    await EasyLoading.dismiss();
  });
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppLocalizationsDelegate? _newLocaleDelegate;
  final localStorage = LocalStorage();

  //final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  // String _homeScreenText = "Waiting for token...";
  final customDialog = CustomDialog();
  final _appRouter = AppRouter();
  final router = getIt<AppRouter>();
  @override
  void initState() {
    super.initState();

    _newLocaleDelegate = AppLocalizationsDelegate(newLocale: null);
    application.onLocaleChanged = onLocaleChange;
    _loadSavedLocale();
  }

  void _loadSavedLocale() async {
    String? storedLocale = await localStorage.getLocale();

    onLocaleChange(
      Locale(storedLocale!),
    );
  }

  void onLocaleChange(Locale locale) {
    setState(() {
      _newLocaleDelegate = AppLocalizationsDelegate(newLocale: locale);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: navigatorKey,
      title: 'eDriving QTI',
      // debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: ColorConstant.primaryColor,
        fontFamily: 'Myriad',
        textTheme: FontTheme().primaryFont,
        primaryTextTheme: FontTheme().primaryFont,
        appBarTheme: AppBarTheme(
          backgroundColor: ColorConstant.primaryColor,
        ),
      ),
      // List all of the app's supported locales here
      supportedLocales: [
        ...application.supportedLocales(),
      ],
      // These delegates make sure that the localization data for the proper language is loaded
      localizationsDelegates: [
        // THIS CLASS WILL BE ADDED LATER
        // A class which loads the translations from JSON files
        _newLocaleDelegate!,
        // Built-in localization of basic text for Material widgets
        GlobalMaterialLocalizations.delegate,
        // Built-in localization for text direction LTR/RTL
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,

        FormBuilderLocalizations.delegate,
      ],
      routerDelegate: router.delegate(initialRoutes: [const Authentication()]),
      routeInformationParser: router.defaultRouteParser(),
      // initialRoute: AUTH,
      // onGenerateRoute: RouteGenerator.generateRoute,
      builder: EasyLoading.init(),
    );
  }

  @override
  void dispose() {
    Hive.box('exam_data').compact();
    Hive.box('ws_url').compact();
    // Hive.box('emergencyContact').compact();
    Hive.close();
    super.dispose();
  }
}
// verify merchant_no and test_code

// after login select car_no, plate_no, group_id can scan QR
