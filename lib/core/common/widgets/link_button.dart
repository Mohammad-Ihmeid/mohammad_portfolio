import 'package:flutter/material.dart';
import 'package:mohammad_portfolio/core/common/widgets/icon_hover_button.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkButton extends StatelessWidget {
  const LinkButton({
    required this.assetPath,
    required this.url,
    required this.tooltip,
    super.key,
  });

  final String assetPath;
  final String url;
  final String tooltip;

  @override
  Widget build(BuildContext context) {
    return IconHoverButton(
      assetPath: assetPath,
      onTap: () async {
        if (await canLaunchUrl(Uri.parse(url))) {
          await launchUrl(
            Uri.parse(url),
            mode: LaunchMode.externalApplication, // 👈 يفتح الرابط خارج التطبيق
          );
        } else {
          debugPrint('تعذر فتح الرابط');
        }
      },
      tooltip: tooltip,
    );
  }
}
