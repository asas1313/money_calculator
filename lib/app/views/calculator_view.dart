import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../controllers/calculator_controller.dart';
import '../globals/widgets/app_controls/authenticated.dart';

class CalculatorView extends GetWidget<CalculatorController> {
  @override
  Widget build(BuildContext context) {
    return Authenticated(
      child: FittedBox(
        fit: BoxFit.contain,
        child: ResponsiveBuilder(
          builder: (context, sizingInformation) {
            var width =
                (sizingInformation.isDesktop) ? Get.width / 1.5 : Get.width;
            return Container(
              width: width,
              height: 600,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 25),
                    SelectableText('calculator_sum_usd'.tr),
                    TextFormField(
                      controller: controller.inputController,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+\.?\d*')),
                      ],
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                          prefix: Text('\$'),
                          labelText: 'calculatoe_sum_usd_hint'.tr,
                          hintStyle: TextStyle(fontWeight: FontWeight.w600)),
                      onEditingComplete: () => controller.calculate(),
                    ),
                    Text('calculator_sum_usd_undertext'.tr),
                    SizedBox(height: 25),
                    SelectableText('calculator_calculated_sum_eur'.tr),
                    TextFormField(
                      controller: controller.responseController,
                      decoration: InputDecoration(
                          prefix: Text('\€'),
                          labelText: 'calculator_calculated_sum_eur_hint'.tr,
                          hintStyle: TextStyle(fontWeight: FontWeight.w600)),
                      enabled: false,
                    ),
                    SizedBox(height: 25),
                    SelectableText('calculator_eur_to_usd_rate'.tr),
                    TextFormField(
                      controller: controller.currencyRateController,
                      decoration: InputDecoration(
                          prefix: Text('\€'),
                          labelText: 'calculator_eur_to_usd_rate_hint'.tr,
                          hintStyle: TextStyle(fontWeight: FontWeight.w600)),
                      enabled: false,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
