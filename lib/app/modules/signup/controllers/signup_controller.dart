import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_calculator/app/data/model/user_model.dart';
import 'package:money_calculator/app/data/services/auth_repository.dart';
import 'package:money_calculator/app/data/services/user_repository.dart';
import 'package:money_calculator/app/modules/auth/controllers/auth_controller.dart';

class SignupController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final displayNameController = TextEditingController();

  final _authRepository = AuthRepository();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  String? validate() {
    if (emailController.text.isEmpty) {
      return 'E-mail must be provided.';
    }
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.text)) {
      return 'Not valid e-mail.';
    }
    if (passwordController.text.isEmpty) {
      return 'Password must be provided.';
    }
    if (passwordController.text != confirmPasswordController.text) {
      return 'Passwords do not match.';
    }
    if (displayNameController.text.isEmpty) {
      return 'Display Name must be provided.';
    }
    return null;
  }

  createAccount() async {
    var _userCredential = await _authRepository.createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
    var _userModel = UserModel(
      uid: _userCredential.user!.uid,
      email: emailController.text,
      displayName: displayNameController.text,
    );
    if (await UserRepository().saveUser(_userModel)) {
      Get.find<AuthController>().loginWithEmailAndPassword(
        emailController.text,
        passwordController.text,
      );
      Get.back();
    }
  }
}
