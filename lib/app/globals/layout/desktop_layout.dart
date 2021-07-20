import 'package:flutter/material.dart';

import '../widgets/app_controls/check_version.dart';
import 'menu/menu_tablet.dart';
import 'footer.dart';

class DesktopLayout extends StatelessWidget {
  final Widget child;
  final bool isNavigationVisible;

  const DesktopLayout({
    required this.child,
    this.isNavigationVisible = true,
  });

  @override
  Widget build(BuildContext context) {
    return CheckVersion(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            MenuTablet(isNavigationVisible: isNavigationVisible),
            Expanded(child: child),
            Footer(),
          ],
        ),
      ),
    );
  }
}
