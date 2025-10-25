import 'package:flutter/material.dart';
import 'package:mohammad_portfolio/core/common/widgets/section_button.dart';
import 'package:mohammad_portfolio/core/data/testimonials_data.dart';
import 'package:mohammad_portfolio/core/extensions/context_extension.dart';
import 'package:mohammad_portfolio/core/res/app_color/app_color_dark.dart';
import 'package:mohammad_portfolio/core/res/app_color/app_color_light.dart';
import 'package:mohammad_portfolio/core/utils/enums.dart';
import 'package:mohammad_portfolio/src/testimonials/presentation/widgets/testimonials_card.dart';

class TestimonialsView extends StatelessWidget {
  const TestimonialsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: context.isDark ? AppColorsDark.gray50 : AppColorsLight.gray50,
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
            SectionButton(title: context.language.testimonials),
            const SizedBox(height: 10),
            Text(
              context.language.nice_things_people_have_said,
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
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    context.deviceLayout == DeviceSize.desktop
                        ? 3
                        : context.deviceLayout == DeviceSize.tablet
                        ? 2
                        : 1,
                crossAxisSpacing: 24,
                mainAxisSpacing:
                    context.deviceLayout == DeviceSize.desktop
                        ? 48
                        : context.deviceLayout == DeviceSize.tablet
                        ? 32
                        : 16,
              ),
              itemCount: TestimonialsData.getData(context: context).length,
              itemBuilder: (context, index) {
                final element =
                    TestimonialsData.getData(context: context)[index];
                return TestimonialsCard(testimonials: element);
              },
            ),
          ],
        ),
      ),
    );
  }
}
