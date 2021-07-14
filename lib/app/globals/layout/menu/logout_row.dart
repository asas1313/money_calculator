import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/controllers/auth_controller.dart';
import '/app/controllers/user_controller.dart';
import '/app/utils/app_routing.dart';
import '/app/globals/styles/styles.dart';
import '/app/globals/widgets/app_controls/change_theme_button.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LogoutRow extends GetWidget<UserController> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Container(
        width: sizingInformation.screenSize.width - 250,
        child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.end,
            spacing: 5.0,
            runSpacing: 5.0,
            children: [
              Obx(() => Text(
                    controller.email.isNotEmpty
                        ? controller.displayName.value
                        : 'logout_not_connected'.tr,
                    style: TextStyle(fontSize: 12),
                  )),
              Obx(() => Container(
                    child: controller.role.value == 'admin'
                        ? SizedBox(
                            height: 20,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.toNamed(Routes.ADMIN_DASHBOARD);
                              },
                              child: Text(
                                'admin_pannel_button'.tr,
                                style: smallButtonStyle(context),
                              ),
                            ),
                          )
                        : Container(width: 0, height: 0),
                  )),
              SizedBox(
                height: 20,
                child: ElevatedButton(
                  onPressed: () {
                    Get.find<AuthController>().logout();
                  },
                  child: Text(
                    'logout_button'.tr,
                    style: smallButtonStyle(context),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
                child: ElevatedButton(
                  onPressed: () => Get.toNamed(Routes.PROFILE),
                  child: Text(
                    'edit_profile_button'.tr,
                    style: smallButtonStyle(context),
                  ),
                ),
              ),
              ChangeThemeButton(),
            ]),
      ),
    );
  }
}
