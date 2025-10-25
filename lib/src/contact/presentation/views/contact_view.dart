import 'package:flutter/material.dart';
import 'package:mohammad_portfolio/core/common/widgets/link_button.dart';
import 'package:mohammad_portfolio/core/common/widgets/section_button.dart';
import 'package:mohammad_portfolio/core/extensions/context_extension.dart';
import 'package:mohammad_portfolio/core/res/app_icon/app_icon_dark.dart';
import 'package:mohammad_portfolio/core/res/app_icon/app_icon_light.dart';
import 'package:mohammad_portfolio/core/utils/constants.dart';
import 'package:mohammad_portfolio/core/utils/enums.dart';
import 'package:mohammad_portfolio/src/contact/presentation/widgets/copy_text_button.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.08,
          vertical:
              context.deviceLayout == DeviceSize.desktop
                  ? 96
                  : context.deviceLayout == DeviceSize.tablet
                  ? 80
                  : 64,
        ),
        child: Column(
          children: [
            SectionButton(title: context.language.get_in_touch),
            const SizedBox(height: 10),
            FractionallySizedBox(
              widthFactor:
                  context.deviceLayout == DeviceSize.mobile
                      ? 1
                      : context.deviceLayout == DeviceSize.tablet
                      ? 0.7
                      : 0.4,
              child: Text(
                context.language.feel_free_to_reach,
                textAlign: TextAlign.center,
                style: context.theme.textTheme.titleMedium,
              ),
            ),
            SizedBox(
              height:
                  context.deviceLayout == DeviceSize.desktop
                      ? 48
                      : context.deviceLayout == DeviceSize.tablet
                      ? 36
                      : 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  context.isDark
                      ? context.deviceLayout == DeviceSize.desktop
                          ? AppIconDark.inboxIcon32
                          : AppIconDark.inboxIcon24
                      : context.deviceLayout == DeviceSize.desktop
                      ? AppIconLight.inboxIcon32
                      : AppIconLight.inboxIcon24,
                ),
                const SizedBox(width: 10),
                Text(
                  'mohammadmaher1999@outlook.com',
                  style: context.theme.textTheme.displayMedium,
                ),
                const SizedBox(width: 10),
                const CopyTextButton(
                  textToCopy: 'mohammadmaher1999@outlook.com',
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  context.isDark
                      ? context.deviceLayout == DeviceSize.desktop
                          ? AppIconDark.phoneIcon32
                          : AppIconDark.phoneIcon24
                      : context.deviceLayout == DeviceSize.desktop
                      ? AppIconLight.phoneIcon32
                      : AppIconLight.phoneIcon24,
                ),
                const SizedBox(width: 10),
                Text(
                  '+962796342455',
                  style: context.theme.textTheme.displayMedium,
                ),
                const SizedBox(width: 10),
                const CopyTextButton(textToCopy: '+962796342455'),
              ],
            ),
            SizedBox(
              height:
                  context.deviceLayout == DeviceSize.desktop
                      ? 48
                      : context.deviceLayout == DeviceSize.tablet
                      ? 36
                      : 24,
            ),
            Text(
              context.language.you_may_also_find_me_on_these_platforms,
              style: context.theme.textTheme.bodySmall,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
        ),
      ),
    );
  }
}
