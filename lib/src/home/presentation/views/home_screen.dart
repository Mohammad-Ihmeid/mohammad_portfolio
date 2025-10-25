import 'package:flutter/material.dart';
import 'package:mohammad_portfolio/core/common/app/provides/theme_provider.dart';
import 'package:mohammad_portfolio/core/common/widgets/icon_hover_button.dart';
import 'package:mohammad_portfolio/core/common/widgets/main_app_bar/main_app_bar.dart';
import 'package:mohammad_portfolio/core/constants/app_values.dart';
import 'package:mohammad_portfolio/core/extensions/context_extension.dart';
import 'package:mohammad_portfolio/core/res/app_color/app_color_dark.dart';
import 'package:mohammad_portfolio/core/res/app_color/app_color_light.dart';
import 'package:mohammad_portfolio/core/res/app_icon/app_icon_dark.dart';
import 'package:mohammad_portfolio/core/res/app_icon/app_icon_light.dart';
import 'package:mohammad_portfolio/core/utils/constants.dart';
import 'package:mohammad_portfolio/src/about/presentation/views/about_view.dart';
import 'package:mohammad_portfolio/src/contact/presentation/views/contact_view.dart';
import 'package:mohammad_portfolio/src/experience/presentation/views/experience_view.dart';
import 'package:mohammad_portfolio/src/home/presentation/refactor/home_body.dart';
import 'package:mohammad_portfolio/src/skills/presentation/views/skills_view.dart';
import 'package:mohammad_portfolio/src/testimonials/presentation/views/testimonials_view.dart';
import 'package:mohammad_portfolio/src/work/presentation/views/work_view.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // مفاتيح الأقسام لتمكين scroll-to-section لاحقًا
  final GlobalKey<State<StatefulWidget>> intoductionKey = GlobalKey();
  final GlobalKey<State<StatefulWidget>> aboutKey = GlobalKey();
  final GlobalKey<State<StatefulWidget>> skillsKey = GlobalKey();
  final GlobalKey<State<StatefulWidget>> experienceKey = GlobalKey();
  final GlobalKey<State<StatefulWidget>> workKey = GlobalKey();
  final GlobalKey<State<StatefulWidget>> testimonialsKey = GlobalKey();
  final GlobalKey<State<StatefulWidget>> contactKey = GlobalKey();

  void _scrollTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 450),
        curve: Curves.easeInOut,
        alignment: .1,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: context.width,
        backgroundColor:
            context.isDark
                ? AppColorsDark.grayDefault
                : AppColorsLight.grayDefault,
        shape: const RoundedRectangleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.s20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('<FL />', style: context.theme.textTheme.headlineMedium),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset(
                      context.isDark
                          ? AppIconDark.closeIcon24
                          : AppIconLight.closeIcon24,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Divider(
                color:
                    context.isDark
                        ? AppColorsDark.gray100
                        : AppColorsLight.gray100,
              ),
              const SizedBox(height: 10),
              TextButton(
                onTap: () {
                  Navigator.pop(context);
                  _scrollTo(aboutKey);
                },
                title: context.language.about,
              ),
              const SizedBox(height: 15),
              TextButton(
                onTap: () {
                  Navigator.pop(context);
                  _scrollTo(workKey);
                },
                title: context.language.work,
              ),
              const SizedBox(height: 15),
              TextButton(
                onTap: () {
                  Navigator.pop(context);
                  _scrollTo(testimonialsKey);
                },
                title: context.language.testimonials,
              ),
              const SizedBox(height: 15),
              TextButton(
                onTap: () {
                  Navigator.pop(context);
                  _scrollTo(contactKey);
                },
                title: context.language.contact,
              ),
              const SizedBox(height: 10),
              Divider(
                color:
                    context.isDark
                        ? AppColorsDark.gray100
                        : AppColorsLight.gray100,
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  Text(
                    context.language.switch_theme,
                    style: context.theme.textTheme.bodySmall,
                  ),
                  const Spacer(),
                  IconHoverButton(
                    assetPath:
                        context.isDark
                            ? AppIconDark.darkModeIcon24
                            : AppIconLight.lightModeIcon24,
                    onTap: () {
                      Provider.of<ThemeProvider>(
                        context,
                        listen: false,
                      ).toggleTheme();
                    },
                    tooltip: context.isDark ? 'Light Mode' : 'Dark Mode',
                  ),
                ],
              ),
              const SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (await canLaunchUrl(Uri.parse(urlCV))) {
                      await launchUrl(
                        Uri.parse(urlCV),
                        mode: LaunchMode.externalApplication,
                      );
                    } else {
                      debugPrint('تعذر فتح الرابط');
                    }
                  },
                  child: Text(context.language.download_cv),
                ),
              ),
            ],
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          MainAppBar(
            aboutTap: () => _scrollTo(aboutKey),
            workTap: () => _scrollTo(workKey),
            testimonialsTap: () => _scrollTo(testimonialsKey),
            contactTap: () => _scrollTo(contactKey),
          ),
          HomeBody(key: intoductionKey),
          AboutView(key: aboutKey),
          SkillsView(key: skillsKey),
          ExperienceView(key: experienceKey),
          WorkView(key: workKey),
          TestimonialsView(key: testimonialsKey),
          ContactView(key: contactKey),
        ],
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
