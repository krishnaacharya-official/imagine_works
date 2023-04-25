import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody;
  final Widget desktopBody;
  final Widget tabletBody;
  const ResponsiveLayout({
    super.key,
    required this.tabletBody,
    required this.mobileBody,
    required this.desktopBody,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 500) {
        return mobileBody;
      }
      if (constraints.maxWidth < 1100) {
        return tabletBody;
      }
      return desktopBody;
    });
  }
}
