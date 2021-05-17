import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inkubox_app/app/controllers/app_controller.dart';

class Footer extends GetWidget<AppController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [SelectableText('Ver.${controller.appVersion.value}')],
      ),
    );
  }
}