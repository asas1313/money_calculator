import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inkubox_app/app/models/user_model.dart';
import 'package:inkubox_app/app/utils/firestore.dart';

class AuthController extends GetxController {
  final _auth = FirebaseAuth.instance;

  final role = TextEditingController();
  final email = TextEditingController();
  final name = TextEditingController();
  final surname = TextEditingController();
  final password = TextEditingController();
  final passwordConfirm = TextEditingController();
  final position = TextEditingController();
  final phone = TextEditingController();

  var signedIn = false;

  @override
  onReady() {
    super.onReady();
    _subscribeToAuthStateChange();
  }

  _subscribeToAuthStateChange() {
    _auth.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        signedIn = false;
      } else {
        print('User is signed in!');
        signedIn = true;
      }
    });
  }

  createAccount(
      {required String emailParam, required String passwordParam}) async {
    try {
      var _userCredential = await _auth.createUserWithEmailAndPassword(
          email: emailParam, password: passwordParam);
      var _userModel = UserModel(
        id: _userCredential.user?.uid,
        role: role.text.isEmpty ? 'user' : role.text,
        email: email.text,
        name: name.text,
        surname: surname.text,
        position: position.text,
        phone: phone.text,
      );
      if (await Firestore().saveUser(_userModel)) {
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

  signIn({required String emailParam, required String passwordParam}) {
    try {
      _auth
          .signInWithEmailAndPassword(
              email: emailParam, password: passwordParam)
          .then((value) {
        var userEmail = value.user;
        print('Successfully signed user with email: $userEmail');
        Firestore().findUserByEmail(emailParam).then((_userModel) {
          role.text = _userModel.role;
          email.text = _userModel.email;
          name.text = _userModel.name ?? '';
          surname.text = _userModel.surname ?? '';
          position.text = _userModel.position ?? '';
          phone.text = _userModel.phone ?? '';
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
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(), backgroundColor: Colors.red);
      print(e);
    }
  }

  signOut() async {
    await _auth.signOut();
    role.text = '';
    email.text = '';
    name.text = '';
    surname.text = '';
    position.text = '';
    phone.text = '';
  }
}
