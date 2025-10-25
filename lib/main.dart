import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mohammad_portfolio/core/common/app/provides/language_provider.dart';
import 'package:mohammad_portfolio/core/common/app/provides/theme_provider.dart';
import 'package:mohammad_portfolio/core/extensions/context_extension.dart';
import 'package:mohammad_portfolio/core/res/theme_data/theme_data_dark.dart';
import 'package:mohammad_portfolio/core/res/theme_data/theme_data_light.dart';
import 'package:mohammad_portfolio/core/services/router.dart';
import 'package:mohammad_portfolio/firebase_options.dart';
import 'package:mohammad_portfolio/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LanguageProvider()..loadLanguage(),
        ),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final language = Provider.of<LanguageProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      locale: language.localeApp,
      onGenerateTitle: (context) => context.language.appName,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.themeMode,
      theme: themeDataLight(context),
      darkTheme: themeDataDark(context),
      onGenerateRoute: generateRoute,
    );
  }
}
