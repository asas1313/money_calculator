import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '/app/globals/widgets/app_controls/authenticated.dart';

class DataFormView extends StatelessWidget {
  final Widget child;

  const DataFormView({required this.child});

  @override
  Widget build(BuildContext context) {
    return Authenticated(
      child: SingleChildScrollView(
        child: ResponsiveBuilder(builder: (context, sizingInformation) {
          var width =
              (sizingInformation.isDesktop) ? Get.width / 3 : Get.width - 30;
          return Container(
            width: width,
            child: child,
          );
        }),
      ),
    );
  }
}
