import 'dart:ui';

import 'package:get/get.dart';
import '../repositories/settings_repository.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppController extends GetxController {
  var appVersion = ''.obs;
  var buildNumber = ''.obs;
  var dbVersion = ''.obs;

  late Locale appLocale;

  @override
  void onInit() {
    appLocale = Get.deviceLocale ?? Locale('en_US');
    super.onInit();
  }

  @override
  onReady() {
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      appVersion.value = packageInfo.version;
      buildNumber.value = packageInfo.buildNumber;
      print('Version: $appVersion, build: $buildNumber.');
    });
    final fb = Firestore();
    fb.getDBVersion().then((value) {
      print('Database version: $value.');
      dbVersion.value = value;
    });
  }

  updateLocale(Locale locale) {
    appLocale = locale;
    Get.updateLocale(appLocale);
    print('Locale changed to $locale');
  }
}
