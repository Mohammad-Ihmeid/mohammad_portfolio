import 'package:flutter/material.dart';
import 'package:mohammad_portfolio/core/common/widgets/section_button.dart';
import 'package:mohammad_portfolio/core/data/work_data.dart';
import 'package:mohammad_portfolio/core/extensions/context_extension.dart';
import 'package:mohammad_portfolio/core/utils/enums.dart';
import 'package:mohammad_portfolio/src/work/presentation/widgets/work_card.dart';

class WorkView extends StatelessWidget {
  const WorkView({super.key});

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
          mainAxisSize: MainAxisSize.min,
          children: [
            SectionButton(title: context.language.work),
            const SizedBox(height: 10),
            Text(
              context.language.some_of_the_noteworthy_projects,
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
            ListView.builder(
              shrinkWrap: true,
              itemCount: WorkData.getData(context: context).length,
              itemBuilder: (context, index) {
                final element = WorkData.getData(context: context)[index];
                final isEven = index.isEven;
                return Padding(
                  padding: EdgeInsets.only(
                    bottom:
                        context.deviceLayout == DeviceSize.desktop
                            ? 48
                            : context.deviceLayout == DeviceSize.tablet
                            ? 36
                            : 24,
                  ),
                  child: WorkCard(work: element, isEven: isEven),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
