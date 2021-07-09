import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_calculator/app/core/values/styles.dart';
import 'package:money_calculator/app/global_widgets/change_language_button.dart';
import 'package:money_calculator/app/global_widgets/logo.dart';
import 'package:money_calculator/app/modules/auth/controllers/auth_controller.dart';
import 'package:money_calculator/app/routes/app_pages.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'login_row.dart';
import 'logout_row.dart';

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Logo(),
            Container(
              padding: EdgeInsets.only(right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ChangeLanguageButton(),
                  Obx(
                    () => controller.isLoggedIn ? LogoutRow() : LoginRow(),
                  ),
                  Obx(() => Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          controller.isLoggedIn
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
                                          SizedBox(width: 27),
                                          TextButton(
                                            onPressed: () =>
                                                Get.toNamed(Routes.HOME),
                                            child: Text(
                                              'menu_home'.tr,
                                              style: navigationSmallButtonStyle(
                                                  context),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : Container(width: 0, height: 0),
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
