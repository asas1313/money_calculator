import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../controllers/auth_controller.dart';
import '../globals/styles/styles.dart';

class SignupView extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: ResponsiveBuilder(
          builder: (context, sizingInformation) {
            var textAlignment = TextStyles.getTextAlignment(sizingInformation);
            var titleSize = TextStyles.getTitleSize(sizingInformation);
            return Container(
              padding: EdgeInsets.all(25),
              width: 600,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'sign_up_title'.tr,
                    style: TextStyle(
                        fontWeight: FontWeight.w200,
                        height: 1.1,
                        fontSize: titleSize,
                        letterSpacing: 3),
                    textAlign: textAlignment,
                  ),
                  Divider(),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: controller.email,
                    keyboardType: TextInputType.emailAddress,
                    autovalidateMode: AutovalidateMode.always,
                    validator: (value) {
                      if (RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value ?? '')) {
                        return null;
                      }
                      return 'sign_up_error_email_field'.tr;
                    },
                    decoration: InputDecoration(
                      labelText: 'sign_up_label_email'.tr,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: controller.password,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'sign_up_label_password'.tr,
                    ),
                    autovalidateMode: AutovalidateMode.always,
                    validator: (value) {
                      if ((value ?? '').isEmpty) {
                        return 'sign_up_error_password_field'.tr;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: controller.passwordConfirm,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'sign_up_label_confirm_password'.tr,
                    ),
                    autovalidateMode: AutovalidateMode.always,
                    validator: (value) {
                      if (value != controller.password.text) {
                        return 'sign_up_error_confirm_password_field'.tr;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      var _error = controller.validate();
                      if (_error == null) {
                        controller.createAccount();
                      } else {
                        Get.snackbar(
                          'error_title'.tr,
                          _error,
                          backgroundColor: Get.theme.errorColor,
                          duration: Duration(seconds: 5),
                        );
                      }
                    },
                    child: Text('sign_up_button'.tr),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
