import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inkubox_app/app/models/user_model.dart';

class Firestore {
  final _firestore = FirebaseFirestore.instance;

  Future<String> getDBVersion() async {
    final _snapshot = await _firestore.collection('settings').doc('main').get();
    final _version = _snapshot.data()!.containsKey('db_version')
        ? _snapshot.data()!['db_version']
        : '';
    return _version;
  }

  Future<void> addCalculation(
      {required String email,
      required Timestamp timestamp,
      required double sumInitial,
      required double sumCalculated}) {
    return _firestore
        .collection('calculations')
        .add({
          'email': email,
          'timestamp': timestamp.toString(),
          'sum_initial': sumInitial.toString(),
          'sum_calculated': sumCalculated.toString(),
        })
        .then((value) => print('Sum added to collection'))
        .catchError((error) => print('Failed to add sum: $error'));
  }

  Future<bool> saveUser(UserModel user) async {
    try {
      await _firestore.collection('users').doc(user.email).set({
        'uid': user.id,
        'role': user.role,
        'email': user.email,
        'sisplayName': user.displayName,
        'position': user.position,
        'phone': user.phone,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<UserModel> findUserByEmail(String email) async {
    var userModel;
    try {
      final snapshot = await _firestore.collection('users').doc(email).get();
      userModel = UserModel.fromDocumentSnapshot(documentSnapshot: snapshot);
      print('User from firestore loaded: ' + userModel.toString());
      return userModel;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<UserModel>> getAllUsers() async {
    var _users = List<UserModel>.empty(growable: true);
    try {
      var _docs = await _firestore.collection('users').get();
      _docs.docs.forEach((element) {
        _users.add(UserModel.fromDocumentSnapshot(documentSnapshot: element));
      });
      return _users;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> updateUserDisplayName(
      {required String email, required String displayName}) {
    return _firestore
        .collection('users')
        .doc(email)
        .update({'displayName': displayName})
        .then((value) =>
            print(' -= User' 's $email name updated to $displayName'))
        .catchError((error) => print('Failed to change user' 's name: $error'));
  }

  Future<void> updateUserPosition(
      {required String email, required String position}) {
    return _firestore
        .collection('users')
        .doc(email)
        .update({'position': position})
        .then((value) =>
            print(' -= User' 's $email position updated to $position'))
        .catchError((error) => print('Failed to change user' 's name: $error'));
  }

  Future<void> updateUserPhone({required String email, required String phone}) {
    return _firestore
        .collection('users')
        .doc(email)
        .update({'phone': phone})
        .then((value) => print(' -= User' 's $email phone updated to $phone'))
        .catchError((error) => print('Failed to change user' 's name: $error'));
  }

  Future<void> setEnabled({required String email, required bool enabled}) {
    return _firestore
        .collection('users')
        .doc(email)
        .update({'enabled': enabled})
        .then(
            (value) => print(' -= User $email status enabled set to $enabled'))
        .catchError(
            (error) => print('Failed to change user' 's status: $error'));
  }

  Future<void> setAvatar({required String email, required String avatarUrl}) {
    return _firestore
        .collection('users')
        .doc(email)
        .update({'avatarUrl': avatarUrl})
        .then((value) => print(' -= User $email avatar set to $avatarUrl'))
        .catchError(
            (error) => print('Failed to change user' 's status: $error'));
  }
}
