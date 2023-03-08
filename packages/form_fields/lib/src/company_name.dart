/*
* Developer: Abubakar Abdullahi
* Date: 09/02/2023
*/

import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class CompanyName extends FormzInput<String, CompanyNameValidationError>
    with EquatableMixin {
  const CompanyName.unvalidated([
    String value = '',
  ])  : isAlreadyRegistered = false,
        super.pure(value);

  const CompanyName.validated(
    String value, {
    this.isAlreadyRegistered = false,
  }) : super.dirty(value);

  static final _companyNameRegex = RegExp(
    r'^(?=.{1,20}$)(?![_])(?!.*[_.]{2})[a-zA-Z0-9_]+(?<![_])$',
  );

  final bool isAlreadyRegistered;

  @override
  CompanyNameValidationError? validator(String value) {
    return value.isEmpty
        ? CompanyNameValidationError.empty
        : (isAlreadyRegistered
            ? CompanyNameValidationError.alreadyTaken
            : (_companyNameRegex.hasMatch(value)
                ? null
                : CompanyNameValidationError.invalid));
  }

  @override
  List<Object?> get props => [
        value,
        pure,
        isAlreadyRegistered,
      ];
}

enum CompanyNameValidationError {
  empty,
  invalid,
  alreadyTaken,
}
