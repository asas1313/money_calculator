import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_calculator/app/app_controller.dart';
import 'package:money_calculator/app/core/values/styles.dart';

class ChangeThemeButton extends GetWidget<AppController> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 100,
      child: ElevatedButton(
        onPressed: () => controller.changeTheme(),
        child: Text(
          'change_theme_button'.tr,
          style: smallButtonStyle(context),
        ),
      ),
    );
  }
}
