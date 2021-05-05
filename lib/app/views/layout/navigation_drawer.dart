import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inkubox_app/app/routes/app_routing.dart';
import 'package:inkubox_app/app/views/styles/styles.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            color: Color.fromRGBO(0, 0, 0, 0),
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 15),
                TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.HOME);
                  },
                  child: Logo(),
                ),
                SizedBox(width: 15),
                TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.PROFILE);
                  },
                  child: Text(
                    'Profile',
                    style: textStyleMenu,
                  ),
                ),
                SizedBox(width: 27),
                TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.CALCULATOR);
                  },
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
    );
  }
}
