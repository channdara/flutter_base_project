import 'package:flutter/material.dart';

class TextWidget extends Text {
  TextWidget(
    String text, {
    double fontSize,
    FontWeight fontWeight,
    Color color = Colors.black,
  }) : super(
          text,
          style: TextStyle(
            fontSize: fontSize,
            color: color,
            fontWeight: fontWeight,
          ),
        );
}
