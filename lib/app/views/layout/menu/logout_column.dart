import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inkubox_app/app/controllers/auth_controller.dart';
import 'package:inkubox_app/app/controllers/user_controller.dart';
import 'package:inkubox_app/app/routes/app_routing.dart';
import 'package:inkubox_app/app/views/styles/styles.dart';
import 'package:inkubox_app/app/views/widgets/change_theme_button.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LogoutColumn extends GetWidget<UserController> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Column(children: [
        Obx(() => SizedBox(
              width: Get.width,
              child: Center(
                child: Text(
                  controller.email.isNotEmpty
                      ? controller.displayName.value
                      : 'Not connected!',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            )),
        SizedBox(
          height: 15,
        ),
        Container(
          child: controller.role.value == 'admin'
              ? Column(children: [
                  SizedBox(
                    height: 30,
                    width: 120,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Get.theme.primaryColor),
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
                    height: 15,
                  ),
                ])
              : Container(width: 0, height: 0),
        ),
        SizedBox(
          height: 30,
          width: 120,
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
        SizedBox(height: 10),
        SizedBox(
          height: 30,
          width: 120,
          child: ElevatedButton(
            onPressed: () => Get.toNamed(Routes.PROFILE),
            child: Text(
              'Edit Profile',
              style: smallButtonStyle(context),
            ),
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 30,
          width: 120,
          child: ChangeThemeButton(),
        ),
      ]),
    );
  }
}
