import 'package:get/get.dart';

import '/app/controllers/admin_dashboard_controller.dart';

class AdminDashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminDashboardController>(() => AdminDashboardController());
  }
}
