import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inkubox_app/app/controllers/all_userts_controller.dart';
import 'package:inkubox_app/app/views/widgets/authenticated.dart';
import 'package:inkubox_app/app/views/widgets/user_card.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AllUsersView extends GetWidget<AllUsersController> {
  @override
  Widget build(BuildContext context) {
    return Authenticated(
      role: 'admin',
      child: FittedBox(
        fit: BoxFit.contain,
        child: ResponsiveBuilder(
          builder: (context, sizingInformation) {
            var padding = (sizingInformation.isMobile) ? 8.0 : 20.0;
            var width =
                (sizingInformation.isDesktop) ? Get.width / 2 : Get.width;
            return Obx(() => Container(
                  width: width,
                  height: 600,
                  child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) =>
                          Divider(),
                      padding: EdgeInsets.all(padding),
                      itemCount: controller.users.length,
                      itemBuilder: (context, index) {
                        return UserCard(model: controller.users[index]);
                      }),
                ));
          },
        ),
      ),
    );
  }
}
