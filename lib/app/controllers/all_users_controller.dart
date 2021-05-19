import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:inkubox_app/app/models/user_model.dart';
import 'package:inkubox_app/app/repositories/user_repository.dart';

class AllUsersController extends GetxController {
  final users = <UserModel>[].obs;

  final firestore = UserRepository();
  final fsInstance = FirebaseFirestore.instance;

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
}
