import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inkubox_app/app/routes/app_routes.dart';
import 'package:inkubox_app/app/routes/routing_controller.dart';
import 'package:inkubox_app/app/views/styles/styles.dart';

class MenuMobile extends GetWidget<RoutingController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            padding: const EdgeInsets.all(32),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                    TextButton(
                      onPressed: () => Get.toNamed(Routes.HOME),
                      child: Logo(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
