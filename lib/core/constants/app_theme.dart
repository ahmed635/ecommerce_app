
import 'package:ecommerce_app/core/constants/app_color.dart';
import 'package:flutter/material.dart';

ThemeData englishTheme = ThemeData(
  fontFamily: "PlayfairDisplay",
  primarySwatch: Colors.blue,
  textTheme: TextTheme(
    headline1: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 22, color: AppColor.black),
    headline2: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 26, color: AppColor.black),
    bodyText1: TextStyle(
        height: 2,
        color: AppColor.grey,
        fontWeight: FontWeight.bold,
        fontSize: 18),
    bodyText2: TextStyle(height: 2, color: AppColor.grey, fontSize: 14),
  ),
);

ThemeData arabicTheme = ThemeData(
  fontFamily: "Cairo",
  primarySwatch: Colors.blue,
  textTheme: TextTheme(
    headline1: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 22, color: AppColor.black),
    headline2: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 26, color: AppColor.black),
    bodyText1: TextStyle(
        height: 2,
        color: AppColor.grey,
        fontWeight: FontWeight.bold,
        fontSize: 18),
    bodyText2: TextStyle(height: 2, color: AppColor.grey, fontSize: 14),
  ),
);