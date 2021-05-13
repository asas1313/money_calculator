import 'package:get/get.dart';

import '../all_userts_controller.dart';

class AllUsersBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllUsersController>(() => AllUsersController());
  }
}
