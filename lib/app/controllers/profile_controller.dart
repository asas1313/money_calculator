import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/repositories/user_repository.dart';

import 'auth_controller.dart';

class ProfileController extends GetxController {
  final String email;

  final role = ''.obs;
  final displayName = TextEditingController(text: '');
  final position = TextEditingController(text: '');
  final phone = TextEditingController(text: '');
  final oldPassword = TextEditingController(text: '');
  final newPassword = TextEditingController(text: '');
  final confirmPassword = TextEditingController(text: '');
  final enabled = false.obs;
  final avatarUrl = ''.obs;

  final repository = UserRepository();

  bool _ready = false;

  ProfileController({required this.email});

  @override
  void onReady() {
    super.onReady();
    repository.findUserByEmail(email).then((model) {
      role.value = model.role;
      displayName.text = model.displayName;
      position.text = model.position;
      phone.text = model.phone;
      enabled.value = model.enabled;
      avatarUrl.value = model.avatarUrl;
      print('model loaded. enabled is ${model.enabled}');
      _ready = true;
    });
    displayName.addListener(_updateDisplayName);
    position.addListener(_updatePosition);
    phone.addListener(_updatePhone);
  }

  @mustCallSuper
  @override
  void onClose() {
    //
    super.onClose();
  }

  _updateDisplayName() async {
    if (_ready) {
      repository.updateUserDisplayName(
          email: email, displayName: displayName.text);
      Get.snackbar('info_title'.tr, 'profile_change_display_name_updated'.tr,
          backgroundColor: Get.theme.backgroundColor);
    }
  }

  _updatePosition() async {
    if (_ready) {
      repository.updateUserPosition(email: email, position: position.text);
      Get.snackbar('info_title'.tr, 'profile_change_possition_updated'.tr,
          backgroundColor: Get.theme.backgroundColor);
    }
  }

  _updatePhone() async {
    if (_ready) {
      repository.updateUserPhone(email: email, phone: phone.text);
      Get.snackbar('info_title'.tr, 'profile_change_phone_updated'.tr,
          backgroundColor: Get.theme.backgroundColor);
    }
  }

  changeEnabled() async {
    if (_ready) {
      enabled.value = !enabled.value;
      repository.setEnabled(email: email, enabled: enabled.value);
      Get.snackbar('info_title'.tr, 'profile_change_enabled_changed'.tr,
          backgroundColor: Get.theme.backgroundColor);
    }
  }

  void setAvatar() async {
    Get.snackbar('message_title'.tr, 'profile_change_unimplemented_feature'.tr);
    // final pickedFile = await ImagePicker().getImage(
    //   source: ImageSource.gallery,
    // );
    // if (pickedFile != null) {
    //   File image = File(pickedFile.path);
    //   storage.uploadAvatarImage(image).then((value) {
    //     avatarUrl.value = value ?? '';
    //     repository.setAvatar(email: email, avatarUrl: avatarUrl.value);
    //     Get.back();
    //   });
    // }
  }

  Future<String?> validatePassword() async {
    var _auth = Get.find<AuthController>();
    if (oldPassword.text == '') {
      return 'profile_change_password_empty'.tr;
    }
    var _retValue = await _auth.validatePassword(oldPassword.text);
    if (_retValue != null) {
      return _retValue;
    }
    return null;
  }

  changePassword() {
    var _auth = Get.find<AuthController>();
    _auth.changePassword(
        password: newPassword.text, passwordConfirm: confirmPassword.text);
    oldPassword.text = '';
    newPassword.text = '';
    confirmPassword.text = '';
    Get.snackbar('info_title'.tr, 'auth_message_password_changed'.tr,
        duration: Duration(seconds: 3));
  }
}
