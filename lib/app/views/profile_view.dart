import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../controllers/profile_controller.dart';
import '../globals/widgets/app_controls/authenticated.dart';
import '../globals/widgets/avatar.dart';

class ProfileView extends GetWidget<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Authenticated(
      child: SingleChildScrollView(
          child: ResponsiveBuilder(builder: (context, sizingInformation) {
        var width =
            (sizingInformation.isDesktop) ? Get.width / 3 : Get.width - 30;
        return Container(
          width: width,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 15),
                Avatar(
                  avatarUrl: controller.avatarUrl.value,
                  onTap: () => controller.setAvatar(),
                ),
                SizedBox(height: 15),
                TextFormField(
                  initialValue: controller.email,
                  enabled: false,
                  decoration: InputDecoration(
                      labelText: 'profile_email'.tr,
                      hintStyle: TextStyle(fontWeight: FontWeight.w600)),
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: controller.displayName,
                  decoration: InputDecoration(
                      labelText: 'profile_display_name'.tr,
                      hintStyle: TextStyle(fontWeight: FontWeight.w600)),
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: controller.position,
                  decoration: InputDecoration(
                      labelText: 'profile_position'.tr,
                      hintStyle: TextStyle(fontWeight: FontWeight.w600)),
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: controller.phone,
                  decoration: InputDecoration(
                      labelText: 'profile_phone'.tr,
                      hintStyle: TextStyle(fontWeight: FontWeight.w600)),
                ),
                SizedBox(height: 10),
                Text('profile_info_text'.tr),
                SizedBox(height: 35),
                TextFormField(
                  controller: controller.oldPassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'profile_password'.tr,
                  ),
                  autovalidateMode: AutovalidateMode.always,
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: controller.newPassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'profile_new_password'.tr,
                  ),
                  autovalidateMode: AutovalidateMode.always,
                  validator: (value) {
                    if (controller.oldPassword.text.isNotEmpty &&
                        (value ?? '').isEmpty) {
                      return 'profile_new_password_required'.tr;
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: controller.confirmPassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'profile_confirm_password'.tr,
                  ),
                  autovalidateMode: AutovalidateMode.always,
                  validator: (value) {
                    if (value != controller.newPassword.text) {
                      return 'profile_passwords_not_match'.tr;
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () async {
                    var _error = await controller.validatePassword();
                    if (_error == null) {
                      controller.changePassword();
                    } else {
                      Get.snackbar(
                        'Error',
                        _error,
                        backgroundColor: Get.theme.errorColor,
                        duration: Duration(seconds: 5),
                      );
                    }
                  },
                  child: Text('profile_change_password_button'.tr),
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
        );
      })),
    );
  }
}
