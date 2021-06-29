import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:money_calculator/app/app_controller.dart';
import 'package:money_calculator/app/modules/auth/controllers/auth_controller.dart';
import 'app/money_calculator_app.dart';

void main() {
  Get.lazyPut(() => AppController());
  Get.lazyPut(() => AuthController());

  runApp(MoneyCalculatorApp());
}
