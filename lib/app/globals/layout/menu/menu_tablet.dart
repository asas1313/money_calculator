import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/controllers/auth_controller.dart';
import '/app/utils/app_routing.dart';
import '/app/globals/layout/menu/login_row.dart';
import '/app/globals/layout/menu/logout_row.dart';
import '/app/globals/styles/styles.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MenuTablet extends GetWidget<AuthController> {
  final bool isNavigationVisible;

  MenuTablet({required this.isNavigationVisible});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Obx(() => Container(
                        padding: EdgeInsets.only(right: 25),
                        child:
                            controller.logedIn.value ? LogoutRow() : LoginRow(),
                      ))
                ]),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Get.toNamed(Routes.HOME),
                  child: Logo(),
                ),
                Spacer(),
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
                                  SizedBox(width: 27),
                                  TextButton(
                                    onPressed: () => Get.toNamed(Routes.HOME),
                                    child: Text(
                                      'Home',
                                      style:
                                          navigationSmallButtonStyle(context),
                                    ),
                                  ),
                                  SizedBox(width: 27),
                                  TextButton(
                                    onPressed: () =>
                                        Get.toNamed(Routes.CALCULATOR),
                                    child: Text(
                                      'Calculator',
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
