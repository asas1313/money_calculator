import 'package:flutter/material.dart';
import 'package:inkubox_app/app/views/layout/menu.dart';
import 'package:inkubox_app/app/views/widgets/check_version.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'content_desktop.dart';
import 'content_mobile.dart';
import 'navigation_drawer.dart';

class LayoutTemplate extends StatelessWidget {
  final Widget child;

  const LayoutTemplate({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CheckVersion(
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) => Scaffold(
          drawer: sizingInformation.isMobile ? NavigationDrawer() : null,
          backgroundColor: Colors.white,
          body: Column(
            children: <Widget>[
              Menu(),
              Expanded(
                child: ScreenTypeLayout(
                  mobile: ContentMobile(
                    child: child,
                  ),
                  desktop: ContentDesktop(
                    child: child,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}