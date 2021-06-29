import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_calculator/app/core/values/app_translation.dart';

import 'change_language_button.dart';
import 'change_theme_button.dart';

class AppBarGlobal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(LocaleKeys.app_name.tr),
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
