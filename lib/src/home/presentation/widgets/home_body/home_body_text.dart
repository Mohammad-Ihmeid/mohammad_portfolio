import 'package:flutter/material.dart';
import 'package:mohammad_portfolio/core/common/widgets/link_button.dart';
import 'package:mohammad_portfolio/core/common/widgets/type_writer_widget.dart';
import 'package:mohammad_portfolio/core/extensions/context_extension.dart';
import 'package:mohammad_portfolio/core/res/app_color/app_color_dark.dart';
import 'package:mohammad_portfolio/core/res/app_color/app_color_light.dart';
import 'package:mohammad_portfolio/core/res/app_icon/app_icon_dark.dart';
import 'package:mohammad_portfolio/core/res/app_icon/app_icon_light.dart';
import 'package:mohammad_portfolio/core/utils/constants.dart';

class HomeBodyText extends StatelessWidget {
  const HomeBodyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TypewriterWidget(
          texts: ['${context.language.hi}, ${context.language.im_mohammad}'],
          textStyle: context.theme.textTheme.displayLarge!.copyWith(
            color:
                context.isDark ? AppColorsDark.gray900 : AppColorsLight.gray900,
          ),
          deletingSpeed: const Duration(milliseconds: 45),
          pauseDuration: const Duration(milliseconds: 1400),
        ),
        const SizedBox(height: 20),
        Text(
          context.language.hero_bio,
          style: context.theme.textTheme.bodySmall,
        ),
        const SizedBox(height: 40),
        Row(
          children: [
            SizedBox(
              width: 20,
              child: Image.asset(
                context.isDark
                    ? AppIconDark.locationIcon24
                    : AppIconLight.locationIcon24,
              ),
            ),
            const SizedBox(width: 5),
            Text(
              '${context.language.amman}, ${context.language.jordan}',
              style: context.theme.textTheme.bodySmall,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            SizedBox(
              width: 20,
              child: Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColorsLight.emerald,
                ),
              ),
            ),
            const SizedBox(width: 5),
            Text(
              context.language.available_for_new_projects,
              style: context.theme.textTheme.bodySmall,
            ),
          ],
        ),
        const SizedBox(height: 50),
        Row(
          children: [
            LinkButton(
              assetPath:
                  context.isDark
                      ? AppIconDark.githubIcon24
                      : AppIconLight.githubIcon24,
              url: urlGithub,
              tooltip: 'GitHub',
            ),

            LinkButton(
              assetPath:
                  context.isDark
                      ? AppIconDark.linkedinIcon24
                      : AppIconLight.linkedinIcon24,
              url: urlLinkedin,
              tooltip: 'LinkedIn',
            ),

            LinkButton(
              assetPath:
                  context.isDark
                      ? AppIconDark.instagramIcon24
                      : AppIconLight.instagramIcon24,
              url: urlInstagram,
              tooltip: 'Instagram',
            ),
          ],
        ),
      ],
    );
  }
}
