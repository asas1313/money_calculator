import 'package:flutter/material.dart';

const MAIN_BACKGROUND_COLOR = Colors.white;

Map<int, Color> primaryColorMap = {
  50: Color.fromRGBO(242, 109, 83, .1),
  100: Color.fromRGBO(242, 109, 83, .2),
  200: Color.fromRGBO(242, 109, 83, .3),
  300: Color.fromRGBO(242, 109, 83, .4),
  400: Color.fromRGBO(242, 109, 83, .5),
  500: Color.fromRGBO(242, 109, 83, .6),
  600: Color.fromRGBO(242, 109, 83, .7),
  700: Color.fromRGBO(242, 109, 83, .8),
  800: Color.fromRGBO(242, 109, 83, .9),
  900: Color.fromRGBO(242, 109, 83, 1),
};

const PRIMARY_COLOR = Color.fromRGBO(242, 109, 83, 1);
final materialPrimaryColor = MaterialColor(0xf26d53, primaryColorMap);

Map<int, Color> secondaryColorMap = {
  50: Color.fromRGBO(6, 130, 130, .1),
  100: Color.fromRGBO(6, 130, 130, .2),
  200: Color.fromRGBO(6, 130, 130, .3),
  300: Color.fromRGBO(6, 130, 130, .4),
  400: Color.fromRGBO(6, 130, 130, .5),
  500: Color.fromRGBO(6, 130, 130, .6),
  600: Color.fromRGBO(6, 130, 130, .7),
  700: Color.fromRGBO(6, 130, 130, .8),
  800: Color.fromRGBO(6, 130, 130, .9),
  900: Color.fromRGBO(6, 130, 130, 1),
};

const SECONDARY_COLOR = Color.fromRGBO(6, 130, 130, 1);
final materialSecondaryColor = MaterialColor(0x068282, secondaryColorMap);
