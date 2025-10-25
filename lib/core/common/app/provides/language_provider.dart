import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  static const String kLanguageKey =
      'language_app'; // Key for SharedPreferences
  Locale? _localeApp;

  /// Getter for the current locale
  Locale? get localeApp => _localeApp;

  /// Load the language when the app starts
  Future<void> loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    var languageCode = prefs.getString(kLanguageKey);

    if (languageCode == null) {
      // First run: Get the device's language and save it
      final deviceLocale = PlatformDispatcher.instance.locale;
      languageCode = deviceLocale.languageCode;

      // Save the device language in SharedPreferences
      await prefs.setString(kLanguageKey, languageCode);
    }

    _localeApp = Locale(languageCode);
    notifyListeners();
  }

  /// Change the app language
  Future<void> changeLanguage(String languageCode) async {
    _localeApp = Locale(languageCode);
    notifyListeners();

    // Save the selected language in SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(kLanguageKey, languageCode);
  }
}
