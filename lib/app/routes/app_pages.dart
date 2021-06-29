import 'package:get/get.dart';

import 'package:money_calculator/app/modules/auth/bindings/auth_binding.dart';
import 'package:money_calculator/app/modules/auth/views/auth_view.dart';
import 'package:money_calculator/app/modules/home/bindings/home_binding.dart';
import 'package:money_calculator/app/modules/home/views/home_view.dart';
import 'package:money_calculator/app/modules/layout/layout_template.dart';
import 'package:money_calculator/app/modules/signup/bindings/signup_binding.dart';
import 'package:money_calculator/app/modules/signup/views/signup_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => LayoutTemplate(child: HomeView()),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => LayoutTemplate(child: AuthView()),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => LayoutTemplate(child: SignupView()),
      binding: SignupBinding(),
    ),
  ];
}
