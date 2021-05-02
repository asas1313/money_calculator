import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final _auth = FirebaseAuth.instance;
  final isConnected = false.obs;

  @override
  onReady() {
    super.onReady();
    _subscribeToAuthStateChange();
  }

  String? get email => _auth.currentUser?.email;

  _subscribeToAuthStateChange() {
    _auth.authStateChanges().listen((User? user) {
      if (user == null) {
        isConnected.value = false;
        print('User is currently signed out!');
      } else {
        isConnected.value = true;
        print('User is signed in!');
      }
    });
  }

  createAccount({required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
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

  signIn({required String email, required String password}) {
    try {
      _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        var userEmail = value.user;
        print('Successfully signed user with email: $userEmail');
        isConnected.value = true;
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
  }
}
