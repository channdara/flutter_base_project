import 'package:flutter/material.dart';
import 'package:flutterapp/config/application.dart';

mixin StringUtil {
  static String getString(BuildContext context, String key) =>
      application.translator.getString(context, key);
}
