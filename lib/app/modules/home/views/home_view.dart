import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'home_view_middle_text'.tr,
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
