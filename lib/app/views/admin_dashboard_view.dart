import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inkubox_app/app/controllers/admin_dashboard_controller.dart';
import 'package:inkubox_app/app/views/widgets/authenticated.dart';

class AdminDashboardView extends GetWidget<AdminDashboardController> {
  @override
  Widget build(BuildContext context) {
    return Authenticated(
      role: 'admin',
      child: Container(
        child: Center(
          child: Text('AdminDashboardView'),
        ),
      ),
    );
  }
}
