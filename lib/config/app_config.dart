import 'package:flutter/material.dart';

class AppConfig extends InheritedWidget {
  const AppConfig({
    @required this.apiBaseUrl,
    @required Widget child,
  }) : super(child: child);

  final String apiBaseUrl;

  static AppConfig of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppConfig>();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
