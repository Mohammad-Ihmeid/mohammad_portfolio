import 'package:flutter/material.dart';
import 'package:mohammad_portfolio/core/common/app/provides/language_provider.dart';
import 'package:mohammad_portfolio/core/constants/breakpoints.dart';
import 'package:mohammad_portfolio/core/utils/enums.dart';
import 'package:mohammad_portfolio/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

extension ContextExt on BuildContext {
  ThemeData get theme => Theme.of(this);

  bool get isDark => theme.brightness == Brightness.dark;

  AppLocalizations get language => AppLocalizations.of(this)!;

  LanguageProvider get languageProvider => read<LanguageProvider>();
  Locale? get languageApp => languageProvider.localeApp;

  Size get size => MediaQuery.sizeOf(this);
  double get width => size.width;
  double get height => size.height;

  DeviceSize get deviceLayout {
    if (width >= Breakpoints.desktop) return DeviceSize.desktop;
    if (width >= Breakpoints.tablet) return DeviceSize.tablet;
    return DeviceSize.mobile;
  }
}
