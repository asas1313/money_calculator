import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_calculator/app/core/values/styles.dart';
import 'package:money_calculator/app/global_widgets/change_theme_button.dart';
import 'package:money_calculator/app/modules/auth/controllers/auth_controller.dart';
import 'package:money_calculator/app/routes/app_pages.dart';

class LoginRow extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Row(children: [
      SizedBox(
        width: Get.width / 8,
        child: TextFormField(
          controller: emailController,
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
          controller: passwordController,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
            border: InputBorder.none,
            labelStyle: TextStyle(fontSize: 12),
          ),
          onFieldSubmitted: (value) => controller.login(
            emailController.text,
            passwordController.text,
            goToHome: true,
          ),
        ),
      ),
      SizedBox(width: 5),
      SizedBox(
        height: 20,
        width: 50,
        child: ElevatedButton(
            onPressed: () {
              controller.login(
                emailController.text,
                passwordController.text,
              );
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
