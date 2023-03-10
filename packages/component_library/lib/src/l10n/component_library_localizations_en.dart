import 'component_library_localizations.dart';

/// The translations for English (`en`).
class ComponentLibraryLocalizationsEn extends ComponentLibraryLocalizations {
  ComponentLibraryLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get exceptionIndicatorGenericTitle => 'Something went wrong';

  @override
  String get exceptionIndicatorTryAgainButton => 'Try Again';

  @override
  String get exceptionIndicatorGenericMessage => 'There has been an error.\nPlease, check your internet connection and try again later.';

  @override
  String get genericErrorSnackbarMessage => 'There has been an error. Please, check your internet connection.';

  @override
  String get authenticationRequiredErrorSnackbarMessage => 'You need to sign in before performing this action.';
}
