import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/globals/styles/styles.dart';

class ChangeThemeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: ElevatedButton(
        onPressed: () => _changeTheme(),
        child: Text(
          'change_theme_button'.tr,
          style: smallButtonStyle(context),
        ),
      ),
    );
  }

  _changeTheme() {
    Get.changeTheme(Get.isDarkMode ? themeLight : themeDark);
  }
}
