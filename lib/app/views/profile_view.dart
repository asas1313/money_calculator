import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inkubox_app/app/globals/widgets/form_controlls/data_form.dart';
import 'package:inkubox_app/app/globals/widgets/form_controlls/text_field.dart';

import '../controllers/profile_controller.dart';
import '../globals/widgets/avatar.dart';

class ProfileView extends GetWidget<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return DataFormView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 15),
          Avatar(
            avatarUrl: controller.avatarUrl.value,
            onTap: () => controller.setAvatar(),
          ),
          SizedBox(height: 15),
          SimpleTextField(
            initialValue: controller.email,
            enabled: false,
            labelText: 'profile_email'.tr,
          ),
          SizedBox(height: 15),
          SimpleTextField(
            controller: controller.displayName,
            labelText: 'profile_display_name',
          ),
          SizedBox(height: 15),
          SimpleTextField(
            controller: controller.position,
            labelText: 'profile_position',
          ),
          SizedBox(height: 15),
          SimpleTextField(
            controller: controller.phone,
            labelText: 'profile_phone',
          ),
          SizedBox(height: 10),
          Text('profile_info_text'.tr),
          SizedBox(height: 35),
          SimpleTextField(
            controller: controller.oldPassword,
            obscureText: true,
            labelText: 'profile_password',
            autovalidateMode: AutovalidateMode.always,
          ),
          SizedBox(height: 15),
          SimpleTextField(
            controller: controller.newPassword,
            obscureText: true,
            labelText: 'profile_new_password',
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
          SimpleTextField(
            controller: controller.confirmPassword,
            obscureText: true,
            labelText: 'profile_confirm_password',
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
                  'error_title'.tr,
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
    );
  }
}
