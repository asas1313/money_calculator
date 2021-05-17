import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inkubox_app/app/controllers/auth_controller.dart';
import 'package:inkubox_app/app/repositories/callculation_repository.dart';

class CalculatorController extends GetxController {
  final firestore = Firestore();
  final email = ''.obs;
  final inputController = TextEditingController();
  final responseController = TextEditingController();
  final timestamp = Timestamp.now().millisecondsSinceEpoch.obs;

  void calculate() {
    var _initial = double.tryParse(inputController.text) ?? 0;
    final _sum = _initial * 0.003 + 3.5;
    firestore.addCalculation(
        email: Get.find<AuthController>().email.text,
        timestamp: Timestamp.now().millisecondsSinceEpoch,
        sumInitial: _initial,
        sumCalculated: _sum);
    responseController.text = _sum.toStringAsFixed(2);
  }

  loadController(String id) {
    try {
      firestore.findCalculationById(id).then((model) {
        email.value = model.email;
        inputController.text = model.sumInitial.toString();
        responseController.text = model.sumCalculated.toString();
        timestamp.value = model.timestamp;
      });
    } catch (e) {
      print('User' 's information loading error! \n $e');
    }
  }
}
