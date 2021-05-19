import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inkubox_app/app/repositories/storage_repository.dart';
import 'package:inkubox_app/app/repositories/user_repository.dart';

class ProfileController extends GetxController {
  final String email;

  final role = ''.obs;
  final displayName = TextEditingController(text: '');
  final position = TextEditingController(text: '');
  final phone = TextEditingController(text: '');
  final enabled = false.obs;
  final avatarUrl = ''.obs;

  final repository = UserRepository();
  final fsInstance = FirebaseFirestore.instance;
  final storage = StorageRepository();

  PickedFile? imageFile;

  ProfileController({required this.email});

  @override
  void onReady() {
    super.onReady();
    repository.findUserByEmail(email).then((model) {
      role.value = model.role;
      displayName.text = model.displayName ?? '';
      position.text = model.position ?? '';
      phone.text = model.phone ?? '';
      enabled.value = model.enabled;
      avatarUrl.value = model.avatarUrl ?? '';
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
    repository.updateUserDisplayName(
        email: email, displayName: displayName.text);
  }

  _updatePosition() async {
    repository.updateUserPosition(email: email, position: position.text);
  }

  _updatePhone() async {
    repository.updateUserPhone(email: email, phone: phone.text);
  }

  changeEnabled() async {
    enabled.value = !enabled.value;
    repository.setEnabled(email: email, enabled: enabled.value);
  }

  void setAvatar() async {
    Get.snackbar('Message', 'Sorry! Feature is not implemented yet.');
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
}
