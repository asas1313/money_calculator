import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inkubox_app/app/controllers/auth_controller.dart';
import 'package:inkubox_app/app/controllers/user_controller.dart';
import 'package:inkubox_app/app/routes/app_routing.dart';
import 'package:inkubox_app/app/views/styles/styles.dart';
import 'package:inkubox_app/app/views/widgets/change_theme_button.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LogoutRow extends GetWidget<UserController> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Row(children: [
        Obx(() => SizedBox(
              width: Get.width / 10,
              child: Text(
                controller.email.isNotEmpty
                    ? controller.displayName.value
                    : 'Not connected!',
                style: TextStyle(fontSize: 12),
              ),
            )),
        SizedBox(
          width: 5,
          height: 50,
        ),
        Obx(() => Container(
              child: controller.role.value == 'admin'
                  ? Row(children: [
                      SizedBox(
                        height: 20,
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.toNamed(Routes.ADMIN_DASHBOARD);
                          },
                          child: Text(
                            'Admin pannel',
                            style: smallButtonStyle(context),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                        height: 50,
                      ),
                    ])
                  : Container(width: 0, height: 0),
            )),
        SizedBox(
          height: 20,
          width: 65,
          child: ElevatedButton(
            onPressed: () {
              Get.find<AuthController>().logout();
            },
            child: Text(
              'Logout',
              style: smallButtonStyle(context),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        SizedBox(
          height: 20,
          width: 95,
          child: ElevatedButton(
            onPressed: () => Get.toNamed(Routes.PROFILE),
            child: Text(
              'Edit Profile',
              style: smallButtonStyle(context),
            ),
          ),
        ),
        SizedBox(width: 5),
        ChangeThemeButton(),
        SizedBox(width: 5),
      ]),
    );
  }
}
