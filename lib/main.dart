import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/config/app_config.dart';
import 'package:flutterapp/config/app_route.dart';
import 'package:flutterapp/config/application.dart';
import 'package:flutterapp/src/network/api/api_end_point.dart';

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    _initSystem();
    _initTranslator();
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
      localizationsDelegates: application.translator.localizationsDelegates,
      supportedLocales: application.translator.supportedLocales,
      navigatorKey: application.navigatorKey,
      routes: AppRoute.routes,
      initialRoute: AppRoute.SPLASH_SCREEN,
    );
  }

  Future<void> _initSystem() async {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
    ));
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  void _initTranslator() {
    application.translator.init(
      supportedLanguageCodes: ['en', 'ja'],
      initLanguageCode: 'en',
    );
    application.translator.onTranslatedLanguage = _onTranslatedLanguage;
  }

  void _onTranslatedLanguage(Locale locale) {
    setState(() {});
  }
}
