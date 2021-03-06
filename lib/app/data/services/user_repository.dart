import 'package:money_calculator/app/data/model/user_model.dart';
import 'package:money_calculator/app/data/provider/fb_provider.dart';

class UserRepository {
  final _users = fbProvider.collection('users');
  final _email = fbProvider.collection('mail');

  get users => _users;

  Future<bool> saveUser(UserModel user) async {
    try {
      await _users.doc(user.email).set({
        'uid': user.uid,
        'email': user.email,
        'displayName': user.displayName,
      });

      await _email.add({
        'to': 'andrius@modernit.space',
        'message': {
          'subject': 'New user registered in Money Calculator App',
          'html': 'email: ${user.email}',
        },
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
      final snapshot = await _users.doc(email).get();
      userModel = UserModel.fromDocumentSnapshot(documentSnapshot: snapshot);
      print('User from firestore loaded: ' + userModel.toString());
      return userModel;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<UserModel>> getAllUsers() async {
    var _list = List<UserModel>.empty(growable: true);
    try {
      var _docs = await _users.get();
      _docs.docs.forEach((element) {
        _list.add(UserModel.fromDocumentSnapshot(documentSnapshot: element));
      });
      return _list;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> updateUserDisplayName(
      {required String email, required String displayName}) {
    return _users
        .doc(email)
        .update({'displayName': displayName})
        .then((value) =>
            print(' -= User' 's $email name updated to $displayName'))
        .catchError((error) => print('Failed to change user' 's name: $error'));
  }

  Future<void> updateUserPosition(
      {required String email, required String position}) {
    return _users
        .doc(email)
        .update({'position': position})
        .then((value) =>
            print(' -= User' 's $email position updated to $position'))
        .catchError((error) => print('Failed to change user' 's name: $error'));
  }

  Future<void> updateUserPhone({required String email, required String phone}) {
    return _users
        .doc(email)
        .update({'phone': phone})
        .then((value) => print(' -= User' 's $email phone updated to $phone'))
        .catchError((error) => print('Failed to change user' 's name: $error'));
  }

  Future<void> setEnabled({required String email, required bool enabled}) {
    return _users
        .doc(email)
        .update({'enabled': enabled})
        .then(
            (value) => print(' -= User $email status enabled set to $enabled'))
        .catchError(
            (error) => print('Failed to change user' 's status: $error'));
  }

  Future<void> setAvatar({required String email, required String avatarUrl}) {
    return _users
        .doc(email)
        .update({'avatarUrl': avatarUrl})
        .then((value) => print(' -= User $email avatar set to $avatarUrl'))
        .catchError(
            (error) => print('Failed to change user' 's status: $error'));
  }
}
