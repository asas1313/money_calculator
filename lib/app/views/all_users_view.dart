import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inkubox_app/app/controllers/all_userts_controller.dart';
import 'package:inkubox_app/app/views/widgets/authenticated.dart';

class AllUsersView extends GetWidget<AllUsersController> {
  @override
  Widget build(BuildContext context) {
    return Authenticated(
      role: 'admin',
      child: Container(),
    );
  }
}
