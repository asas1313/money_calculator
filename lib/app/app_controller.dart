import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_calculator/app/core/theme/themes.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppController extends GetxController {
  final repository = PackageInfo.fromPlatform();

  final appVersion = ''.obs;
  final buildNumber = ''.obs;
  final dbVersion = ''.obs;

  final logoPath = 'assets/img/logo_sm.png'.obs;

  late Locale appLocale;

  @override
  void onInit() {
    appLocale = Get.deviceLocale ?? Locale('en_US');
    super.onInit();
  }

  @override
  onReady() {
    repository.then((PackageInfo packageInfo) {
      appVersion.value = packageInfo.version;
      buildNumber.value = packageInfo.buildNumber;
      print('Version: $appVersion, build: $buildNumber.');
    });
  }

  changeTheme() {
    Get.changeTheme(Get.isDarkMode ? themeLight : themeDark);
    logoPath.value = Get.isDarkMode
        ? 'assets/img/logo_sm.png'
        : 'assets/img/logo_white_sm.png';
    print('Theme set to dark = ${Get.isDarkMode}');
  }

  updateLocale(Locale locale) {
    appLocale = locale;
    Get.updateLocale(appLocale);
    print('Locale changed to $locale');
  }
}
