import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inkubox_app/app/controllers/all_calculations_controller.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'widgets/authenticated.dart';
import 'widgets/calculation_card.dart';

class AllCalculationsView extends GetWidget<AllCalculationsController> {
  @override
  Widget build(BuildContext context) {
    return Authenticated(
      role: 'admin',
      child: FittedBox(
        fit: BoxFit.contain,
        child: ResponsiveBuilder(
          builder: (context, sizingInformation) {
            var padding = (sizingInformation.isMobile) ? 8.0 : 20.0;
            var width =
                (sizingInformation.isDesktop) ? Get.width / 2 : Get.width;
            return Obx(() => Container(
                  width: width,
                  height: 600,
                  child: ListView.builder(
                      padding: EdgeInsets.all(padding),
                      itemCount: controller.calculations.length,
                      itemBuilder: (context, index) {
                        return CalculationCard(
                            model: controller.calculations[index]);
                      }),
                ));
          },
        ),
      ),
    );
  }
}
