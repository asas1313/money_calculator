import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inkubox_app/app/controllers/profile_controller.dart';
import 'package:inkubox_app/app/views/widgets/authenticated.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ProfileView extends GetWidget<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Authenticated(
      child: FittedBox(
          fit: BoxFit.contain,
          child: ResponsiveBuilder(builder: (context, sizingInformation) {
            var width =
                (sizingInformation.isDesktop) ? Get.width / 3 : Get.width;
            return Container(
              width: width,
              height: 600,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 15),
                    TextFormField(
                      controller: controller.email,
                      enabled: false,
                      decoration: InputDecoration(
                          labelText: 'Email',
                          hintStyle: TextStyle(fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      controller: controller.name,
                      decoration: InputDecoration(
                          labelText: 'Name',
                          hintStyle: TextStyle(fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      controller: controller.surname,
                      decoration: InputDecoration(
                          labelText: 'Surname',
                          hintStyle: TextStyle(fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      controller: controller.position,
                      decoration: InputDecoration(
                          labelText: 'Position',
                          hintStyle: TextStyle(fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      controller: controller.phone,
                      decoration: InputDecoration(
                          labelText: 'Phone',
                          hintStyle: TextStyle(fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ),
            );
          })),
    );
  }
}
