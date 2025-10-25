import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Mohammad Ihmeid'**
  String get appName;

  /// No description provided for @hi.
  ///
  /// In en, this message translates to:
  /// **'Hi'**
  String get hi;

  /// No description provided for @im_mohammad.
  ///
  /// In en, this message translates to:
  /// **'I’m Mohammad 👋'**
  String get im_mohammad;

  /// No description provided for @hero_bio.
  ///
  /// In en, this message translates to:
  /// **'I am a Full Stack Developer specializing in Flutter and ASP.NET Core, focused on building high-quality mobile applications that are fast, visually appealing, and user-friendly.With over three years of hands-on experience in mobile development, I still enjoy creating innovative solutions as if it were my very first project.'**
  String get hero_bio;

  /// No description provided for @amman.
  ///
  /// In en, this message translates to:
  /// **'Amman'**
  String get amman;

  /// No description provided for @jordan.
  ///
  /// In en, this message translates to:
  /// **'Jordan'**
  String get jordan;

  /// No description provided for @available_for_new_projects.
  ///
  /// In en, this message translates to:
  /// **'Available for new projects'**
  String get available_for_new_projects;

  /// No description provided for @switch_theme.
  ///
  /// In en, this message translates to:
  /// **'Switch Theme'**
  String get switch_theme;

  /// No description provided for @copy.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get copy;

  /// No description provided for @copied.
  ///
  /// In en, this message translates to:
  /// **'Copied!'**
  String get copied;

  /// No description provided for @contact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get contact;

  /// No description provided for @testimonials.
  ///
  /// In en, this message translates to:
  /// **'Testimonials'**
  String get testimonials;

  /// No description provided for @work.
  ///
  /// In en, this message translates to:
  /// **'Work'**
  String get work;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @download_cv.
  ///
  /// In en, this message translates to:
  /// **'Download CV'**
  String get download_cv;

  /// No description provided for @about_me.
  ///
  /// In en, this message translates to:
  /// **'About me'**
  String get about_me;

  /// No description provided for @curious_about_me.
  ///
  /// In en, this message translates to:
  /// **'Curious about me?'**
  String get curious_about_me;

  /// No description provided for @here_you_have_it.
  ///
  /// In en, this message translates to:
  /// **'Here you have it'**
  String get here_you_have_it;

  /// No description provided for @bio_intro.
  ///
  /// In en, this message translates to:
  /// **'I’m a passionate Full Stack Mobile Developer specializing in Flutter and ASP.NET Core. I began my journey in 2022 focusing on mobile development, and since then I have been growing steadily, building applications that combine performance, security, and beautiful user interfaces.'**
  String get bio_intro;

  /// No description provided for @bio_work.
  ///
  /// In en, this message translates to:
  /// **'I work end-to-end across the development lifecycle: from UI/UX design and frontend Flutter implementation, to backend services with ASP.NET Core, database optimization, and deployment. While I enjoy working across the full stack, my main strength lies in delivering smooth and visually appealing Flutter applications that provide real value to users.'**
  String get bio_work;

  /// No description provided for @bio_mindset.
  ///
  /// In en, this message translates to:
  /// **'I’m highly motivated to learn quickly, adapt to new technologies, and refine my coding practices. Writing clean, maintainable, and scalable code is something I deeply care about. User experience and pixel-perfect design matter to me just as much as the technical foundation.'**
  String get bio_mindset;

  /// No description provided for @bio_stack.
  ///
  /// In en, this message translates to:
  /// **'My core stack includes Flutter, Dart, ASP.NET Core, SQL Server, and Firebase. I also bring experience in DevOps, CI/CD pipelines, and technical leadership where I support teams in building reliable and scalable solutions.'**
  String get bio_stack;

  /// No description provided for @bio_personal.
  ///
  /// In en, this message translates to:
  /// **'Outside of coding, I enjoy sports and reading. I actively share my projects and learnings on GitHub and LinkedIn, engaging with the tech community and staying up to date with the latest trends.'**
  String get bio_personal;

  /// No description provided for @bio_facts.
  ///
  /// In en, this message translates to:
  /// **'Quick facts about me:'**
  String get bio_facts;

  /// No description provided for @bio_fact1.
  ///
  /// In en, this message translates to:
  /// **'• Bachelor’s in Computer Engineering'**
  String get bio_fact1;

  /// No description provided for @bio_fact2.
  ///
  /// In en, this message translates to:
  /// **'• Avid Learner who is always exploring new skills'**
  String get bio_fact2;

  /// No description provided for @bio_fact3.
  ///
  /// In en, this message translates to:
  /// **'• Currently a Full-time employee'**
  String get bio_fact3;

  /// No description provided for @bio_fact4.
  ///
  /// In en, this message translates to:
  /// **'• Open to freelance opportunities and collaborations'**
  String get bio_fact4;

  /// No description provided for @skills.
  ///
  /// In en, this message translates to:
  /// **'Skills'**
  String get skills;

  /// No description provided for @skills_tools_technologies_really_good.
  ///
  /// In en, this message translates to:
  /// **'The skills, tools and technologies I am really good at:'**
  String get skills_tools_technologies_really_good;

  /// No description provided for @experience.
  ///
  /// In en, this message translates to:
  /// **'Experience'**
  String get experience;

  /// No description provided for @summary_of_my_most_recent_experiences.
  ///
  /// In en, this message translates to:
  /// **'Here is a quick summary of my most recent experiences:'**
  String get summary_of_my_most_recent_experiences;

  /// No description provided for @some_of_the_noteworthy_projects.
  ///
  /// In en, this message translates to:
  /// **'Some of the noteworthy projects I have built:'**
  String get some_of_the_noteworthy_projects;

  /// No description provided for @nice_things_people_have_said.
  ///
  /// In en, this message translates to:
  /// **'Nice things people have said about me:'**
  String get nice_things_people_have_said;

  /// No description provided for @get_in_touch.
  ///
  /// In en, this message translates to:
  /// **'Get in touch'**
  String get get_in_touch;

  /// No description provided for @feel_free_to_reach.
  ///
  /// In en, this message translates to:
  /// **'What’s next? Feel free to reach out to me if you\'re looking for a developer, have a query, or simply want to connect.'**
  String get feel_free_to_reach;

  /// No description provided for @you_may_also_find_me_on_these_platforms.
  ///
  /// In en, this message translates to:
  /// **'You may also find me on these platforms!'**
  String get you_may_also_find_me_on_these_platforms;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
