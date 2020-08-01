import 'package:flutter/material.dart';
import 'package:flutterapp/config/application.dart';
import 'package:flutterapp/config/localization/translator.dart';

class TranslatorDelegate extends LocalizationsDelegate<Translator> {
  const TranslatorDelegate(this.newLocale);

  final Locale newLocale;

  @override
  bool isSupported(Locale locale) =>
      application.languageCodes.contains(locale.languageCode);

  @override
  Future<Translator> load(Locale locale) =>
      Translator.load(newLocale ?? locale);

  @override
  bool shouldReload(LocalizationsDelegate<Translator> old) => true;
}
