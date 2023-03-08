import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'category_screen_localization_en.dart';

/// Callers can lookup localized strings with an instance of CategoryScreenLocalizations
/// returned by `CategoryScreenLocalizations.of(context)`.
///
/// Applications need to include `CategoryScreenLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/category_screen_localization.dart';
///
/// return MaterialApp(
///   localizationsDelegates: CategoryScreenLocalizations.localizationsDelegates,
///   supportedLocales: CategoryScreenLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the CategoryScreenLocalizations.supportedLocales
/// property.
abstract class CategoryScreenLocalizations {
  CategoryScreenLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static CategoryScreenLocalizations of(BuildContext context) {
    return Localizations.of<CategoryScreenLocalizations>(context, CategoryScreenLocalizations)!;
  }

  static const LocalizationsDelegate<CategoryScreenLocalizations> delegate = _CategoryScreenLocalizationsDelegate();

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

  /// No description provided for @menCategoryLabel.
  ///
  /// In en, this message translates to:
  /// **'Men'**
  String get menCategoryLabel;

  /// No description provided for @womenCategoryLabel.
  ///
  /// In en, this message translates to:
  /// **'Women'**
  String get womenCategoryLabel;

  /// No description provided for @shoesCategoryLabel.
  ///
  /// In en, this message translates to:
  /// **'Shoes'**
  String get shoesCategoryLabel;

  /// No description provided for @bagsCategoryLabel.
  ///
  /// In en, this message translates to:
  /// **'Bags'**
  String get bagsCategoryLabel;

  /// No description provided for @electronicsCategoryLabel.
  ///
  /// In en, this message translates to:
  /// **'Electronics'**
  String get electronicsCategoryLabel;

  /// No description provided for @accessoriesCategoryLabel.
  ///
  /// In en, this message translates to:
  /// **'Accessories'**
  String get accessoriesCategoryLabel;

  /// No description provided for @homeAndGardenCategoryLabel.
  ///
  /// In en, this message translates to:
  /// **'Home & Garden'**
  String get homeAndGardenCategoryLabel;

  /// No description provided for @beautyCategoryLabel.
  ///
  /// In en, this message translates to:
  /// **'Beauty'**
  String get beautyCategoryLabel;

  /// No description provided for @kidsCategoryLabel.
  ///
  /// In en, this message translates to:
  /// **'Kids'**
  String get kidsCategoryLabel;
}

class _CategoryScreenLocalizationsDelegate extends LocalizationsDelegate<CategoryScreenLocalizations> {
  const _CategoryScreenLocalizationsDelegate();

  @override
  Future<CategoryScreenLocalizations> load(Locale locale) {
    return SynchronousFuture<CategoryScreenLocalizations>(lookupCategoryScreenLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_CategoryScreenLocalizationsDelegate old) => false;
}

CategoryScreenLocalizations lookupCategoryScreenLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return CategoryScreenLocalizationsEn();
  }

  throw FlutterError(
    'CategoryScreenLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
