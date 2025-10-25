import 'package:flutter/material.dart';
import 'package:mohammad_portfolio/core/constants/app_values.dart';
import 'package:mohammad_portfolio/core/extensions/context_extension.dart';
import 'package:mohammad_portfolio/core/res/app_color/app_color_dark.dart';
import 'package:mohammad_portfolio/core/res/app_color/app_color_light.dart';

class SectionButton extends StatelessWidget {
  const SectionButton({required this.title, super.key});

  final String title;

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
      child: Text(title, style: context.theme.textTheme.labelMedium),
    );
  }
}
