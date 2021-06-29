import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'menu_mobile.dart';
import 'menu_tablet.dart';

class Menu extends StatelessWidget {
  final bool isNavigationVisible;

  const Menu({required this.isNavigationVisible});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: MenuMobile(isNavigationVisible: isNavigationVisible),
      tablet: MenuTablet(isNavigationVisible: isNavigationVisible),
    );
  }
}
