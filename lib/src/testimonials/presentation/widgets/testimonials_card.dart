import 'package:flutter/material.dart';
import 'package:mohammad_portfolio/core/constants/app_values.dart';
import 'package:mohammad_portfolio/core/extensions/context_extension.dart';
import 'package:mohammad_portfolio/core/res/app_color/app_color_dark.dart';
import 'package:mohammad_portfolio/core/res/app_color/app_color_light.dart';
import 'package:mohammad_portfolio/core/utils/enums.dart';
import 'package:mohammad_portfolio/src/testimonials/domain/enities/testimonials.dart';

class TestimonialsCard extends StatelessWidget {
  const TestimonialsCard({required this.testimonials, super.key});

  final Testimonials testimonials;

  @override
  Widget build(BuildContext context) {
    return Card(
      color:
          context.isDark ? AppColorsDark.gray100 : AppColorsLight.grayDefault,
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppBorderRadius.s12),
      ),
      child: Padding(
        padding: EdgeInsets.all(
          context.deviceLayout == DeviceSize.desktop
              ? 48
              : context.deviceLayout == DeviceSize.tablet
              ? 40
              : 32,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundColor:
                  context.isDark
                      ? AppColorsDark.gray500
                      : AppColorsLight.gray400,
              radius: 32,
              child: const Icon(Icons.person, color: Colors.black, size: 40),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Text(
                testimonials.feedBack,
                style: context.theme.textTheme.bodySmall,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              testimonials.customerName,
              style: context.theme.textTheme.titleLarge,
            ),
            Text(
              testimonials.customerJob,
              style: context.theme.textTheme.labelSmall,
            ),
          ],
        ),
      ),
    );
  }
}
