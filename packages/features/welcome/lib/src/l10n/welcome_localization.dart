import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'welcome_localization_en.dart';

/// Callers can lookup localized strings with an instance of WelcomeScreenLocalizations
/// returned by `WelcomeScreenLocalizations.of(context)`.
///
/// Applications need to include `WelcomeScreenLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/welcome_localization.dart';
///
/// return MaterialApp(
///   localizationsDelegates: WelcomeScreenLocalizations.localizationsDelegates,
///   supportedLocales: WelcomeScreenLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the WelcomeScreenLocalizations.supportedLocales
/// property.
abstract class WelcomeScreenLocalizations {
  WelcomeScreenLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static WelcomeScreenLocalizations of(BuildContext context) {
    return Localizations.of<WelcomeScreenLocalizations>(context, WelcomeScreenLocalizations)!;
  }

  static const LocalizationsDelegate<WelcomeScreenLocalizations> delegate = _WelcomeScreenLocalizationsDelegate();

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

  /// No description provided for @welcomePageTitle.
  ///
  /// In en, this message translates to:
  /// **'Amera Store'**
  String get welcomePageTitle;

  /// No description provided for @customerTitle.
  ///
  /// In en, this message translates to:
  /// **'Customer'**
  String get customerTitle;

  /// No description provided for @sellerTitle.
  ///
  /// In en, this message translates to:
  /// **'Sellers Only'**
  String get sellerTitle;

  /// No description provided for @customerSignInButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Log In'**
  String get customerSignInButtonLabel;

  /// No description provided for @customerSignUpButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get customerSignUpButtonLabel;

  /// No description provided for @sellerSignInButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Log In'**
  String get sellerSignInButtonLabel;

  /// No description provided for @sellerSignUpButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get sellerSignUpButtonLabel;

  /// No description provided for @googleSignInLabel.
  ///
  /// In en, this message translates to:
  /// **'Google'**
  String get googleSignInLabel;

  /// No description provided for @facebookSignInLabel.
  ///
  /// In en, this message translates to:
  /// **'Facebook'**
  String get facebookSignInLabel;

  /// No description provided for @guestSignInLabel.
  ///
  /// In en, this message translates to:
  /// **'Guest'**
  String get guestSignInLabel;

  /// No description provided for @buyAnimatedText.
  ///
  /// In en, this message translates to:
  /// **'Buy'**
  String get buyAnimatedText;

  /// No description provided for @sellAnimatedText.
  ///
  /// In en, this message translates to:
  /// **'Sell'**
  String get sellAnimatedText;

  /// No description provided for @browseAnimatedText.
  ///
  /// In en, this message translates to:
  /// **'Browse'**
  String get browseAnimatedText;

  /// No description provided for @multiStoreAnimatedText.
  ///
  /// In en, this message translates to:
  /// **'MultiStore'**
  String get multiStoreAnimatedText;
}

class _WelcomeScreenLocalizationsDelegate extends LocalizationsDelegate<WelcomeScreenLocalizations> {
  const _WelcomeScreenLocalizationsDelegate();

  @override
  Future<WelcomeScreenLocalizations> load(Locale locale) {
    return SynchronousFuture<WelcomeScreenLocalizations>(lookupWelcomeScreenLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_WelcomeScreenLocalizationsDelegate old) => false;
}

WelcomeScreenLocalizations lookupWelcomeScreenLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return WelcomeScreenLocalizationsEn();
  }

  throw FlutterError(
    'WelcomeScreenLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
