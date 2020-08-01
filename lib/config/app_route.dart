import 'package:flutter/material.dart';
import 'package:flutterapp/src/ui/screen/settings_screen.dart';
import 'package:flutterapp/src/ui/screen/splash_screen.dart';

mixin AppRoute {
  static const String SPLASH_SCREEN = '/splash_screen';
  static const String SETTINGS_SCREEN = '/settings_screen';

  static Map<String, WidgetBuilder> routes = {
    SPLASH_SCREEN: (_) => SplashScreen(),
    SETTINGS_SCREEN: (_) => SettingsScreen(),
  };
}
