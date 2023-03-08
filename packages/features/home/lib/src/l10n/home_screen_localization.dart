import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'home_screen_localization_en.dart';

/// Callers can lookup localized strings with an instance of HomeScreenLocalizations
/// returned by `HomeScreenLocalizations.of(context)`.
///
/// Applications need to include `HomeScreenLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/home_screen_localization.dart';
///
/// return MaterialApp(
///   localizationsDelegates: HomeScreenLocalizations.localizationsDelegates,
///   supportedLocales: HomeScreenLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the HomeScreenLocalizations.supportedLocales
/// property.
abstract class HomeScreenLocalizations {
  HomeScreenLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static HomeScreenLocalizations of(BuildContext context) {
    return Localizations.of<HomeScreenLocalizations>(context, HomeScreenLocalizations)!;
  }

  static const LocalizationsDelegate<HomeScreenLocalizations> delegate = _HomeScreenLocalizationsDelegate();

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
    Locale('en')
  ];

  /// No description provided for @searchFieldTextLabel.
  ///
  /// In en, this message translates to:
  /// **'What are you looking for?'**
  String get searchFieldTextLabel;

  /// No description provided for @searchButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get searchButtonLabel;

  /// No description provided for @menTabLabel.
  ///
  /// In en, this message translates to:
  /// **'Men'**
  String get menTabLabel;

  /// No description provided for @womenTabLabel.
  ///
  /// In en, this message translates to:
  /// **'Women'**
  String get womenTabLabel;

  /// No description provided for @shoesTabLabel.
  ///
  /// In en, this message translates to:
  /// **'Shoes'**
  String get shoesTabLabel;

  /// No description provided for @bagsTabLabel.
  ///
  /// In en, this message translates to:
  /// **'Bags'**
  String get bagsTabLabel;

  /// No description provided for @electronicsTabLabel.
  ///
  /// In en, this message translates to:
  /// **'Electronics'**
  String get electronicsTabLabel;

  /// No description provided for @accessoriesTabLabel.
  ///
  /// In en, this message translates to:
  /// **'Accessories'**
  String get accessoriesTabLabel;

  /// No description provided for @homeAndGardenTabLabel.
  ///
  /// In en, this message translates to:
  /// **'Home & Garden'**
  String get homeAndGardenTabLabel;

  /// No description provided for @beautyTabLabel.
  ///
  /// In en, this message translates to:
  /// **'Beauty'**
  String get beautyTabLabel;

  /// No description provided for @kidsTabLabel.
  ///
  /// In en, this message translates to:
  /// **'Kids'**
  String get kidsTabLabel;
}

class _HomeScreenLocalizationsDelegate extends LocalizationsDelegate<HomeScreenLocalizations> {
  const _HomeScreenLocalizationsDelegate();

  @override
  Future<HomeScreenLocalizations> load(Locale locale) {
    return SynchronousFuture<HomeScreenLocalizations>(lookupHomeScreenLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_HomeScreenLocalizationsDelegate old) => false;
}

HomeScreenLocalizations lookupHomeScreenLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return HomeScreenLocalizationsEn();
  }

  throw FlutterError(
    'HomeScreenLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
