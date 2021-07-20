import 'package:flutter/widgets.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'desktop_layout.dart';
import 'mobile_layout.dart';

class LayoutTemplate extends StatelessWidget {
  final Widget child;
  final bool isNavigationVisible;

  const LayoutTemplate({required this.child, this.isNavigationVisible = true});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) =>
          sizingInformation.screenSize.width > 800
              ? DesktopLayout(
                  child: child,
                  isNavigationVisible: isNavigationVisible,
                )
              : MobileLayout(
                  child: child,
                  isNavigationVisible: isNavigationVisible,
                ),
    );
  }
}
