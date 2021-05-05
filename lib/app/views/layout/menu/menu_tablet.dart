import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inkubox_app/app/controllers/auth_controller.dart';
import 'package:inkubox_app/app/routes/app_routing.dart';
import 'package:inkubox_app/app/views/layout/menu/login_row.dart';
import 'package:inkubox_app/app/views/layout/menu/logout_row.dart';
import 'package:inkubox_app/app/views/styles/styles.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MenuTablet extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Container(
        color: Color.fromRGBO(0, 0, 0, 0),
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
                Column(
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
                            onPressed: () => Get.toNamed(Routes.CALCULATOR),
                            child: Text(
                              'Calculator',
                              style: textStyleMenu,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
