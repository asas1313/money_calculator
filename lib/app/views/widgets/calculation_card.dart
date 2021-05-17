import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inkubox_app/app/controllers/calculator_controller.dart';
import 'package:inkubox_app/app/models/calculation_model.dart';

class CalculationCard extends StatelessWidget {
  final CalculationModel model;
  final controller = CalculatorController();

  CalculationCard({required this.model}) {
    controller.loadController(model.id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
          child: ListTile(
              onTap: () => _checkCard(),
              title: SizedBox(
                width: Get.width / 2,
                child: Text(model.email),
              ),
              subtitle: Row(
                children: [
                  Text(Timestamp.fromMillisecondsSinceEpoch(
                          controller.timestamp.value)
                      .toDate()
                      .toLocal()
                      .toIso8601String()),
                  Spacer(),
                  Text('Initial sum: ${model.sumInitial},'),
                  Spacer(),
                  Text('Calculated sum: ${model.sumCalculated}.')
                ],
              ),
              leading: Container(child: Text('A')),
              trailing: Icon(Icons.delete))),
    );
  }

  _checkCard() {
    Get.snackbar('Message', 'Row checked');
  }
}
