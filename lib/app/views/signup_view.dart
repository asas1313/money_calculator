import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inkubox_app/app/controllers/auth_controller.dart';
import 'package:inkubox_app/app/views/styles/styles.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SignupView extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          var textAlignment = TextStyles.getTextAlignment(sizingInformation);
          var titleSize = TextStyles.getTitleSize(sizingInformation);
          return Container(
            width: 600,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Sign Up',
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
                    return 'Enter valid e-mail address.';
                  },
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: controller.displayName,
                  decoration: InputDecoration(labelText: 'Display name'),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: controller.password,
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
                  controller: controller.passwordConfirm,
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Confirm password'),
                  autovalidateMode: AutovalidateMode.always,
                  validator: (value) {
                    if (value != controller.password.text) {
                      return 'Passwords do not match.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: controller.position,
                  decoration: InputDecoration(labelText: 'Position'),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: controller.phone,
                  decoration: InputDecoration(labelText: 'Phone'),
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
                        backgroundColor: Colors.red,
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
