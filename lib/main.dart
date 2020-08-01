import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutterapp/config/app_config.dart';
import 'package:flutterapp/config/app_route.dart';
import 'package:flutterapp/config/application.dart';
import 'package:flutterapp/config/localization/translator_delegate.dart';
import 'package:flutterapp/src/network/api/api_end_point.dart';
import 'package:flutterapp/src/util/shared_pref_util.dart';

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  TranslatorDelegate _translatorDelegate = const TranslatorDelegate(null);

  @override
  void initState() {
    _setupSystem();
    _translateLanguage();
    application.changeLanguageCallback = _changeLanguageCallback;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    APIEndPoint(AppConfig.of(context).apiBaseUrl);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      localizationsDelegates: [
        _translatorDelegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: application.supportedLocales,
      navigatorKey: application.navigatorKey,
      routes: AppRoute.routes,
      initialRoute: AppRoute.SPLASH_SCREEN,
    );
  }

  Future<void> _setupSystem() async {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
    ));
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  void _changeLanguageCallback(Locale locale) {
    SharedPrefUtil.setValue(
      PrefType.STRING,
      PrefKey.LANGUAGE_CODE,
      locale.languageCode,
    );
    setState(() {
      _translatorDelegate = TranslatorDelegate(locale);
    });
  }

  Future<void> _translateLanguage() async {
    final code = await SharedPrefUtil.getString(PrefKey.LANGUAGE_CODE);
    setState(() {
      _translatorDelegate = TranslatorDelegate(Locale(code ?? 'en'));
    });
  }
}
