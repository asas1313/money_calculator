import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/controllers/app_controller.dart';

class ChangeLanguageButton extends GetWidget<AppController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          InkWell(
              child: Text('LT'),
              onTap: () => controller.updateLocale(Locale('lt', 'LT'))),
          SizedBox(width: 12),
          InkWell(
              child: Text('EN'),
              onTap: () => controller.updateLocale(Locale('en', 'US'))),
          SizedBox(width: 12),
          InkWell(
              child: Text('FR'),
              onTap: () => controller.updateLocale(Locale('fr', 'FR'))),
          SizedBox(width: 12),
        ],
      ),
    );
  }
}
