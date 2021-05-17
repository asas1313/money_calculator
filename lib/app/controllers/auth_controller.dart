import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inkubox_app/app/models/user_model.dart';
import 'package:inkubox_app/app/routes/app_routing.dart';
import 'package:inkubox_app/app/utils/firestore.dart';

class AuthController extends GetxController {
  final _auth = FirebaseAuth.instance;

  final role = TextEditingController();
  final email = TextEditingController(text: '');
  final displayName = TextEditingController(text: '');
  final password = TextEditingController(text: '');
  final passwordConfirm = TextEditingController();
  final position = TextEditingController();
  final phone = TextEditingController();

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
      } else {
        print('User ${user.email} is loged in!');
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
        role: role.text.isEmpty ? 'user' : role.text,
        email: email.text,
        displayName: displayName.text,
        position: position.text,
        phone: phone.text,
      );
      if (await Firestore().saveUser(_userModel)) {
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
        Firestore().findUserByEmail(email.text).then((_userModel) {
          role.text = _userModel.role;
          email.text = _userModel.email;
          displayName.text = _userModel.displayName ?? '';
          position.text = _userModel.position ?? '';
          phone.text = _userModel.phone ?? '';
          logedIn.value = true;
          print('gotohome: $goToHome');
          if (goToHome) {
            print('if true');
            Get.toNamed(Routes.HOME);
          }
        });
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
    role.text = '';
    email.text = '';
    displayName.text = '';
    password.text = '';
    passwordConfirm.text = '';
    position.text = '';
    phone.text = '';
    logedIn.value = false;
  }
}
