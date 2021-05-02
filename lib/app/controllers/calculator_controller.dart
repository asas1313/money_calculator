import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inkubox_app/app/controllers/auth_controller.dart';
import 'package:inkubox_app/app/utils/firestore.dart';

class CalculatorController extends GetxController {
  final firestore = Firestore();
  final inputController = TextEditingController();
  final responseController = TextEditingController();

  void calculate() {
    var _initial = double.tryParse(inputController.text) ?? 0;
    final _sum = _initial * 0.003 + 3.5;
    firestore.addCalculation(
        email: Get.find<AuthController>().email ?? 'unknown',
        timestamp: Timestamp.now(),
        sumInitial: _initial,
        sumCalculated: _sum);
    responseController.text = _sum.toStringAsFixed(2);
  }
}
