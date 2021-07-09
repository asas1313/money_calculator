import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:money_calculator/app/app_controller.dart';

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
        ],
      ),
    );
  }
}
