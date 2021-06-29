import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:money_calculator/generated/locales.g.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        LocaleKeys.home_view_middle_text.tr,
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
