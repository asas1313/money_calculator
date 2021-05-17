import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inkubox_app/app/controllers/user_controller.dart';
import 'package:inkubox_app/app/models/user_model.dart';
import 'package:inkubox_app/app/views/widgets/avatar.dart';

class UserCard extends StatelessWidget {
  final UserModel model;
  final controller = UserController();

  UserCard({required this.model}) {
    controller.loadController(model.email);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Obx(() => ListTile(
            onTap: () => _editCard(),
            title: SizedBox(
              width: Get.width / 2,
              child: Text(model.email),
            ),
            subtitle: Text(controller.displayName.text.isEmpty
                ? '<empty>'
                : controller.displayName.text),
            leading: Container(
              width: 50,
              height: 50,
              child: Avatar(
                avatarUrl: controller.avatarUrl.value,
              ),
            ),
            trailing:
                Icon(controller.enabled.value ? Icons.edit : Icons.edit_off))),
      ),
    );
  }

  _editCard() {
    controller.changeEnabled();
    Get.snackbar(
      'Message',
      '${model.email} account' 's access was changed!',
    );
  }
}
