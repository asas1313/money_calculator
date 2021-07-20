import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inkubox_app/app/globals/widgets/app_controls/change_language_button.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '/app/controllers/auth_controller.dart';
import '/app/utils/app_routing.dart';
import '/app/globals/layout/menu/login_row.dart';
import '/app/globals/layout/menu/logout_row.dart';
import '/app/globals/styles/styles.dart';

class MenuTablet extends GetWidget<AuthController> {
  final bool isNavigationVisible;

  MenuTablet({required this.isNavigationVisible});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () => Get.toNamed(Routes.HOME),
              child: Logo(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: ChangeLanguageButton(),
                ),
                Obx(() => Container(
                      padding: EdgeInsets.only(right: 25),
                      child:
                          controller.logedIn.value ? LogoutRow() : LoginRow(),
                    )),
                Obx(
                  () => controller.logedIn.value
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              width: Get.width / 2,
                              padding: EdgeInsets.only(right: 25),
                              child: Wrap(
                                alignment: WrapAlignment.end,
                                direction: Axis.horizontal,
                                children: [
                                  SizedBox(width: 25),
                                  TextButton(
                                    onPressed: () => Get.toNamed(Routes.HOME),
                                    child: Text(
                                      'menu_home'.tr,
                                      style:
                                          navigationSmallButtonStyle(context),
                                    ),
                                  ),
                                  SizedBox(width: 25),
                                  TextButton(
                                    onPressed: () =>
                                        Get.toNamed(Routes.CALCULATOR),
                                    child: Text(
                                      'menu_calculator'.tr,
                                      style:
                                          navigationSmallButtonStyle(context),
                                    ),
                                  ),
                                  SizedBox(width: 25),
                                  TextButton(
                                    onPressed: () =>
                                        Get.toNamed(Routes.CUSTOMER),
                                    child: Text(
                                      'menu_customers'.tr,
                                      style:
                                          navigationSmallButtonStyle(context),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      : Container(width: 0, height: 0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
