import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inkubox_app/app/controllers/auth_controller.dart';
import 'package:inkubox_app/app/routes/app_routing.dart';
import 'package:inkubox_app/app/views/styles/colors.dart';

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
        ),
      ),
      SizedBox(width: 5),
      SizedBox(
        height: 20,
        width: 50,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: SECONDARY_COLOR),
            onPressed: () {
              controller.login();
            },
            child: Text(
              'Login',
              style: TextStyle(fontSize: 12, color: MAIN_BACKGROUND_COLOR),
            )),
      ),
      SizedBox(width: 5),
      TextButton(
          onPressed: () {
            Get.toNamed(Routes.SIGNUP);
          },
          child: Text(
            'Sign Up',
            style: TextStyle(fontSize: 12),
          )),
    ]);
  }
}
