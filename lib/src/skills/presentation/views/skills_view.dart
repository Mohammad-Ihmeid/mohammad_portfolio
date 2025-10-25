import 'package:flutter/material.dart';
import 'package:mohammad_portfolio/core/common/widgets/section_button.dart';
import 'package:mohammad_portfolio/core/data/skills_data.dart';
import 'package:mohammad_portfolio/core/extensions/context_extension.dart';
import 'package:mohammad_portfolio/core/utils/enums.dart';
import 'package:mohammad_portfolio/src/skills/presentation/widgets/skills_grid.dart';

class SkillsView extends StatelessWidget {
  const SkillsView({super.key});

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
            SectionButton(title: context.language.skills),
            const SizedBox(height: 10),
            Text(
              context.language.skills_tools_technologies_really_good,
              textAlign: TextAlign.center,
              style: context.theme.textTheme.titleMedium,
            ),
            SizedBox(
              height:
                  context.deviceLayout == DeviceSize.desktop
                      ? 48
                      : context.deviceLayout == DeviceSize.tablet
                      ? 36
                      : 24,
            ),
            SkillsGrid(skills: SkillsData.getData(context: context)),
          ],
        ),
      ),
    );
  }
}
