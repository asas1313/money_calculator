import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inkubox_app/app/controllers/app_controller.dart';
import 'package:inkubox_app/app/controllers/auth_controller.dart';
import 'package:inkubox_app/app/routes/routing_controller.dart';
import 'package:inkubox_app/app/views/home_view.dart';
import 'package:inkubox_app/app/views/layout/layout_template.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(AuthController());
  Get.put(AppController());
  runApp(App());
}

class App extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  final routingController = Get.put(RoutingController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        // Initialize FlutterFire:
        future: _initialization,
        builder: (context, snapshot) {
          // Check for errors
          if (snapshot.hasError) {
            return Directionality(
              textDirection: TextDirection.ltr,
              child: Center(
                child: Text('Something went wrong!'),
              ),
            );
          } else if (snapshot.hasData) {
            return GetMaterialApp(
              title: 'InkuboX app',
              theme: ThemeData(
                textTheme: GoogleFonts.sairaTextTheme(Get.textTheme),
              ),
              home: LayoutTemplate(child: HomeView()),
              getPages: routingController.appPages,
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
