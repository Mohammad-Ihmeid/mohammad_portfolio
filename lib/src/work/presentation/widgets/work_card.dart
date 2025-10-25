import 'package:flutter/material.dart';
import 'package:mohammad_portfolio/core/constants/app_values.dart';
import 'package:mohammad_portfolio/core/extensions/context_extension.dart';
import 'package:mohammad_portfolio/core/res/app_color/app_color_dark.dart';
import 'package:mohammad_portfolio/core/res/app_color/app_color_light.dart';
import 'package:mohammad_portfolio/core/res/app_icon/app_icon_dark.dart';
import 'package:mohammad_portfolio/core/res/app_icon/app_icon_light.dart';
import 'package:mohammad_portfolio/core/utils/responsive_layout.dart';
import 'package:mohammad_portfolio/src/work/domain/enities/work.dart';

class WorkCard extends StatelessWidget {
  const WorkCard({required this.work, required this.isEven, super.key});

  final Work work;
  final bool isEven;

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
      child: ResponsiveLayout(
        mobile: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(40),
              width: double.infinity,
              color:
                  context.isDark
                      ? AppColorsDark.gray200
                      : AppColorsLight.gray50,
              child: projectImage(work.image, 192),
            ),
            Container(
              padding: const EdgeInsets.all(40),
              child: projectDesc(
                name: work.name,
                desc: work.description,
                skills: work.skills,
                context: context,
              ),
            ),
          ],
        ),
        tablet: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child:
                  isEven
                      ? Container(
                        padding: const EdgeInsets.all(40),
                        color:
                            context.isDark
                                ? AppColorsDark.gray200
                                : AppColorsLight.gray50,
                        child: projectImage(work.image, 384),
                      )
                      : Container(
                        padding: const EdgeInsets.all(40),
                        child: projectDesc(
                          name: work.name,
                          desc: work.description,
                          skills: work.skills,
                          context: context,
                        ),
                      ),
            ),
            Expanded(
              child:
                  isEven
                      ? Container(
                        padding: const EdgeInsets.all(40),
                        child: projectDesc(
                          name: work.name,
                          desc: work.description,
                          skills: work.skills,
                          context: context,
                        ),
                      )
                      : Container(
                        padding: const EdgeInsets.all(40),
                        color:
                            context.isDark
                                ? AppColorsDark.gray200
                                : AppColorsLight.gray50,
                        child: projectImage(work.image, 384),
                      ),
            ),
          ],
        ),
        desktop: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child:
                  isEven
                      ? Container(
                        padding: const EdgeInsets.all(48),
                        color:
                            context.isDark
                                ? AppColorsDark.gray200
                                : AppColorsLight.gray50,
                        child: projectImage(work.image, 384),
                      )
                      : Container(
                        padding: const EdgeInsets.all(48),
                        child: projectDesc(
                          name: work.name,
                          desc: work.description,
                          skills: work.skills,
                          context: context,
                        ),
                      ),
            ),
            Expanded(
              child:
                  isEven
                      ? Container(
                        padding: const EdgeInsets.all(48),
                        child: projectDesc(
                          name: work.name,
                          desc: work.description,
                          skills: work.skills,
                          context: context,
                        ),
                      )
                      : Container(
                        padding: const EdgeInsets.all(48),
                        color:
                            context.isDark
                                ? AppColorsDark.gray200
                                : AppColorsLight.gray50,
                        child: projectImage(work.image, 384),
                      ),
            ),
          ],
        ),
      ),
    );
  }

  Widget projectImage(String image, double height) {
    return Image.asset(image, height: height, fit: BoxFit.contain);
  }

  Widget projectDesc({
    required String name,
    required String desc,
    required List<String> skills,
    required BuildContext context,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(name, style: context.theme.textTheme.titleLarge),
        const SizedBox(height: 24),
        Text(desc, style: context.theme.textTheme.bodySmall),
        const SizedBox(height: 24),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children:
              skills
                  .map(
                    (element) => Chip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          AppBorderRadius.s12,
                        ),
                        side: const BorderSide(color: Colors.transparent),
                      ),
                      backgroundColor:
                          context.isDark
                              ? AppColorsDark.gray200
                              : AppColorsLight.gray200,
                      label: Text(
                        element,
                        style: context.theme.textTheme.labelMedium,
                      ),
                    ),
                  )
                  .toList(),
        ),
        const SizedBox(height: 24),
        Image.asset(
          context.isDark
              ? AppIconDark.externalLinkIcon24
              : AppIconLight.externalLinkIcon24,
        ),
      ],
    );
  }
}
