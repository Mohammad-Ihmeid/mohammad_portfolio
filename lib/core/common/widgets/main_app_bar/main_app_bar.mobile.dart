import 'package:flutter/material.dart';
import 'package:mohammad_portfolio/core/extensions/context_extension.dart';
import 'package:mohammad_portfolio/core/res/app_color/app_color_dark.dart';
import 'package:mohammad_portfolio/core/res/app_color/app_color_light.dart';
import 'package:mohammad_portfolio/core/res/app_icon/app_icon_dark.dart';
import 'package:mohammad_portfolio/core/res/app_icon/app_icon_light.dart';

class MainAppBarMobile extends StatelessWidget {
  const MainAppBarMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor:
          context.isDark ? AppColorsDark.grayDefault : Colors.white,
      automaticallyImplyLeading: false,
      flexibleSpace: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.08),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '<FL />',
              style: TextStyle(
                color:
                    context.isDark
                        ? AppColorsDark.gray900
                        : AppColorsLight.gray900,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            GestureDetector(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: Image.asset(
                context.isDark
                    ? AppIconDark.menuIcon24
                    : AppIconLight.menuIcon24,
                width: context.width * 0.08,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
