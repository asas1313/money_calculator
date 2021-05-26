import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inkubox_app/app/controllers/calculator_controller.dart';
import 'package:inkubox_app/app/models/calculation_model.dart';

class CalculationCard extends StatelessWidget {
  final CalculationModel model;
  final controller = CalculatorController();

  CalculationCard({required this.model}) {
    controller.loadController(model);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: ListTile(
          onTap: () => _checkCard(),
          title: SizedBox(
            width: Get.width / 1.2,
            child: Text(model.email),
          ),
          subtitle: Row(
            children: [
              Text(model.operationTime.toIso8601String()),
              Spacer(),
              Text('${model.sumInitial}'),
              Spacer(),
              Text('${model.sumCalculated}'),
              Spacer(),
              Text('${model.currencyRate}'),
            ],
          ),
        ),
      ),
    );
  }

  _checkCard() {
    Get.snackbar('Message', 'Row checked');
  }
}
