import 'package:flutter/material.dart';
import 'package:mohammad_portfolio/core/extensions/context_extension.dart';

class CoreUtils {
  const CoreUtils._();

  static double getFontSize(BuildContext context, double baseFontSize) {
    final screenWidth = context.width;
    const baseScreenWidth = 375;
    final scaleFactor = screenWidth / baseScreenWidth;
    return baseFontSize * scaleFactor;
  }
}
