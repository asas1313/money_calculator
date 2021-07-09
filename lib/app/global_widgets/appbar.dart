import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'change_language_button.dart';
import 'change_theme_button.dart';

class AppBarGlobal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('app_name'.tr),
      centerTitle: true,
      actions: [
        Column(
          children: [
            ChangeThemeButton(),
            ChangeLanguageButton(),
          ],
        ),
      ],
    );
  }
}
