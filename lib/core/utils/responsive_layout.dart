import 'package:flutter/material.dart';
import 'package:mohammad_portfolio/core/constants/breakpoints.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    required this.mobile,
    required this.tablet,
    required this.desktop,
    super.key,
  });

  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    if (w >= Breakpoints.desktop) return desktop;
    if (w >= Breakpoints.tablet) return tablet;
    return mobile;
  }
}
