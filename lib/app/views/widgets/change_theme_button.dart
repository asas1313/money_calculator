import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inkubox_app/app/views/styles/styles.dart';

class ChangeThemeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 100,
      child: ElevatedButton(
        onPressed: () => _changeTheme(),
        child: Text(
          'Change Theme',
          style: smallButtonStyle(context),
        ),
      ),
    );
  }

  _changeTheme() {
    Get.changeTheme(Get.isDarkMode ? themeLight : themeDark);
  }
}
