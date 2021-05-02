import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:inkubox_app/app/controllers/calculator_controller.dart';

class CalculatorView extends GetWidget<CalculatorController> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: Container(
        width: Get.width / 2.5,
        height: 600,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SelectableText('Sum (USD)'),
              TextFormField(
                controller: controller.inputController,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
                ],
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                    prefix: Text('\$'),
                    labelText: 'Enter Amount in USD',
                    hintStyle: TextStyle(fontWeight: FontWeight.w600)),
                onEditingComplete: () => controller.calculate(),
              ),
              SelectableText('Calculated sum: '),
              TextFormField(
                controller: controller.responseController,
                decoration: InputDecoration(
                    prefix: Text('\€'),
                    labelText: 'Calculated Amount in EUR',
                    hintStyle: TextStyle(fontWeight: FontWeight.w600)),
                enabled: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
