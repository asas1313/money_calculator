import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/controllers/app_controller.dart';
import 'app/controllers/auth_controller.dart';
import 'app/controllers/user_controller.dart';
import 'app/utils/app_routing.dart';
import 'app/utils/localization/app_translation.dart';
import 'app/views/home_view.dart';
import 'app/globals/styles/styles.dart';
import 'app/globals/layout/layout_template.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  final authController = Get.put(AuthController());
  final appController = Get.put(AppController());
  final userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Directionality(
              textDirection: TextDirection.ltr,
              child: Center(
                child: Text('Something went wrong!'),
              ),
            );
          } else if (snapshot.hasData) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'InkuboX app',
              theme: themeLight,
              darkTheme: themeDark,
              home:
                  LayoutTemplate(child: HomeView(), isNavigationVisible: false),
              getPages: AppRouting.appPages,
              translations: AppTranslation(),
              locale: appController.appLocale,
            );
          } else {
            // Otherwise, show something whilst waiting for initialization to complete
            return Directionality(
              textDirection: TextDirection.ltr,
              child: Center(
                child: Text('Loading...'),
              ),
            );
          }
        });
  }
}
