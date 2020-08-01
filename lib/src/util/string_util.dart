import 'package:flutter/material.dart';
import 'package:flutterapp/config/localization/translator.dart';

mixin StringUtil {
  static String getText(BuildContext context, String key) =>
      Translator.of(context).getString(key);
}
