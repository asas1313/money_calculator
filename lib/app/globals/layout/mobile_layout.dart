import 'package:flutter/material.dart';
import '../widgets/app_controls/check_version.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'menu/menu_mobile.dart';
import 'footer.dart';
import 'navigation_drawer.dart';

class MobileLayout extends StatelessWidget {
  final Widget child;
  final bool isNavigationVisible;

  const MobileLayout({
    required this.child,
    this.isNavigationVisible = true,
  });

  @override
  Widget build(BuildContext context) {
    return CheckVersion(
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) => Scaffold(
          drawer: NavigationDrawer(isNavigationVisible: isNavigationVisible),
          body: Column(
            children: <Widget>[
              MenuMobile(),
              Expanded(child: child),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
