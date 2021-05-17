import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:inkubox_app/app/models/user_model.dart';
import 'package:inkubox_app/app/repositories/user_repository.dart';
import 'package:inkubox_app/app/views/widgets/user_card.dart';

class AllUsersController extends GetxController {
  final users = <UserModel>[].obs;
  var activeUserCard = -1;

  final firestore = Firestore();
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

  UserCard getUserCard(int index) {
    activeUserCard = index;
    return UserCard(model: users[index]);
  }
}
