import 'package:flutter/material.dart';
import 'package:mohammad_portfolio/core/common/widgets/main_app_bar/main_app_bar.desktop.dart';
import 'package:mohammad_portfolio/core/common/widgets/main_app_bar/main_app_bar.mobile.dart';
import 'package:mohammad_portfolio/core/utils/responsive_layout.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({
    required this.aboutTap,
    required this.workTap,
    required this.testimonialsTap,
    required this.contactTap,
    super.key,
  });

  final VoidCallback aboutTap;
  final VoidCallback workTap;
  final VoidCallback testimonialsTap;
  final VoidCallback contactTap;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: const MainAppBarMobile(),
      tablet: MainAppBarDesktop(
        aboutTap: aboutTap,
        workTap: workTap,
        testimonialsTap: testimonialsTap,
        contactTap: contactTap,
      ),
      desktop: MainAppBarDesktop(
        aboutTap: aboutTap,
        workTap: workTap,
        testimonialsTap: testimonialsTap,
        contactTap: contactTap,
      ),
    );
  }
}
