import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/controllers/auth_controller.dart';
import '/app/utils/app_routing.dart';
import '/app/globals/styles/styles.dart';
import '/app/globals/widgets/app_controls/change_theme_button.dart';

class LoginColumn extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        width: Get.width,
        child: TextFormField(
          controller: controller.email,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'login_email'.tr,
            border: InputBorder.none,
            labelStyle: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
      SizedBox(height: 5),
      SizedBox(
        width: Get.width,
        child: TextFormField(
          controller: controller.password,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'login_password'.tr,
            border: InputBorder.none,
            labelStyle: TextStyle(fontSize: 18, color: Colors.white),
          ),
          onFieldSubmitted: (value) => controller.login(goToHome: true),
        ),
      ),
      SizedBox(height: 5),
      SizedBox(
        height: 30,
        width: 90,
        child: ElevatedButton(
            onPressed: () {
              controller.login();
            },
            child: Text(
              'login_button'.tr,
              style: smallButtonStyle(context),
            )),
      ),
      SizedBox(height: 5),
      TextButton(
          onPressed: () {
            Get.toNamed(Routes.SIGNUP);
          },
          child: Text(
            'sign_up_button'.tr,
            style: smallTextButtonStyle(context),
          )),
      SizedBox(height: 25),
      ChangeThemeButton(),
      SizedBox(height: 25)
    ]);
  }
}
