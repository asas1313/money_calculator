import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:inkubox_app/app/controllers/user_controller.dart';

class StorageRepository {
  final _storage = FirebaseStorage.instance;

  final _user = Get.find<UserController>();

  Future<String?> uploadAvatarImage(File file) async {
    var _downloadUrl;
    final storageRef =
        _storage.ref().child('users').child('profile').child(_user.email.value);
    final uploadTask = storageRef.putFile(file);
    uploadTask.then((value) {
      _downloadUrl = value.ref.getDownloadURL();
      return _downloadUrl;
    });
  }
}
