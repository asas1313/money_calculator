import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_calculator/app/core/theme/themes.dart';

import 'core/values/app_translation.dart';
import 'routes/app_pages.dart';

class MoneyCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Directionality(
            textDirection: TextDirection.ltr,
            child: Center(
              child: Text('Something went wrong!'),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Money Calculator',
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
            translations: AppTranslation(),
            locale: Get.deviceLocale,
            fallbackLocale: Locale('en', 'US'),
            theme: themeLight,
            darkTheme: themeDark,
          );
        } else {
          return Directionality(
            textDirection: TextDirection.ltr,
            child: Center(
              child: Text('Loading...'),
            ),
          );
        }
      },
    );
  }
}
