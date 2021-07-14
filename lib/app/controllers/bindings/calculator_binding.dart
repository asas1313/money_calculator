import 'package:get/get.dart';

import '/app/controllers/calculator_controller.dart';

class CalculatorBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CalculatorController>(() => CalculatorController());
  }
}
