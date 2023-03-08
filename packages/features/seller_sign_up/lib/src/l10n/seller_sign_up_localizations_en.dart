import 'seller_sign_up_localizations.dart';

/// The translations for English (`en`).
class SellerSignUpLocalizationsEn extends SellerSignUpLocalizations {
  SellerSignUpLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get invalidCredentialsErrorMessage => 'Invalid email and/or password.';

  @override
  String get appBarTitle => 'Sign Up';

  @override
  String get signUpButtonLabel => 'Sign Up';

  @override
  String get companynameTextFieldLabel => 'Company Name';

  @override
  String get companynameTextFieldEmptyErrorMessage => 'Your company name can\'t be empty.';

  @override
  String get companynameTextFieldInvalidErrorMessage => 'Your company must be 1-20 characters long and can only contain letters, numbers, and the underscore (_).';

  @override
  String get companynameTextFieldAlreadyTakenErrorMessage => 'This company is already taken.';

  @override
  String get emailTextFieldLabel => 'Email';

  @override
  String get emailTextFieldEmptyErrorMessage => 'Your email can\'t be empty.';

  @override
  String get emailTextFieldInvalidErrorMessage => 'This email is not valid.';

  @override
  String get emailTextFieldAlreadyRegisteredErrorMessage => 'This email is already registered.';

  @override
  String get passwordTextFieldLabel => 'Password';

  @override
  String get passwordTextFieldEmptyErrorMessage => 'Your password can\'t be empty.';

  @override
  String get passwordTextFieldInvalidErrorMessage => 'Password must be at least five characters long.';

  @override
  String get passwordConfirmationTextFieldLabel => 'Password Confirmation';

  @override
  String get passwordConfirmationTextFieldEmptyErrorMessage => 'Can\'t be empty.';

  @override
  String get passwordConfirmationTextFieldInvalidErrorMessage => 'Your passwords don\'t match.';

  @override
  String get imageUploadEmptyErrorMessage => 'Upload an image';

  @override
  String get imageUploadInvalidErrorMessage => 'Image file is invalid. (png, jpg)';

  @override
  String get allTextFieldEmptyErrorMessage => 'Please fill all fields';

  @override
  String get signInButtonLabel => 'Sign In';

  @override
  String get signInOpeningText => 'Already have an account?';
}
