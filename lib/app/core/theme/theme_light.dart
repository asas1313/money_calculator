import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../values/styles.dart';

final themeLight = ThemeData(
  brightness: Brightness.light,
  textTheme: GoogleFonts.oldStandardTtTextTheme(Get.textTheme)
      .apply(displayColor: Colors.black, bodyColor: Colors.black),
  primaryColor: PRIMARY_COLOR,
  backgroundColor: LIGHT_BACKGROUND_COLOR,
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(primary: PRIMARY_COLOR)),
  textButtonTheme:
      TextButtonThemeData(style: TextButton.styleFrom(primary: PRIMARY_COLOR)),
);
