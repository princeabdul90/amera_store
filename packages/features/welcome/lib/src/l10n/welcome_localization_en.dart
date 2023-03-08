import 'welcome_localization.dart';

/// The translations for English (`en`).
class WelcomeScreenLocalizationsEn extends WelcomeScreenLocalizations {
  WelcomeScreenLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get welcomePageTitle => 'Amera Store';

  @override
  String get customerTitle => 'Customer';

  @override
  String get sellerTitle => 'Sellers Only';

  @override
  String get customerSignInButtonLabel => 'Log In';

  @override
  String get customerSignUpButtonLabel => 'Sign Up';

  @override
  String get sellerSignInButtonLabel => 'Log In';

  @override
  String get sellerSignUpButtonLabel => 'Sign Up';

  @override
  String get googleSignInLabel => 'Google';

  @override
  String get facebookSignInLabel => 'Facebook';

  @override
  String get guestSignInLabel => 'Guest';

  @override
  String get buyAnimatedText => 'Buy';

  @override
  String get sellAnimatedText => 'Sell';

  @override
  String get browseAnimatedText => 'Browse';

  @override
  String get multiStoreAnimatedText => 'MultiStore';
}
