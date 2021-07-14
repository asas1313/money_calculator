import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../controllers/admin_dashboard_controller.dart';
import '../utils/app_routing.dart';
import '../globals/widgets/app_controls/authenticated.dart';

class AdminDashboardView extends GetWidget<AdminDashboardController> {
  @override
  Widget build(BuildContext context) {
    return Authenticated(
      role: 'admin',
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) => Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(height: 25),
            Text('admin_dashboard_title'.tr),
            SizedBox(height: 25),
            ElevatedButton(
              onPressed: () => Get.toNamed(Routes.ADMIN_ALL_USERS),
              child: Text('admin_dashboard_manage_users'.tr),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () => Get.toNamed(Routes.ADMIN_ALL_CALCULATIONS),
              child: Text('admin_dashboard_all_calculations'.tr),
            ),
          ]),
        ),
      ),
    );
  }
}
