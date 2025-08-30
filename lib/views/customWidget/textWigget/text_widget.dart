
import 'package:flutter/material.dart';

class TextWidget{

 static Widget Text_20_600({
    required String text,
    double fontSize = 20,
    FontWeight fontWeight = FontWeight.w700,
    Color color = Colors.black87,
    double? letterSpacing=-0.3,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
      ),
    );
  }

 static Widget Text_18_600({
    required String text,
    double fontSize = 18,
    FontWeight fontWeight = FontWeight.w600,
    Color color = Colors.black87,
    double? letterSpacing=-0.3,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
      ),
    );
  }

 static Widget Text_17({
    required String text,
    double fontSize = 17,
    FontWeight fontWeight = FontWeight.w400,
    Color color = Colors.black87,
    double? letterSpacing=-0.3,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
      ),
    );
  }

 static Widget Text_16({
    required String text,
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.w400,
    Color color = Colors.black87,
    double? letterSpacing=-0.3,
  }) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          letterSpacing: letterSpacing
      ),
    );
  }

 static Widget Text_14({
    required String text,
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w400,
    Color color = Colors.black87,
    double? letterSpacing=-0.3,
  }) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          letterSpacing: letterSpacing
      ),
    );
  }
 static Widget Text_13({
    required String text,
    double fontSize = 13,
    FontWeight fontWeight = FontWeight.w400,
    Color color = Colors.black87,
    double? letterSpacing=-0.3,
  }) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          letterSpacing: letterSpacing
      ),
    );
  }
 static Widget Text_12({
    required String text,
    double fontSize = 12,
    FontWeight fontWeight = FontWeight.w400,
    Color color = Colors.black87,
    double? letterSpacing= 0.3,
  }) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          letterSpacing: letterSpacing
      ),
    );
  }
 static  Widget Text_11({
    required String text,
    double fontSize = 11,
    FontWeight fontWeight = FontWeight.w400,
    Color color = Colors.black87,
    double? letterSpacing= 0.3,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}