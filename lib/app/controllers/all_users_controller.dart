import 'package:get/get.dart';

import '/app/repositories/user_repository.dart';

class AllUsersController extends GetxController {
  final firestore = UserRepository();

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    //
    super.onClose();
  }

  changeUserMode(String email, bool enabled) {
    firestore.setEnabled(email: email, enabled: enabled);
    Get.snackbar(
      'info_title'.tr,
      'all_users_info_access_mode'.tr,
      backgroundColor: Get.theme.backgroundColor,
    );
  }
}
