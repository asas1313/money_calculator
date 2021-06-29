import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_calculator/app/data/model/user_model.dart';
import 'package:money_calculator/app/data/provider/fb_provider.dart';
import 'package:money_calculator/app/data/services/user_repository.dart';
import 'package:money_calculator/app/routes/app_pages.dart';

class AuthController extends GetxController {
  var fbAuthProviderStateChangeStream;

  final isLogedIn = false.obs;

  String get screenName {
    if (fbAuthProvider.currentUser != null) {
      return fbAuthProvider.currentUser!.displayName ?? '';
    } else {
      return '';
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    _subscribeToAuthStateChange();
  }

  _subscribeToAuthStateChange() {
    fbAuthProviderStateChangeStream =
        fbAuthProvider.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently loged out!');
        isLogedIn.value = false;
      } else {
        print('User ${user.email} is loged in!');
        isLogedIn.value = true;
      }
    });
  }

  @override
  void onClose() {
    fbAuthProviderStateChangeStream();
  }

  createAccount(String email, String password, String displayName) async {
    try {
      var _userCredential = await fbAuthProvider.createUserWithEmailAndPassword(
          email: email, password: password);
      var _userModel = UserModel(
          uid: _userCredential.user!.uid,
          email: email,
          displayName: displayName);
      if (await UserRepository().saveUser(_userModel)) {
        login(email, password);
        Get.back();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('Provided password is too weak');
        Get.snackbar('Error', 'The password provided is too weak!',
            backgroundColor: Get.theme.errorColor);
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Get.snackbar('Error', 'The account already exists for that email.',
            backgroundColor: Get.theme.errorColor);
      }
    } catch (e) {
      print(e);
    }
  }

  login(String email, String password, {bool goToHome = false}) {
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Message', 'Enter email and password.');
      return;
    }

    try {
      fbAuthProvider
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        isLogedIn.value = true;
        if (goToHome) {
          print('if true');
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
    await fbAuthProvider.signOut();
    Get.offAllNamed(Routes.HOME);
  }

  Future<String?> validatePassword(String password) async {
    var _user = fbAuthProvider.currentUser;
    if (_user != null) {
      var fbAuthProviderCredentials =
          EmailAuthProvider.credential(email: _user.email!, password: password);
      try {
        _user
            .reauthenticateWithCredential(fbAuthProviderCredentials)
            .then((value) {
          return value.user == null ? null : 'You are not loggedin!';
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-mismatch') {
          return 'The credential given does not correspond to the user.';
        } else if (e.code == 'user-not-found') {
          return 'The credential given does not correspond to the user.';
        } else if (e.code == 'invalid-credential') {
          return 'The provider' 's credential is not valid.';
        } else if (e.code == 'invalid-email') {
          return 'The provider' 's email is not valid.';
        } else if (e.code == 'wrong-password') {
          return 'The provided password is not valid.';
        } else {
          print(e.toString());
          return 'Authentication error!';
        }
      } catch (e) {
        print(e.toString());
        return 'Password check error!';
      }
    } else {
      Get.snackbar('Error', 'You are not logged in!');
      return 'You are not logged in!';
    }
  }

  changePassword({required String password, required String passwordConfirm}) {
    var _user = fbAuthProvider.currentUser;

    if (password.isEmpty) {
      return 'Password must be provided.';
    }
    if (password != passwordConfirm) {
      return 'Passwords do not match.';
    }

    if (_user != null) {
      _user
          .updatePassword(password)
          .then((value) => print('Password successfully changed.'))
          .catchError((error) {
        print('Password could not be changed: \n${error.toString()}');
      });
    } else {
      Get.snackbar('Error', 'You are not logged in!');
    }
  }

  void resetPassword(String email) {
    Get.defaultDialog(
        title: 'Alert',
        content: Text('Do You really want to reset your password?'),
        onCancel: () => Get.back(),
        onConfirm: () {
          fbAuthProvider.sendPasswordResetEmail(email: email);
          Get.back();
        });
  }
}
