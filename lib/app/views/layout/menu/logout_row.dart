import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inkubox_app/app/controllers/auth_controller.dart';
import 'package:inkubox_app/app/routes/app_routing.dart';
import 'package:inkubox_app/app/views/styles/colors.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LogoutRow extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Row(children: [
        Obx(() => SizedBox(
              width: Get.width / 10,
              child: Text(
                controller.logedIn.value
                    ? '${controller.name.text} ${controller.surname.text}'
                    : 'Not connected!',
                style: TextStyle(fontSize: 12),
              ),
            )),
        SizedBox(
          width: 5,
          height: 50,
        ),
        Container(
          child: controller.role.text == 'admin'
              ? Row(children: [
                  SizedBox(
                    height: 20,
                    width: 100,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: PRIMARY_COLOR),
                      onPressed: () {
                        Get.toNamed(Routes.ADMIN_DASHBOARD);
                      },
                      child: Text(
                        'Admin pannel',
                        style: TextStyle(
                            fontSize: 12, color: MAIN_BACKGROUND_COLOR),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                    height: 50,
                  ),
                ])
              : Container(width: 0, height: 0),
        ),
        SizedBox(
          height: 20,
          width: 65,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: PRIMARY_COLOR),
            onPressed: () {
              controller.logout();
            },
            child: Text(
              'Logout',
              style: TextStyle(fontSize: 12, color: MAIN_BACKGROUND_COLOR),
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
            style: ElevatedButton.styleFrom(primary: PRIMARY_COLOR),
            onPressed: () => Get.toNamed(Routes.PROFILE),
            child: Text(
              'Edit Profile',
              style: TextStyle(fontSize: 12, color: MAIN_BACKGROUND_COLOR),
            ),
          ),
        ),
      ]),
    );
  }
}
