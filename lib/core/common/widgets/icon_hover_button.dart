import 'package:flutter/material.dart';
import 'package:mohammad_portfolio/core/constants/app_values.dart';
import 'package:mohammad_portfolio/core/extensions/context_extension.dart';
import 'package:mohammad_portfolio/core/res/app_color/app_color_dark.dart';
import 'package:mohammad_portfolio/core/res/app_color/app_color_light.dart';

class IconHoverButton extends StatefulWidget {
  const IconHoverButton({
    required this.assetPath,
    this.onTap,
    this.tooltip,
    super.key,
  });
  final String assetPath;
  final VoidCallback? onTap;
  final String? tooltip;

  @override
  State<IconHoverButton> createState() => _IconHoverButtonState();
}

class _IconHoverButtonState extends State<IconHoverButton> {
  final ValueNotifier<bool> _hovering = ValueNotifier(false);

  void _setHover(bool v) {
    if (_hovering.value == v) return;
    _hovering.value = v;
  }

  Color normalIconColor(BuildContext context) {
    return context.isDark ? AppColorsDark.gray600 : AppColorsLight.gray600;
  }

  Color hoverIconColor(BuildContext context) {
    return context.isDark ? AppColorsDark.gray700 : AppColorsLight.gray700;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromRGBO(0, 0, 0, 0),
      child: MouseRegion(
        onEnter: (_) => _setHover(true),
        onExit: (_) => _setHover(false),
        child: InkWell(
          onTap: widget.onTap,
          onHover: _setHover,
          borderRadius: BorderRadius.circular(AppBorderRadius.s12),
          hoverColor:
              context.isDark ? AppColorsDark.gray100 : AppColorsLight.gray100,
          focusColor:
              context.isDark ? AppColorsDark.gray200 : AppColorsLight.gray200,
          child: ValueListenableBuilder(
            valueListenable: _hovering,
            builder: (context, hoveringValue, _) {
              return Padding(
                padding: const EdgeInsets.all(12),
                child: TweenAnimationBuilder<Color?>(
                  tween: ColorTween(
                    begin: normalIconColor(context),
                    end:
                        hoveringValue
                            ? hoverIconColor(context)
                            : normalIconColor(context),
                  ),
                  duration: const Duration(milliseconds: 180),
                  builder: (context, color, child) {
                    return Tooltip(
                      message: widget.tooltip ?? '',
                      child: ImageIcon(
                        AssetImage(widget.assetPath),
                        color: color,
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
