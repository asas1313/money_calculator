import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inkubox_app/app/controllers/auth_controller.dart';
import 'package:inkubox_app/app/repositories/calculation_repository.dart';

class CalculatorController extends GetxController {
  final _repository = CalculationsRepository();
  final email = ''.obs;
  final inputController = TextEditingController();
  final responseController = TextEditingController();
  final opertationTime = DateTime.now().obs;

  void calculate() {
    var _initial = double.tryParse(inputController.text) ?? 0;
    final _sum = _initial * 0.003 + 3.5;
    _repository.addCalculation(
        email: Get.find<AuthController>().email.text,
        operationTime: DateTime.now(),
        sumInitial: _initial,
        sumCalculated: _sum);
    responseController.text = _sum.toStringAsFixed(2);
  }

  loadController(String id) {
    try {
      _repository.findCalculationById(id).then((model) {
        email.value = model.email;
        inputController.text = model.sumInitial.toString();
        responseController.text = model.sumCalculated.toString();
        opertationTime.value = model.operationTime;
      });
    } catch (e) {
      print('User' 's information loading error! \n $e');
    }
  }
}
