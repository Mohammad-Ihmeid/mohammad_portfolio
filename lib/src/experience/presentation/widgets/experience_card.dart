import 'package:flutter/material.dart';
import 'package:mohammad_portfolio/core/constants/app_values.dart';
import 'package:mohammad_portfolio/core/extensions/context_extension.dart';
import 'package:mohammad_portfolio/core/res/app_color/app_color_dark.dart';
import 'package:mohammad_portfolio/core/res/app_color/app_color_light.dart';
import 'package:mohammad_portfolio/core/utils/responsive_layout.dart';
import 'package:mohammad_portfolio/src/experience/domain/enities/experience.dart';

class ExperienceCard extends StatefulWidget {
  const ExperienceCard({required this.experience, super.key});

  final Experience experience;

  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard> {
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
        padding: const EdgeInsets.all(32),
        child: ResponsiveLayout(
          mobile: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              logoCompany(widget.experience.companyLogo),
              periodDescription(
                widget.experience.periodText(
                  arabic: context.languageApp!.countryCode == 'ar',
                ),
              ),
              const SizedBox(height: 16),
              jobDescription(
                jobTitle: widget.experience.jobTitle,
                learned: widget.experience.skillsLearned,
              ),
            ],
          ),
          tablet: Row(
            children: [
              Expanded(child: logoCompany(widget.experience.companyLogo)),
              const SizedBox(width: 32),
              Expanded(
                flex: 3,
                child: jobDescription(
                  jobTitle: widget.experience.jobTitle,
                  learned: widget.experience.skillsLearned,
                ),
              ),
              const SizedBox(width: 32),
              Expanded(
                child: periodDescription(
                  widget.experience.periodText(
                    arabic: context.languageApp!.countryCode == 'ar',
                  ),
                ),
              ),
            ],
          ),
          desktop: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: logoCompany(widget.experience.companyLogo),
                ),
              ),
              const SizedBox(width: 48),
              Expanded(
                flex: 3,
                child: jobDescription(
                  jobTitle: widget.experience.jobTitle,
                  learned: widget.experience.skillsLearned,
                ),
              ),
              const SizedBox(width: 48),
              Expanded(
                child: periodDescription(
                  widget.experience.periodText(
                    arabic: context.languageApp!.countryCode == 'ar',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget logoCompany(String image) {
    return Image.asset(image, width: 80, height: 80, fit: BoxFit.scaleDown);
  }

  Widget jobDescription({
    required String jobTitle,
    required List<String> learned,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(jobTitle, style: context.theme.textTheme.titleLarge),
        const SizedBox(height: 16),
        ...learned.map(
          (element) => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 8),
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.isDark ? Colors.white54 : Colors.black54,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(element, style: context.theme.textTheme.bodySmall),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget periodDescription(String periodText) {
    return Text(
      periodText,
      style: context.theme.textTheme.bodySmall!.copyWith(
        color: context.isDark ? AppColorsDark.gray700 : AppColorsLight.gray700,
      ),
    );
  }
}
