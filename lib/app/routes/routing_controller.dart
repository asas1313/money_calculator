import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inkubox_app/app/controllers/bindings/calculator_binding.dart';
import 'package:inkubox_app/app/routes/app_routes.dart';
import 'package:inkubox_app/app/views/calculator_view.dart';
import 'package:inkubox_app/app/views/home_view.dart';
import 'package:inkubox_app/app/views/layout/layout_template.dart';
import 'package:inkubox_app/app/views/profile_view.dart';

class RoutingController extends GetxController {
  PageController controller = PageController();

  var appPages = [
    GetPage(
      name: Routes.HOME,
      page: () => LayoutTemplate(child: HomeView()),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => LayoutTemplate(child: ProfileView()),
    ),
    GetPage(
      name: Routes.CALCULATOR,
      page: () => LayoutTemplate(child: CalculatorView()),
      binding: CalculatorBinding(),
    ),
  ];
}
