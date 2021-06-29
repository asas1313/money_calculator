import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_calculator/app/core/values/styles.dart';
import 'package:money_calculator/app/global_widgets/change_theme_button.dart';
import 'package:money_calculator/app/modules/auth/controllers/auth_controller.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LogoutColumn extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Column(children: [
        Obx(() => SizedBox(
              width: Get.width,
              child: Center(
                child: Text(
                  controller.isLogedIn.value
                      ? controller.screenName
                      : 'Not connected!',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            )),
        SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 30,
          width: 120,
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
        SizedBox(height: 10),
        SizedBox(
          height: 30,
          width: 120,
          child: ChangeThemeButton(),
        ),
      ]),
    );
  }
}
