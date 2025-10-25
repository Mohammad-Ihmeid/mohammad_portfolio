import 'package:flutter/material.dart';
import 'package:mohammad_portfolio/core/extensions/context_extension.dart';
import 'package:mohammad_portfolio/core/res/media_res.dart';
import 'package:mohammad_portfolio/core/utils/responsive_layout.dart';
import 'package:mohammad_portfolio/src/home/presentation/widgets/home_body/home_body_image.dart';
import 'package:mohammad_portfolio/src/home/presentation/widgets/home_body/home_body_text.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.08),
        child: const ResponsiveLayout(
          mobile: Padding(
            padding: EdgeInsets.symmetric(vertical: 64),
            child: Column(
              children: [
                LayeredProfilePhoto(image: AssetImage(MediaRes.myProfileImg)),
                SizedBox(height: 70),
                HomeBodyText(),
              ],
            ),
          ),
          tablet: Padding(
            padding: EdgeInsets.symmetric(vertical: 80),
            child: Row(
              children: [
                Expanded(child: HomeBodyText()),
                SizedBox(width: 100),
                LayeredProfilePhoto(image: AssetImage(MediaRes.myProfileImg)),
              ],
            ),
          ),
          desktop: Padding(
            padding: EdgeInsets.symmetric(vertical: 96),
            child: Row(
              children: [
                Expanded(child: HomeBodyText()),
                SizedBox(width: 200),
                LayeredProfilePhoto(
                  image: AssetImage(MediaRes.myProfileImg),
                  size: 240,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
