import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'seller_sign_in_localizations_en.dart';

/// Callers can lookup localized strings with an instance of SellerSignInLocalizations
/// returned by `SellerSignInLocalizations.of(context)`.
///
/// Applications need to include `SellerSignInLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/seller_sign_in_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: SellerSignInLocalizations.localizationsDelegates,
///   supportedLocales: SellerSignInLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the SellerSignInLocalizations.supportedLocales
/// property.
abstract class SellerSignInLocalizations {
  SellerSignInLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static SellerSignInLocalizations of(BuildContext context) {
    return Localizations.of<SellerSignInLocalizations>(context, SellerSignInLocalizations)!;
  }

  static const LocalizationsDelegate<SellerSignInLocalizations> delegate = _SellerSignInLocalizationsDelegate();

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

  /// No description provided for @invalidCredentialsErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Invalid email and/or password.'**
  String get invalidCredentialsErrorMessage;

  /// No description provided for @appBarTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get appBarTitle;

  /// No description provided for @emailTextFieldLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailTextFieldLabel;

  /// No description provided for @emailTextFieldEmptyErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Your email can\'t be empty.'**
  String get emailTextFieldEmptyErrorMessage;

  /// No description provided for @emailTextFieldInvalidErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'This email is not valid.'**
  String get emailTextFieldInvalidErrorMessage;

  /// No description provided for @passwordTextFieldLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordTextFieldLabel;

  /// No description provided for @passwordTextFieldEmptyErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Your password can\'t be empty.'**
  String get passwordTextFieldEmptyErrorMessage;

  /// No description provided for @passwordTextFieldInvalidErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least five characters long.'**
  String get passwordTextFieldInvalidErrorMessage;

  /// No description provided for @forgotMyPasswordButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Forgot my password'**
  String get forgotMyPasswordButtonLabel;

  /// No description provided for @signInButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signInButtonLabel;

  /// No description provided for @signUpOpeningText.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get signUpOpeningText;

  /// No description provided for @signUpButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signUpButtonLabel;
}

class _SellerSignInLocalizationsDelegate extends LocalizationsDelegate<SellerSignInLocalizations> {
  const _SellerSignInLocalizationsDelegate();

  @override
  Future<SellerSignInLocalizations> load(Locale locale) {
    return SynchronousFuture<SellerSignInLocalizations>(lookupSellerSignInLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_SellerSignInLocalizationsDelegate old) => false;
}

SellerSignInLocalizations lookupSellerSignInLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return SellerSignInLocalizationsEn();
  }

  throw FlutterError(
    'SellerSignInLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
