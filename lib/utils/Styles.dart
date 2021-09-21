import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Styles {

  static Color veryDarkGrey = Color(0xFF2B2B2B);
  static Color darkGrey = Color(0xFF969696);
  static Color lightRed = Color(0xFFFF8A80);

  static TextStyle loginButtonStyle() => TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w400,
      fontFamily: 'Rubik'
  );

  static TextStyle titleStyle() => TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontFamily: "Rubik",
      fontWeight: FontWeight.w700
  );

  static TextStyle keyStyle() => TextStyle(
      color: darkGrey,
      fontSize: 12.0,
      fontWeight: FontWeight.w700
  );

  static TextStyle valueStyle() => TextStyle(
      color: veryDarkGrey,
      fontSize: 20.0,
      fontWeight: FontWeight.w500
  );

  static TextStyle searchStyle() => TextStyle(
      color: darkGrey,
      fontSize: 18.0,
      fontFamily: "Rubik",
      fontWeight: FontWeight.w500
  );
}