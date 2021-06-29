import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_calculator/app/global_widgets/logo.dart';
import 'package:money_calculator/app/routes/app_pages.dart';

class MenuMobile extends StatelessWidget {
  final bool isNavigationVisible;

  const MenuMobile({required this.isNavigationVisible});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(32),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.menu,
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
