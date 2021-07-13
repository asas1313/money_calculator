import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '/app/controllers/auth_controller.dart';
import '/app/utils/app_routing.dart';
import '/app/globals/styles/styles.dart';
import '/app/globals/widgets/app_controls/change_theme_button.dart';

class LoginRow extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      return Container(
        width: sizingInformation.screenSize.width / 2,
        child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.end,
            spacing: 5.0,
            runSpacing: 5.0,
            children: [
              SizedBox(
                width: 120,
                child: TextFormField(
                  controller: controller.email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'login_email'.tr,
                    border: InputBorder.none,
                    labelStyle: TextStyle(fontSize: 12),
                  ),
                ),
              ),
              SizedBox(
                width: 120,
                child: TextFormField(
                  controller: controller.password,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'login_password'.tr,
                    border: InputBorder.none,
                    labelStyle: TextStyle(fontSize: 12),
                  ),
                  onFieldSubmitted: (value) => controller.login(goToHome: true),
                ),
              ),
              SizedBox(
                height: 20,
                child: ElevatedButton(
                    onPressed: () {
                      controller.login();
                    },
                    child: Text(
                      'login_button'.tr,
                      style: smallButtonStyle(context),
                    )),
              ),
              TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.SIGNUP);
                  },
                  child: Text(
                    'sign_up_button'.tr,
                    style: smallTextButtonStyle(context),
                  )),
              ChangeThemeButton(),
            ]),
      );
    });
  }
}
