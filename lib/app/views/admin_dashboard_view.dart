import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/admin_dashboard_controller.dart';
import '../utils/app_routing.dart';
import '../globals/widgets/app_controls/authenticated.dart';

class AdminDashboardView extends GetWidget<AdminDashboardController> {
  @override
  Widget build(BuildContext context) {
    return Authenticated(
      role: 'admin',
      child: Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(height: 25),
          Text('AdminDashboardView'),
          SizedBox(height: 25),
          ElevatedButton(
            onPressed: () => Get.toNamed(Routes.ADMIN_ALL_USERS),
            child: Text('Manage users'),
          ),
          SizedBox(height: 15),
          ElevatedButton(
            onPressed: () => Get.toNamed(Routes.ADMIN_ALL_CALCULATIONS),
            child: Text('Review all calculations'),
          ),
        ]),
      ),
    );
  }
}
