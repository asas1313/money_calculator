import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:money_calculator/app/core/values/styles.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          return Container(
            padding: EdgeInsets.all(25),
            width: 600,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'sign_up_title'.tr,
                  style: Get.textTheme.headline2,
                  textAlign: TextAlign.center,
                ),
                Divider(),
                SizedBox(height: 20),
                TextFormField(
                  controller: controller.emailController,
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
                  controller: controller.displayNameController,
                  decoration: InputDecoration(
                      labelText: 'sign_uo_label_display_name'.tr),
                  autovalidateMode: AutovalidateMode.always,
                  validator: (value) {
                    if ((value ?? '').isEmpty) {
                      return 'sign_up_error_display_name_field'.tr;
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: controller.passwordController,
                  obscureText: true,
                  decoration:
                      InputDecoration(labelText: 'sign_up_label_password'.tr),
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
                  controller: controller.confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'sign_up_label_confirm_password'.tr),
                  autovalidateMode: AutovalidateMode.always,
                  validator: (value) {
                    if (value != controller.passwordController.text) {
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
                        'Error',
                        _error,
                        backgroundColor: Get.theme.errorColor,
                        duration: Duration(seconds: 5),
                      );
                    }
                  },
                  child: Text(
                    'sign_up_button'.tr,
                    style: smallButtonStyle(context),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
