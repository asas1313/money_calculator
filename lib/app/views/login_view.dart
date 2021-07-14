import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../utils/app_routing.dart';
import '../globals/styles/styles.dart';
import '../controllers/auth_controller.dart';

class LoginView extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      var textAlignment = TextStyles.getTextAlignment(sizingInformation);
      var titleSize = TextStyles.getTitleSize(sizingInformation);
      return Material(
        child: Center(
          child: Container(
              width: 600,
              height: 400,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'login_title'.tr,
                      style: TextStyle(
                          fontWeight: FontWeight.w200,
                          height: 1.1,
                          fontSize: titleSize,
                          letterSpacing: 3),
                      textAlign: textAlignment,
                    ),
                    Divider(),
                    TextFormField(
                      controller: controller.email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'login_email'.tr,
                      ),
                    ),
                    TextFormField(
                      controller: controller.password,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'login_password'.tr,
                      ),
                      onFieldSubmitted: (value) =>
                          controller.login(goToHome: true),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                      child: Text('login_button'.tr),
                      onPressed: () => controller.login(goToHome: true),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton(
                          onPressed: () {
                            Get.toNamed(Routes.SIGNUP);
                          },
                          child: Text('sign_up_button'.tr),
                        ),
                        SizedBox(width: 20),
                        TextButton(
                          onPressed: () {
                            controller.resetPassword();
                          },
                          child: Text('login_reset_password'.tr),
                        ),
                      ],
                    ),
                  ])),
        ),
      );
    });
  }
}