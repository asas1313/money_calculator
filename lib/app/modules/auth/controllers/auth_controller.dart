import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_calculator/app/data/model/user_model.dart';
import 'package:money_calculator/app/data/provider/fb_provider.dart';
import 'package:money_calculator/app/data/services/auth_repository.dart';
import 'package:money_calculator/app/data/services/user_repository.dart';
import 'package:money_calculator/app/routes/app_pages.dart';

class AuthController extends GetxController {
  bool get isLoggedIn => user.value != null;
  final user = Rx<UserModel?>(null);
  final _authRepository = AuthRepository();
  final _userRepository = UserRepository();

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
    fbAuthProvider.authStateChanges().listen(
          (User? _user) => _onData(_user),
          cancelOnError: true,
        );
  }

  @override
  void onClose() {}

  loginWithEmailAndPassword(String email, String password,
      {bool goToHome = false}) async {
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Message', 'Enter email and password.');
      return;
    }

    _authRepository
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      if (goToHome) {
        Get.toNamed(Routes.HOME);
      }
      user.value = await _userRepository.findUserByEmail(value.user!.email!);
    });
  }

  logout() async {
    await fbAuthProvider.signOut();
    user.value = null;
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
        print('FirebaseAuthException code is - ${e.code}');
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

  _onData(User? _user) async {
    if (_user != null) {
      user.value = await _userRepository.findUserByEmail(_user.email!);
    }
  }
}
