import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inkubox_app/app/utils/firestore.dart';

class UserController extends GetxController {
  final role = ''.obs;
  final email = TextEditingController(text: '');
  final displayName = TextEditingController(text: '');
  final position = TextEditingController(text: '');
  final phone = TextEditingController(text: '');
  final enabled = false.obs;
  final avatarUrl = ''.obs;

  final firestore = Firestore();
  final fsInstance = FirebaseFirestore.instance;

  @override
  void onReady() {
    super.onReady();
  }

  @mustCallSuper
  @override
  void onClose() {
    //
    super.onClose();
  }

  bool loadController(String emailToLoad) {
    try {
      firestore.findUserByEmail(emailToLoad).then((model) {
        role.value = model.role;
        email.text = model.email;
        displayName.text = model.displayName ?? '';
        position.text = model.position ?? '';
        phone.text = model.phone ?? '';
        enabled.value = model.enabled;
        avatarUrl.value = model.avatarUrl ?? '';
      });
      displayName.addListener(_updateDisplayName);
      position.addListener(_updatePosition);
      phone.addListener(_updatePhone);
      return true;
    } catch (e) {
      print('User' 's information loading error! \n $e');
      return false;
    }
  }

  _updateDisplayName() async {
    firestore.updateUserDisplayName(
        email: email.text, displayName: displayName.text);
  }

  _updatePosition() async {
    firestore.updateUserPosition(email: email.text, position: position.text);
  }

  _updatePhone() async {
    firestore.updateUserPhone(email: email.text, phone: phone.text);
  }

  changeEnabled() async {
    enabled.value = !enabled.value;
    firestore.setEnabled(email: email.text, enabled: enabled.value);
  }

  setAvatar() async {
    avatarUrl.value =
        'https://images.unsplash.com/photo-1619449947405-6aa13108371a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=346&q=80';
    firestore.setAvatar(email: email.text, avatarUrl: avatarUrl.value);
  }
}
