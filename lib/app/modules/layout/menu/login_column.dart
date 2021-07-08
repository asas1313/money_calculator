import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_calculator/app/core/values/styles.dart';
import 'package:money_calculator/app/global_widgets/change_theme_button.dart';
import 'package:money_calculator/app/modules/auth/controllers/auth_controller.dart';
import 'package:money_calculator/app/routes/app_pages.dart';

class LoginColumn extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Column(children: [
      SizedBox(
        width: Get.width,
        child: TextFormField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Email',
            border: InputBorder.none,
            labelStyle: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
      SizedBox(height: 5),
      SizedBox(
        width: Get.width,
        child: TextFormField(
          controller: passwordController,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
            border: InputBorder.none,
            labelStyle: TextStyle(fontSize: 18, color: Colors.white),
          ),
          onFieldSubmitted: (value) => controller.loginWithEmailAndPassword(
            emailController.text,
            passwordController.text,
            goToHome: true,
          ),
        ),
      ),
      SizedBox(height: 5),
      SizedBox(
        height: 30,
        width: 90,
        child: ElevatedButton(
            onPressed: () {
              controller.loginWithEmailAndPassword(
                emailController.text,
                passwordController.text,
              );
            },
            child: Text(
              'Login',
              style: smallButtonStyle(context),
            )),
      ),
      SizedBox(height: 5),
      TextButton(
          onPressed: () {
            Get.toNamed(Routes.SIGNUP);
          },
          child: Text(
            'Sign Up',
            style: smallTextButtonStyle(context),
          )),
      SizedBox(height: 25),
      ChangeThemeButton(),
      SizedBox(height: 25)
    ]);
  }
}
