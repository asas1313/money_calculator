import 'package:firebase_auth/firebase_auth.dart';
import 'package:money_calculator/app/data/provider/fb_provider.dart';

class AuthRepository {
  final _auth = fbAuthProvider;

  Future<UserCredential> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    var _userCredential;
    try {
      _userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      print('error code: ${e.code}');
    }
    return _userCredential;
  }

  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    var _userCredentials;
    try {
      _userCredentials = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print('error code: ${e.code}');
    }
    return _userCredentials;
  }
}
