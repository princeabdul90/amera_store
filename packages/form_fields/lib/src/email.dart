/*
* Developer: Abubakar Abdullahi
* Date: 09/02/2023
*/

import 'package:formz/formz.dart';
import 'package:equatable/equatable.dart';

class Email extends FormzInput<String, EmailValidatorError>
    with EquatableMixin {
  const Email.unvalidated([
    String value = '',
  ])  : isAlreadyRegistered = false,
        super.pure(value);

  const Email.validated(
    String value, {
    this.isAlreadyRegistered = false,
  }) : super.dirty(value);

  static final _emailRegex = RegExp(
    '^(([\\w-]+\\.)+[\\w-]+|([a-zA-Z]|[\\w-]{2,}))@((([0-1]?'
    '[0-9]{1,2}|25[0-5]|2[0-4][0-9])\\.([0-1]?[0-9]{1,2}|25[0-5]|2[0-4][0-9])\\.'
    '([0-1]?[0-9]{1,2}|25[0-5]|2[0-4][0-9])\\.([0-1]?[0-9]{1,2}|25[0-5]|2[0-4][0-9])'
    ')|([a-zA-Z]+[\\w-]+\\.)+[a-zA-Z]{2,4})\$',
  );

  final bool isAlreadyRegistered;

  @override
  EmailValidatorError? validator(String value) {
    return value.isEmpty
        ? EmailValidatorError.empty
        : (isAlreadyRegistered
            ? EmailValidatorError.alreadyRegistered
            : (_emailRegex.hasMatch(value)
                ? null
                : EmailValidatorError.invalid));
  }

  @override
  List<Object?> get props => [
        value,
        pure,
        isAlreadyRegistered,
      ];
}

enum EmailValidatorError { empty, invalid, alreadyRegistered }
