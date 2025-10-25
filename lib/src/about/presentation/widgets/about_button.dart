import 'package:flutter/material.dart';
import 'package:mohammad_portfolio/core/constants/app_values.dart';
import 'package:mohammad_portfolio/core/extensions/context_extension.dart';
import 'package:mohammad_portfolio/core/res/app_color/app_color_dark.dart';
import 'package:mohammad_portfolio/core/res/app_color/app_color_light.dart';

class AboutButton extends StatelessWidget {
  const AboutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: AppPadding.s4,
        horizontal: AppPadding.s20,
      ),
      decoration: BoxDecoration(
        color: context.isDark ? AppColorsDark.gray200 : AppColorsLight.gray200,
        borderRadius: BorderRadius.circular(AppBorderRadius.s12),
      ),
      child: Text(
        context.language.about_me,
        style: context.theme.textTheme.labelMedium,
      ),
    );
  }
}
