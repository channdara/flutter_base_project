import 'package:flutter/material.dart';
import 'package:flutterapp/config/app_config.dart';
import 'package:flutterapp/main.dart';

void main() {
  final AppConfig _app = AppConfig(
    apiBaseUrl: 'https://jsonplaceholder.typicode.com',
    child: MainApp(),
  );
  runApp(_app);
}
