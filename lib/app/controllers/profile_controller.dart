import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:inkubox_app/app/controllers/auth_controller.dart';
import 'package:inkubox_app/app/utils/firestore.dart';

class ProfileController extends GetxController {
  final role = ''.obs;
  final email = TextEditingController(text: '');
  final name = TextEditingController(text: '');
  final surname = TextEditingController(text: '');
  final position = TextEditingController(text: '');
  final phone = TextEditingController(text: '');

  final firestore = Firestore();
  final fsInstance = FirebaseFirestore.instance;
  late Stream documentStream;

  @mustCallSuper
  @override
  void onReady() {
    super.onReady();
    final _email = Get.find<AuthController>().email.text;
    firestore.findUserByEmail(_email).then((model) {
      role.value = model.role;
      email.text = model.email;
      name.text = model.name ?? '';
      surname.text = model.surname ?? '';
      position.text = model.position ?? '';
      phone.text = model.phone ?? '';
    });
    name.addListener(_updateName);
    surname.addListener(_updateSurname);
    position.addListener(_updatePosition);
    phone.addListener(_updatePhone);
  }

  @mustCallSuper
  @override
  void onClose() {
    //
    super.onClose();
  }

  _updateName() async {
    firestore.updateUserName(email: email.text, name: name.text);
  }

  _updateSurname() async {
    firestore.updateUserSurname(email: email.text, surname: surname.text);
  }

  _updatePosition() async {
    firestore.updateUserPosition(email: email.text, position: position.text);
  }

  _updatePhone() async {
    firestore.updateUserPhone(email: email.text, phone: phone.text);
  }
}
