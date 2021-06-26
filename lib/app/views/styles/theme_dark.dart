import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inkubox_app/app/views/styles/styles.dart';

final themeDark = ThemeData(
    brightness: Brightness.dark,
    textTheme: GoogleFonts.sairaTextTheme(Get.textTheme)
        .apply(displayColor: Colors.white, bodyColor: Colors.white),
    primaryColor: SECONDARY_COLOR,
    backgroundColor: DARK_BACKGROUND_COLOR,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(primary: SECONDARY_COLOR)),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(primary: SECONDARY_COLOR)));
