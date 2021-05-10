import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inkubox_app/app/controllers/auth_controller.dart';
import 'package:inkubox_app/app/routes/app_routing.dart';

class Authenticated extends GetWidget<AuthController> {
  final Widget child;
  final String role;

  Authenticated({required this.child, this.role = 'any'});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.logedIn.value
        ? (controller.role.text == role || role == 'any')
            ? child
            : Directionality(
                textDirection: TextDirection.ltr,
                child: Center(
                  child: Text(
                    'Unauthorized access!',
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                ),
              )
        : Column(
            children: [
              Text(
                'You are not loged in!',
                style: TextStyle(color: Colors.red, fontSize: 20),
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
