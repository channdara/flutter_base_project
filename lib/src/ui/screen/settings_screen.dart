import 'package:flutter/material.dart';
import 'package:flutterapp/config/application.dart';
import 'package:flutterapp/src/constant/locale_key.dart';
import 'package:flutterapp/src/util/string_util.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringUtil.getString(context, LocaleKey.settings)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    onPressed: () {
                      application.translator.translate('en');
                    },
                    child: const Text('English'),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    onPressed: () {
                      application.translator.translate('ja');
                    },
                    child: const Text('Japanese'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
