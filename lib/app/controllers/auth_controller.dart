import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/controllers/user_controller.dart';
import '/app/models/user_model.dart';
import '/app/utils/app_routing.dart';
import '/app/repositories/user_repository.dart';

class AuthController extends GetxController {
  final _auth = FirebaseAuth.instance;

  final email = TextEditingController(text: 'andrius@modernit.space');
  final password = TextEditingController(text: 'asasas');
  final passwordConfirm = TextEditingController();

  var logedIn = false.obs;

  @override
  onReady() {
    super.onReady();
    _subscribeToAuthStateChange();
  }

  _subscribeToAuthStateChange() {
    _auth.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently loged out!');
        logedIn.value = false;
        Get.find<UserController>().clearController();
      } else {
        print('User ${user.email} is loged in!');
        logedIn.value = true;
        Get.find<UserController>().loadController(user.email ?? '');
      }
    });
  }

  String? validate() {
    if (email.text.isEmpty) {
      return 'auth_validate_email_mandatory'.tr;
    }
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email.text)) {
      return 'auth_validate_email_invalid'.tr;
    }
    if (password.text.isEmpty) {
      return 'auth_validate_password_mandatory'.tr;
    }
    if (password.value != passwordConfirm.value) {
      return ''.tr;
    }
    return null;
  }

  createAccount() async {
    try {
      var _userCredential = await _auth.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
      var _userModel = UserModel(
        id: _userCredential.user?.uid,
        role: 'user',
        email: email.text,
      );
      if (await UserRepository().saveUser(_userModel)) {
        login();
        Get.back();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar('error_title'.tr, 'auth_error_weak_password'.tr,
            backgroundColor: Get.theme.errorColor);
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('error_title'.tr, ''.tr,
            backgroundColor: Get.theme.errorColor);
      }
    } catch (e) {
      print(e);
    }
  }

  login({bool goToHome = false}) {
    if (email.text.isEmpty || password.text.isEmpty) {
      Get.snackbar('message_title'.tr, 'auth_message_enter_credentials'.tr);
      return;
    }

    try {
      _auth
          .signInWithEmailAndPassword(
              email: email.text, password: password.text)
          .then((value) {
        final _controller = Get.find<UserController>();
        _controller.loadController(email.text);
        logedIn.value = true;
        if (goToHome) {
          Get.toNamed(Routes.HOME);
        }
      });
    } catch (e) {
      Get.snackbar('Error', e.toString(),
          backgroundColor: Get.theme.errorColor);
      print(e);
    }
  }

  logout() async {
    await _auth.signOut();
    Get.find<UserController>().clearController();
    logedIn.value = false;
    email.text = 'andrius@modernit.space';
    password.text = 'asasas';
    // TODO Remove login information
    Get.offAllNamed(Routes.HOME);
  }

  Future<String?> validatePassword(String password) async {
    var _user = _auth.currentUser;
    if (_user != null) {
      var _authCredentials =
          EmailAuthProvider.credential(email: _user.email!, password: password);
      try {
        _user.reauthenticateWithCredential(_authCredentials).then((value) {
          return value.user == null ? null : 'auth_error_not_loggedin'.tr;
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-mismatch') {
          return 'auth_error_user-mismatch'.tr;
        } else if (e.code == 'user-not-found') {
          return 'auth_error_user-not-found'.tr;
        } else if (e.code == 'invalid-credential') {
          return 'auth_error_invalid-credential'.tr;
        } else if (e.code == 'invalid-email') {
          return 'auth_error_invalid-email'.tr;
        } else if (e.code == 'wrong-password') {
          return 'auth_error_wrong-password'.tr;
        } else {
          print(e.toString());
          return 'aut_error_authentication_error'.tr;
        }
      } catch (e) {
        print(e.toString());
        return 'auth_error_password_check_error'.tr;
      }
    } else {
      Get.snackbar('error_title'.tr, 'auth_error_not_loggedin'.tr);
      return 'auth_error_not_loggedin'.tr;
    }
  }

  changePassword({required String password, required String passwordConfirm}) {
    var _user = _auth.currentUser;

    if (password.isEmpty) {
      return 'auth_validate_password_mandatory'.tr;
    }
    if (password != passwordConfirm) {
      return 'auth_validate_passwords_unmatch'.tr;
    }

    if (_user != null) {
      _user
          .updatePassword(password)
          .then((value) => print('auth_message_password_changed'.tr))
          .catchError((error) {
        print('Password could not be changed: \n${error.toString()}');
      });
    } else {
      Get.snackbar('error_title'.tr, 'auth_error_not_loggedin'.tr);
    }
  }

  void resetPassword() {
    Get.defaultDialog(
        title: 'Alert',
        content: Text(''.tr),
        onCancel: () => Get.back(),
        onConfirm: () {
          _auth.sendPasswordResetEmail(email: email.text);
          Get.back();
        });
  }
}
