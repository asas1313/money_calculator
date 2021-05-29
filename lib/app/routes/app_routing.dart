import 'package:get/get.dart';
import 'package:inkubox_app/app/controllers/bindings/admin_dashboard_binding.dart';
import 'package:inkubox_app/app/controllers/bindings/all_calculation_binding.dart';
import 'package:inkubox_app/app/controllers/bindings/all_users_binding.dart';
import 'package:inkubox_app/app/controllers/bindings/calculator_binding.dart';
import 'package:inkubox_app/app/controllers/bindings/profile_binding.dart';
import 'package:inkubox_app/app/views/calculator_view.dart';
import 'package:inkubox_app/app/views/home_view.dart';
import 'package:inkubox_app/app/views/admin_dashboard_view.dart';
import 'package:inkubox_app/app/views/layout/layout_template.dart';
import 'package:inkubox_app/app/views/login_view.dart';
import 'package:inkubox_app/app/views/profile_view.dart';
import 'package:inkubox_app/app/views/signup_view.dart';
import 'package:inkubox_app/app/views/all_users_view.dart';
import 'package:inkubox_app/app/views/all_calculations_view.dart';

class Routes {
  static const HOME = '/home';
  static const SIGNUP = '/signup';
  static const LOGIN = '/login';
  static const PROFILE = '/profile';
  static const CALCULATOR = '/calculator';
  static const ADMIN_DASHBOARD = '/admin-dashboard';
  static const ADMIN_ALL_USERS = '/admin-all-users';
  static const ADMIN_ALL_CALCULATIONS = '/admin-all-calculations';
}

class AppRouting {
  static var appPages = [
    GetPage(
      name: Routes.HOME,
      page: () => LayoutTemplate(child: HomeView()),
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => LayoutTemplate(child: SignupView()),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginView(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => LayoutTemplate(child: ProfileView()),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.CALCULATOR,
      page: () => LayoutTemplate(child: CalculatorView()),
      binding: CalculatorBinding(),
    ),
    GetPage(
      name: Routes.ADMIN_DASHBOARD,
      page: () => LayoutTemplate(child: AdminDashboardView()),
      binding: AdminDashboardBinding(),
    ),
    GetPage(
      name: Routes.ADMIN_ALL_USERS,
      page: () => LayoutTemplate(child: AllUsersView()),
      binding: AllUsersBinding(),
    ),
    GetPage(
      name: Routes.ADMIN_ALL_CALCULATIONS,
      page: () => LayoutTemplate(child: AllCalculationsView()),
      binding: AllCalculationsBinding(),
    ),
  ];
}
