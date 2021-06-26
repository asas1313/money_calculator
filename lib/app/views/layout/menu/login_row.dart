import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inkubox_app/app/controllers/auth_controller.dart';
import 'package:inkubox_app/app/routes/app_routing.dart';
import 'package:inkubox_app/app/views/styles/styles.dart';
import 'package:inkubox_app/app/views/widgets/change_theme_button.dart';

class LoginRow extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SizedBox(
        width: Get.width / 8,
        child: TextFormField(
          controller: controller.email,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Email',
            border: InputBorder.none,
            labelStyle: TextStyle(fontSize: 12),
          ),
        ),
      ),
      SizedBox(width: 5),
      SizedBox(
        width: Get.width / 8,
        child: TextFormField(
          controller: controller.password,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
            border: InputBorder.none,
            labelStyle: TextStyle(fontSize: 12),
          ),
          onFieldSubmitted: (value) => controller.login(goToHome: true),
        ),
      ),
      SizedBox(width: 5),
      SizedBox(
        height: 20,
        width: 50,
        child: ElevatedButton(
            onPressed: () {
              controller.login();
            },
            child: Text(
              'Login',
              style: smallButtonStyle(context),
            )),
      ),
      SizedBox(width: 5),
      TextButton(
          onPressed: () {
            Get.toNamed(Routes.SIGNUP);
          },
          child: Text(
            'Sign Up',
            style: smallTextButtonStyle(context),
          )),
      SizedBox(width: 5),
      ChangeThemeButton(),
      SizedBox(width: 5),
    ]);
  }
}
