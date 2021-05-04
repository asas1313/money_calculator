import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inkubox_app/app/controllers/auth_controller.dart';

class Authenticated extends GetWidget<AuthController> {
  final Widget child;
  final String role;

  Authenticated({required this.child, this.role = 'user'});

  @override
  Widget build(BuildContext context) {
    return controller.signedIn
        ? controller.role.text == role
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
        : Directionality(
            textDirection: TextDirection.ltr,
            child: Center(
              child: Text(
                'You are not signed in!',
                style: TextStyle(color: Colors.red, fontSize: 20),
              ),
            ),
          );
  }
}
