import 'package:flutter/material.dart';
import 'package:mohammad_portfolio/core/extensions/context_extension.dart';
import 'package:mohammad_portfolio/core/res/app_color/app_color_dark.dart';
import 'package:mohammad_portfolio/core/res/app_color/app_color_light.dart';
import 'package:mohammad_portfolio/core/res/app_icon/app_icon_dark.dart';
import 'package:mohammad_portfolio/core/res/app_icon/app_icon_light.dart';
import 'package:mohammad_portfolio/core/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class MainAppBarDesktop extends StatelessWidget {
  const MainAppBarDesktop({
    required this.contactTap,
    required this.aboutTap,
    required this.workTap,
    required this.testimonialsTap,
    super.key,
  });

  final VoidCallback aboutTap;
  final VoidCallback workTap;
  final VoidCallback testimonialsTap;
  final VoidCallback contactTap;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor:
          context.isDark
              ? AppColorsDark.grayDefault
              : AppColorsLight.grayDefault,
      surfaceTintColor:
          context.isDark ? const Color(0x80030712) : const Color(0x80F9FAFB),
      automaticallyImplyLeading: false,
      elevation: 8,
      toolbarHeight: 80,
      flexibleSpace: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.08),
        child: Row(
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
            const Spacer(),
            TextButton(onTap: aboutTap, title: context.language.about),
            const SizedBox(width: 15),
            TextButton(onTap: workTap, title: context.language.work),
            const SizedBox(width: 15),
            TextButton(
              onTap: testimonialsTap,
              title: context.language.testimonials,
            ),
            const SizedBox(width: 15),
            TextButton(onTap: contactTap, title: context.language.contact),
            const SizedBox(width: 15),
            VerticalDivider(
              color:
                  context.isDark
                      ? AppColorsDark.gray100
                      : AppColorsLight.gray100,
              indent: 10,
              endIndent: 10,
            ),
            const SizedBox(width: 20),
            Image.asset(
              context.isDark
                  ? AppIconDark.darkModeIcon24
                  : AppIconLight.lightModeIcon24,
            ),
            const SizedBox(width: 15),
            ElevatedButton(
              onPressed: () async {
                if (await canLaunchUrl(Uri.parse(urlCV))) {
                  await launchUrl(
                    Uri.parse(urlCV),
                    mode:
                        LaunchMode
                            .externalApplication, // 👈 يفتح الرابط خارج التطبيق
                  );
                } else {
                  debugPrint('تعذر فتح الرابط');
                }
              },
              child: Text(context.language.download_cv),
            ),
          ],
        ),
      ),
    );
  }
}

class TextButton extends StatelessWidget {
  const TextButton({required this.title, this.onTap, super.key});

  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(title, style: context.theme.textTheme.bodyMedium),
    );
  }
}
