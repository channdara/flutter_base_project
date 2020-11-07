import 'package:flutter/material.dart';
import 'package:flutter_translator/translator_generator.dart';

class Application {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final TranslatorGenerator translator = TranslatorGenerator.instance;
}

Application application = Application();
