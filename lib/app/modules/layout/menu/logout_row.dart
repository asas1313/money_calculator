import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_calculator/app/core/values/styles.dart';
import 'package:money_calculator/app/global_widgets/change_theme_button.dart';
import 'package:money_calculator/app/modules/auth/controllers/auth_controller.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LogoutRow extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: Get.width / 10,
            child: Text(
              controller.isLoggedIn
                  ? controller.user.value!.displayName
                  : 'Not connected!',
              style: TextStyle(fontSize: 12),
            ),
          ),
          SizedBox(
            width: 5,
            height: 50,
          ),
          SizedBox(
            height: 20,
            width: 65,
            child: ElevatedButton(
              onPressed: () {
                Get.find<AuthController>().logout();
              },
              child: Text(
                'Logout',
                style: smallButtonStyle(context),
              ),
            ),
          ),
          SizedBox(width: 5),
          ChangeThemeButton(),
          SizedBox(width: 5),
        ],
      ),
    );
  }
}
