import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    required this.largeScreen,
    required this.mediumScreen,
    required this.smallScreen,
    Key? key,
  }) : super(key: key);
  final Widget largeScreen;
  final Widget mediumScreen;
  final Widget smallScreen;
  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 800;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 800 &&
        MediaQuery.of(context).size.width < 1200;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 800;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return largeScreen;
          // ignore: invariant_booleans
        } else if (constraints.maxWidth < 1200 && constraints.maxWidth > 800) {
          return mediumScreen;
        } else {
          return smallScreen;
        }
      },
    );
  }
}
