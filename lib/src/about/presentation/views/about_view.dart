import 'package:flutter/material.dart';
import 'package:mohammad_portfolio/core/extensions/context_extension.dart';
import 'package:mohammad_portfolio/core/res/app_color/app_color_dark.dart';
import 'package:mohammad_portfolio/core/res/app_color/app_color_light.dart';
import 'package:mohammad_portfolio/core/res/media_res.dart';
import 'package:mohammad_portfolio/core/utils/responsive_layout.dart';
import 'package:mohammad_portfolio/src/about/presentation/widgets/about_button.dart';
import 'package:mohammad_portfolio/src/home/presentation/widgets/home_body/home_body_image.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: context.isDark ? AppColorsDark.gray50 : AppColorsLight.gray50,
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.08),
        child: const ResponsiveLayout(
          mobile: Padding(
            padding: EdgeInsets.symmetric(vertical: 64),
            child: Column(
              children: [
                AboutButton(),
                SizedBox(height: 24),
                LayeredProfilePhoto(image: AssetImage(MediaRes.aboutMeImg)),
                SizedBox(height: 48),
                AboutText(),
              ],
            ),
          ),
          tablet: Padding(
            padding: EdgeInsets.symmetric(vertical: 80),
            child: Column(
              children: [
                AboutButton(),
                SizedBox(height: 36),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Center(
                        child: LayeredProfilePhoto(
                          image: AssetImage(MediaRes.aboutMeImg),
                          size: 300,
                        ),
                      ),
                    ),
                    SizedBox(width: 48),
                    Expanded(child: AboutText()),
                  ],
                ),
              ],
            ),
          ),
          desktop: Padding(
            padding: EdgeInsets.symmetric(vertical: 96),
            child: Column(
              children: [
                AboutButton(),
                SizedBox(height: 48),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Center(
                        child: LayeredProfilePhoto(
                          image: AssetImage(MediaRes.aboutMeImg),
                          size: 400,
                        ),
                      ),
                    ),
                    SizedBox(width: 48),
                    Expanded(child: AboutText()),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AboutText extends StatelessWidget {
  const AboutText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${context.language.curious_about_me}'
          '${context.language.here_you_have_it}:',
          style: context.theme.textTheme.headlineSmall,
        ),
        const SizedBox(height: 24),
        Text(
          context.language.bio_intro,
          style: context.theme.textTheme.bodySmall,
        ),
        const SizedBox(height: 16),
        Text(
          context.language.bio_work,
          style: context.theme.textTheme.bodySmall,
        ),
        const SizedBox(height: 16),
        Text(
          context.language.bio_mindset,
          style: context.theme.textTheme.bodySmall,
        ),
        const SizedBox(height: 16),
        Text(
          context.language.bio_stack,
          style: context.theme.textTheme.bodySmall,
        ),
        const SizedBox(height: 16),
        Text(
          context.language.bio_personal,
          style: context.theme.textTheme.bodySmall,
        ),
        const SizedBox(height: 16),
        Text(
          context.language.bio_facts,
          style: context.theme.textTheme.bodySmall,
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                context.language.bio_fact1,
                style: context.theme.textTheme.bodySmall,
              ),
            ),
            Expanded(
              child: Text(
                context.language.bio_fact2,
                style: context.theme.textTheme.bodySmall,
              ),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                context.language.bio_fact3,
                style: context.theme.textTheme.bodySmall,
              ),
            ),
            Expanded(
              child: Text(
                context.language.bio_fact4,
                style: context.theme.textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
