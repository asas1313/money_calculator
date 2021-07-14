import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_routing.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(0.5, 0.5, 0.5, 0),
        child: TextButton(
          onPressed: () => Get.toNamed(Routes.HOME),
          child: Stack(children: [
            Image.asset('assets/img/logo.png'),
          ]),
        ));
  }
}
