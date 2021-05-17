import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:inkubox_app/app/models/calculation_model.dart';
import 'package:inkubox_app/app/repositories/callculation_repository.dart';

class AllCalculationsController extends GetxController {
  final calculations = <CalculationModel>[].obs;

  final firestore = Firestore();
  final fsInstance = FirebaseFirestore.instance;

  @override
  void onReady() {
    super.onReady();
    firestore.getAllCalculations().then((_calculations) {
      calculations.value = _calculations;
      print('-= calculations loaded: ${_calculations.length}. =-');
    });
  }

  @override
  void onClose() {
    //
    super.onClose();
  }
}
