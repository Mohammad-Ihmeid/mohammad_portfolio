import 'package:flutter/material.dart';
import 'package:mohammad_portfolio/core/constants/app_values.dart';
import 'package:mohammad_portfolio/core/extensions/context_extension.dart';
import 'package:mohammad_portfolio/core/res/app_color/app_color_dark.dart';
import 'package:mohammad_portfolio/core/res/app_color/app_color_light.dart';
import 'package:mohammad_portfolio/core/utils/enums.dart';
import 'package:mohammad_portfolio/src/experience/domain/enities/experience.dart';

// class Experience {
//   Experience({
//     required this.title,
//     required this.company,
//     required this.period,
//     required this.description,
//     this.isCurrent = false,
//   });
//   final String title;
//   final String company;
//   final String period;
//   final String description;
//   final bool isCurrent;
// }

class ExperienceTimeline extends StatelessWidget {
  const ExperienceTimeline({
    required this.items,
    super.key,
    this.lineWidth = 3,
    this.lineColor = const Color(0xFFBDBDBD),
    this.padding = const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
  });
  final List<Experience> items;
  final double lineWidth;
  final Color lineColor;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    const centerColumnWidth = 48.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            // الخط المركزي (يمتد طوال الـListView)
            Positioned.fill(
              left: (constraints.maxWidth - centerColumnWidth) / 2,
              right: (constraints.maxWidth - centerColumnWidth) / 2,
              child: IgnorePointer(
                child: Container(
                  alignment: Alignment.topCenter,
                  child: FractionallySizedBox(
                    heightFactor: 1,
                    widthFactor: 1,
                    child: Center(
                      child: Container(
                        width: lineWidth,
                        color:
                            context.isDark
                                ? AppColorsDark.grayDefault
                                : AppColorsLight.grayDefault,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // قائمة العناصر
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              padding: padding,
              shrinkWrap: true,
              itemCount: items.length,
              separatorBuilder: (_, _) => const SizedBox(height: 100),
              itemBuilder: (context, index) {
                final e = items[index];

                // محتوى البطاقة (يمكن تغييره ليتضمن أي تصميم)
                final card = _ExperienceCard(experience: e);
                final cardDate = _ExperienceDate(experience: e);

                final periodText = e.periodText(
                  arabic: context.languageApp!.countryCode == 'ar',
                );

                // الدائرة على الخط (node)
                final node = _TimelineNode(
                  isCurrent: e.endDate == null,
                  outerSize: 20,
                  innerSize: 10,
                  semanticLabel:
                      '${e.jobTitle} at ${e.companyName}, '
                      '$periodText',
                );

                // رسم الصف: Card - Center column (node) - Empty spacer
                return Row(
                  children: <Widget>[
                    Expanded(child: cardDate),
                    // center column (node)
                    SizedBox(
                      width: centerColumnWidth,
                      child: Column(
                        children: [const SizedBox(height: 6), node],
                      ),
                    ),
                    Expanded(child: card),
                  ],
                );
              },
            ),
          ],
        );
      },
    );
  }
}

class _TimelineNode extends StatelessWidget {
  const _TimelineNode({
    required this.isCurrent,
    required this.outerSize,
    required this.innerSize,
    required this.semanticLabel,
  });
  final bool isCurrent;
  final double outerSize;
  final double innerSize;
  final String semanticLabel;

  @override
  Widget build(BuildContext context) {
    final outer = Container(
      width: outerSize,
      height: outerSize,
      decoration: BoxDecoration(
        color:
            isCurrent
                ? AppColorsLight.emerald
                : context.isDark
                ? AppColorsDark.grayDefault
                : AppColorsLight.grayDefault,
        shape: BoxShape.circle,
        border:
            isCurrent
                ? null
                : Border.all(
                  color:
                      context.isDark
                          ? AppColorsDark.gray300
                          : AppColorsLight.gray300,
                  width: 2,
                ),
        boxShadow:
            isCurrent
                ? [
                  BoxShadow(
                    color: AppColorsLight.emerald.withValues(alpha: 0.3),
                    blurRadius: 8,
                    spreadRadius: 1,
                  ),
                ]
                : null,
      ),
      alignment: Alignment.center,
      child:
          isCurrent
              ? Icon(
                Icons.work,
                size: innerSize,
                color:
                    context.isDark
                        ? AppColorsDark.grayDefault
                        : AppColorsLight.grayDefault,
              )
              : Container(
                width: innerSize,
                height: innerSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      context.isDark
                          ? AppColorsDark.gray300
                          : AppColorsLight.gray300,
                ),
              ),
    );

    return Semantics(label: semanticLabel, child: outer);
  }
}

class _ExperienceCard extends StatelessWidget {
  const _ExperienceCard({required this.experience});
  final Experience experience;

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
          context.deviceLayout != DeviceSize.mobile ? 32 : 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              experience.jobTitle,
              style: context.theme.textTheme.titleLarge,
            ),
            if (context.deviceLayout != DeviceSize.mobile) ...[
              const SizedBox(height: 8),
              Text(
                experience.description?.trim() ?? '',
                textAlign: TextAlign.start,
                style: context.theme.textTheme.bodySmall,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ExperienceDate extends StatelessWidget {
  const _ExperienceDate({required this.experience});

  final Experience experience;

  @override
  Widget build(BuildContext context) {
    final periodText = experience.periodText(
      arabic: context.languageApp!.countryCode == 'ar',
    );

    return Column(
      crossAxisAlignment:
          context.deviceLayout == DeviceSize.mobile
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.end,
      children: [
        Text(
          experience.companyName,
          textAlign: TextAlign.center,
          style: context.theme.textTheme.bodySmall!.copyWith(
            color:
                context.isDark ? AppColorsDark.gray700 : AppColorsLight.gray700,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          periodText,
          style: context.theme.textTheme.bodySmall!.copyWith(
            color:
                context.isDark ? AppColorsDark.gray700 : AppColorsLight.gray700,
          ),
        ),
      ],
    );
  }
}
