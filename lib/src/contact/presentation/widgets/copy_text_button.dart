import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mohammad_portfolio/core/common/widgets/icon_hover_button.dart';
import 'package:mohammad_portfolio/core/constants/app_values.dart';
import 'package:mohammad_portfolio/core/extensions/context_extension.dart';
import 'package:mohammad_portfolio/core/res/app_color/app_color_dark.dart';
import 'package:mohammad_portfolio/core/res/app_color/app_color_light.dart';
import 'package:mohammad_portfolio/core/res/app_icon/app_icon_dark.dart';
import 'package:mohammad_portfolio/core/res/app_icon/app_icon_light.dart';
import 'package:mohammad_portfolio/core/utils/enums.dart';

class CopyTextButton extends StatefulWidget {
  const CopyTextButton({required this.textToCopy, super.key});

  final String textToCopy;

  @override
  State<CopyTextButton> createState() => _CopyTextButtonState();
}

class _CopyTextButtonState extends State<CopyTextButton> {
  Future<void> _copyText(BuildContext context) async {
    await Clipboard.setData(ClipboardData(text: widget.textToCopy));

    if (context.mounted) {
      // إظهار SnackBar بعد النسخ
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          width: 100,
          backgroundColor:
              context.isDark ? AppColorsDark.gray200 : AppColorsLight.gray200,
          content: Text(
            context.language.copied,
            textAlign: TextAlign.center,
            style: context.theme.textTheme.labelMedium,
          ),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppBorderRadius.s12),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconHoverButton(
      assetPath:
          context.isDark
              ? context.deviceLayout == DeviceSize.desktop
                  ? AppIconDark.copyIcon32
                  : AppIconDark.copyIcon24
              : context.deviceLayout == DeviceSize.desktop
              ? AppIconLight.copyIcon32
              : AppIconLight.copyIcon24,
      tooltip: context.language.copy,
      onTap: () => _copyText(context),
    );
  }
}
