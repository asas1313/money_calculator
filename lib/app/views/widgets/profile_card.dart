import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inkubox_app/app/controllers/profile_controller.dart';
import 'package:inkubox_app/app/models/user_model.dart';
import 'package:inkubox_app/app/views/widgets/avatar.dart';

class ProfileCard extends StatelessWidget {
  final UserModel model;
  late final controller;

  ProfileCard({required this.model});

  @override
  Widget build(BuildContext context) {
    controller = ProfileController(email: model.email);
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
