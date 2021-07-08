import 'package:flutter/material.dart';

import 'package:get/get.dart';
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
                  'Sign Up',
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
                    return 'Enter valid e-mail address.';
                  },
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: controller.displayNameController,
                  decoration: InputDecoration(labelText: 'Display Name'),
                  autovalidateMode: AutovalidateMode.always,
                  validator: (value) {
                    if ((value ?? '').isEmpty) {
                      return 'Display Name is required.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: controller.passwordController,
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Password'),
                  autovalidateMode: AutovalidateMode.always,
                  validator: (value) {
                    if ((value ?? '').isEmpty) {
                      return 'Password is required.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: controller.confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Confirm password'),
                  autovalidateMode: AutovalidateMode.always,
                  validator: (value) {
                    if (value != controller.passwordController.text) {
                      return 'Passwords do not match.';
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
                  child: Text('Sign Up'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
