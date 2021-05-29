import 'package:get/get.dart';
import 'package:inkubox_app/app/models/user_model.dart';
import 'package:inkubox_app/app/repositories/user_repository.dart';

typedef IntCallback = Function(int index);

class AllUsersController extends GetxController {
  final users = <UserModel>[].obs;

  final firestore = UserRepository();

  @override
  void onReady() {
    super.onReady();
    firestore.getAllUsers().then((_users) {
      users.value = _users;
      print('-= users loaded: ${_users.length}. =-');
    });
  }

  @override
  void onClose() {
    //
    super.onClose();
  }

  changeUserMode(int index) {
    firestore.setEnabled(
        email: users[index].email, enabled: !users[index].enabled);
    var _user = users[index];
    _user.enabled = !users[index].enabled;
    users[index] = _user;
  }
}
