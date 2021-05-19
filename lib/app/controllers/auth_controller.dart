import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inkubox_app/app/controllers/user_controller.dart';
import 'package:inkubox_app/app/models/user_model.dart';
import 'package:inkubox_app/app/routes/app_routing.dart';
import 'package:inkubox_app/app/repositories/user_repository.dart';

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
      return 'E-mail must be provided.';
    }
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email.text)) {
      return 'Not valid e-mail.';
    }
    if (password.text.isEmpty) {
      return 'Password must be provided.';
    }
    if (password.value != passwordConfirm.value) {
      return 'Passwords do not match.';
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
        print('Provided password is too weak');
        Get.snackbar('Error', 'The password provided is too weak!',
            backgroundColor: Colors.red);
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Get.snackbar('Error', 'The account already exists for that email.',
            backgroundColor: Colors.red);
      }
    } catch (e) {
      print(e);
    }
  }

  login({bool goToHome = false}) {
    if (email.text.isEmpty || password.text.isEmpty) {
      Get.snackbar('Message', 'Enter email and password.');
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
          print('if true');
          Get.toNamed(Routes.HOME);
        }
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        print('Provided email address is not valid.');
        Get.snackbar('Error', 'Provided email address is not valid.',
            backgroundColor: Colors.red);
      } else if (e.code == 'wrong-password') {
        print('Provided password is invalid for the given email.');
        Get.snackbar(
            'Error', 'Provided password is invalid for the given email.',
            backgroundColor: Colors.red);
      } else if (e.code == 'user-not-found') {
        print(
            'There is no user record corresponding to this identifier. The user may have been deleted.');
        Get.snackbar('Error',
            'There is no user record corresponding to this identifier. The user may have been deleted.',
            backgroundColor: Colors.red);
      } else if (e.code == 'invalid-email') {
        print('The email address is badly formatted.');
        Get.snackbar('Message', 'The email address is badly formatted.');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(), backgroundColor: Colors.red);
      print(e);
    }
  }

  logout() async {
    await _auth.signOut();
    Get.find<UserController>().clearController();
    logedIn.value = false;
    email.text = 'andrius@modernit.space';
    password.text = 'asasas';
  }
}
