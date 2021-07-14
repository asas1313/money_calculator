import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'desktop_layout.dart';
import 'mobile_layout.dart';

class LayoutTemplate extends StatelessWidget {
  final Widget child;
  final bool isNavigationVisible;

  const LayoutTemplate({required this.child, this.isNavigationVisible = true});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb || Platform.isMacOS || Platform.isLinux || Platform.isWindows) {
      return DesktopLayout(
        child: child,
        isNavigationVisible: isNavigationVisible,
      );
    }

    return MobileLayout(
      child: child,
      isNavigationVisible: isNavigationVisible,
    );
  }
}
