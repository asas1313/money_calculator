import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class TextStyles {
  static TextAlign getTextAlignment(SizingInformation sizingInformation) {
    return sizingInformation.deviceScreenType == DeviceScreenType.desktop
        ? TextAlign.left
        : TextAlign.center;
  }

  static double getTitleSize(SizingInformation sizingInformation) {
    return sizingInformation.deviceScreenType == DeviceScreenType.mobile
        ? 50.0
        : 60.0;
  }
}
