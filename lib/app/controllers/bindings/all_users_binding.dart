import 'package:get/get.dart';

import '/app/controllers/all_users_controller.dart';

class AllUsersBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllUsersController>(() => AllUsersController());
  }
}
