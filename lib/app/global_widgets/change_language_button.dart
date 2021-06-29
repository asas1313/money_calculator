import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ChangeLanguageButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          InkWell(
            child: Text('LT'),
            onTap: () => Get.updateLocale(Locale('lt_LT')),
          ),
          SizedBox(width: 12),
          InkWell(
            child: Text('EN'),
            onTap: () => Get.updateLocale(Locale('en_US')),
          ),
          SizedBox(width: 12),
        ],
      ),
    );
  }
}
