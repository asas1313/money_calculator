import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/controllers/user_controller.dart';
import '/app/utils/app_routing.dart';

class Authenticated extends GetWidget<UserController> {
  final Widget child;
  final String role;

  Authenticated({required this.child, this.role = 'any'});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.email.isNotEmpty
        ? (controller.enabled.value)
            ? (controller.role.value == role || role == 'any')
                ? child
                : Directionality(
                    textDirection: TextDirection.ltr,
                    child: Center(
                      child: Text(
                        'Unauthorized access!',
                        style: TextStyle(
                            color: Get.theme.errorColor, fontSize: 20),
                      ),
                    ),
                  )
            : Center(
                child: Text(
                  'Your account is not enabled by system administrator!',
                  style: TextStyle(color: Get.theme.errorColor, fontSize: 20),
                ),
              )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You are not loged in!',
                style: TextStyle(color: Get.theme.errorColor, fontSize: 20),
              ),
              TextButton(
                  onPressed: () => Get.toNamed(Routes.LOGIN),
                  child: Text('Login')),
              Text('or'),
              TextButton(
                  onPressed: () => Get.toNamed(Routes.SIGNUP),
                  child: Text('Sign Up')),
            ],
          ));
  }
}
