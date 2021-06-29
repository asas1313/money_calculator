import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_calculator/app/app_controller.dart';
import 'package:money_calculator/app/routes/app_pages.dart';

class Logo extends GetWidget<AppController> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.HOME),
      child: Obx(() => Image.asset(
            controller.logoPath.value,
            fit: BoxFit.contain,
          )),
    );
  }
}
