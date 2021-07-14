import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';
import '../../utils/app_routing.dart';
import '../../globals/styles/styles.dart';

import 'menu/login_column.dart';
import 'menu/logout_column.dart';

class NavigationDrawer extends GetWidget<AuthController> {
  final bool isNavigationVisible;

  NavigationDrawer({required this.isNavigationVisible});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Obx(
            () => controller.logedIn.value
                ? Container(
                    color: Color.fromRGBO(0, 0, 0, 0.0),
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 15),
                        TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.HOME);
                            },
                            child: Text(
                              'Home',
                              style: navigationButtonStyle(context),
                            )),
                        SizedBox(height: 35),
                        TextButton(
                          onPressed: () {
                            Get.toNamed(Routes.CALCULATOR);
                          },
                          child: Text(
                            'Calculator',
                            style: navigationButtonStyle(context),
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(width: 0, height: 0),
          ),
          Spacer(),
          Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Obx(() => Container(
                      padding: EdgeInsets.all(25),
                      child: controller.logedIn.value
                          ? LogoutColumn()
                          : LoginColumn(),
                    ))
              ]),
        ],
      ),
    );
  }
}
