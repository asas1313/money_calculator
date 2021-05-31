import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inkubox_app/app/controllers/all_users_controller.dart';
import 'package:inkubox_app/app/views/widgets/avatar.dart';

class ProfileCard extends GetWidget<AllUsersController> {
  final int index;

  ProfileCard({required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
          child: ListTile(
              onTap: () => controller.changeUserMode(index),
              title: SizedBox(
                width: Get.width / 2,
                child: Text(controller.users[index].email),
              ),
              subtitle: Text((controller.users[index].displayName == null ||
                      controller.users[index].displayName!.isEmpty
                  ? '<empty>'
                  : controller.users[index].displayName)!),
              leading: Container(
                width: 50,
                height: 50,
                child: Avatar(
                  avatarUrl: controller.users[index].avatarUrl,
                ),
              ),
              trailing: Obx(() => Icon(
                    controller.users[index].enabled
                        ? Icons.edit
                        : Icons.edit_off,
                  )))),
    );
  }
}
