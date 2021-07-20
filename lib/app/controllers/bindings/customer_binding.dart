import 'package:get/get.dart';
import 'package:inkubox_app/app/controllers/customer_controller.dart';

class CustomerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomerController>(() => CustomerController());
  }
}
