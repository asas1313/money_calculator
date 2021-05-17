import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inkubox_app/app/controllers/auth_controller.dart';
import 'package:inkubox_app/app/routes/app_routing.dart';
import 'package:inkubox_app/app/views/styles/colors.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LogoutColumn extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Column(children: [
        Obx(() => SizedBox(
              width: Get.width,
              child: Center(
                child: Text(
                  controller.logedIn.value
                      ? controller.displayName.text
                      : 'Not connected!',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            )),
        SizedBox(
          height: 15,
        ),
        Container(
          child: controller.role.text == 'admin'
              ? Column(children: [
                  SizedBox(
                    height: 30,
                    width: 120,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: PRIMARY_COLOR),
                      onPressed: () {
                        Get.toNamed(Routes.ADMIN_DASHBOARD);
                      },
                      child: Text(
                        'Admin pannel',
                        style: TextStyle(
                            fontSize: 16, color: MAIN_BACKGROUND_COLOR),
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
            style: ElevatedButton.styleFrom(primary: PRIMARY_COLOR),
            onPressed: () {
              controller.logout();
            },
            child: Text(
              'Logout',
              style: TextStyle(fontSize: 16, color: MAIN_BACKGROUND_COLOR),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 30,
          width: 120,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: PRIMARY_COLOR),
            onPressed: () => Get.toNamed(Routes.PROFILE),
            child: Text(
              'Edit Profile',
              style: TextStyle(fontSize: 16, color: MAIN_BACKGROUND_COLOR),
            ),
          ),
        ),
      ]),
    );
  }
}
