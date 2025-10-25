import 'package:flutter/material.dart';
import 'package:mohammad_portfolio/core/constants/app_values.dart';
import 'package:mohammad_portfolio/core/extensions/context_extension.dart';
import 'package:mohammad_portfolio/core/res/app_color/app_color_dark.dart';
import 'package:mohammad_portfolio/core/res/fonts.dart';
import 'package:mohammad_portfolio/core/utils/enums.dart';

ThemeData themeDataDark(BuildContext context) {
  return ThemeData(
    brightness: Brightness.dark,
    fontFamily: Fonts.inter,
    scaffoldBackgroundColor: AppColorsDark.grayDefault,
    textTheme: textTheme(context),
    elevatedButtonTheme: elevatedButtonTheme(context),
    //iconButtonTheme: iconButtonThemeData(context),
  );
}

// IconButtonThemeData iconButtonThemeData(BuildContext context) {
//   return IconButtonThemeData(
//     style: IconButton.styleFrom(
//       backgroundColor: AppColorsDark.gray600,
//       hoverColor: AppColorsDark.gray700,
//       focusColor: AppColorsDark.gray600,
//     ),
//   );
// }

ElevatedButtonThemeData elevatedButtonTheme(BuildContext context) {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColorsDark.gray900,
      foregroundColor: AppColorsDark.gray50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppBorderRadius.s12),
      ),
      textStyle: context.theme.textTheme.bodyMedium,
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.s16,
        vertical: AppPadding.s6,
      ),
    ).copyWith(
      backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.disabled)) {
          return AppColorsDark.gray900;
        }
        if (states.contains(WidgetState.pressed)) return AppColorsDark.gray800;
        if (states.contains(WidgetState.hovered)) return AppColorsDark.gray700;
        return AppColorsDark.gray900;
      }),
    ),
  );
}

TextTheme textTheme(BuildContext context) {
  return TextTheme(
    //Heading/H1 - (Desktop-Tablet-Mobile)
    displayLarge: TextStyle(
      fontSize:
          context.deviceLayout == DeviceSize.desktop
              ? 60
              : context.deviceLayout == DeviceSize.tablet
              ? 48
              : 36,
      fontWeight:
          context.deviceLayout == DeviceSize.desktop
              ? FontWeight.w700
              : context.deviceLayout == DeviceSize.tablet
              ? FontWeight.w700
              : FontWeight.w600,
    ),
    //Heading/H2 - (Desktop-Tablet-Mobile) - Semi Bold
    displayMedium: TextStyle(
      fontSize: context.deviceLayout == DeviceSize.desktop ? 36 : 18,
      fontWeight: FontWeight.w600,
      color: AppColorsDark.gray900,
    ),
    //Heading/H3 - (Desktop-Tablet-Mobile) - Bold
    headlineMedium: TextStyle(
      fontSize: context.deviceLayout == DeviceSize.desktop ? 30 : 24,
      fontWeight: FontWeight.w700,
      color: AppColorsDark.gray900,
    ),
    //Heading/H3 - (Desktop-Tablet-Mobile) - Semi Bold
    headlineSmall: TextStyle(
      fontSize: context.deviceLayout == DeviceSize.desktop ? 30 : 24,
      fontWeight: FontWeight.w600,
      color: AppColorsDark.gray900,
    ),
    //Subtitle - (Desktop-Tablet-Mobile) - Semi Bold
    titleLarge: TextStyle(
      fontSize: context.deviceLayout == DeviceSize.desktop ? 20 : 18,
      fontWeight: FontWeight.w600,
      color: AppColorsDark.gray900,
    ),
    //Subtitle - (Desktop-Tablet-Mobile) - Normal
    titleMedium: TextStyle(
      fontSize: context.deviceLayout == DeviceSize.desktop ? 20 : 18,
      fontWeight: FontWeight.w400,
      color: AppColorsDark.gray900,
    ),
    //Body1/Normal - (Desktop-Tablet-Mobile)
    bodyLarge: TextStyle(
      fontSize: context.deviceLayout == DeviceSize.desktop ? 18 : 16,
      fontWeight: FontWeight.w400,
      color: AppColorsDark.gray600,
    ),
    //Body2/Medium - All
    bodyMedium: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColorsDark.gray600,
    ),
    //Body2/Normal - All
    bodySmall: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColorsDark.gray600,
    ),
    //Body3/Medium - All
    labelMedium: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColorsDark.gray600,
    ),
  );
}
