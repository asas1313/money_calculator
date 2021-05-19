import 'package:get/get.dart';
import 'package:inkubox_app/app/models/calculation_model.dart';
import 'package:inkubox_app/app/repositories/calculation_repository.dart';

class AllCalculationsController extends GetxController {
  final calculations = <CalculationModel>[].obs;

  final _repository = CalculationsRepository();

  @override
  void onReady() {
    super.onReady();
    _repository.getAllCalculations().then((_calculations) {
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
