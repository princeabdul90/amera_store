/*
* Developer: Abubakar Abdullahi
* Date: 20/02/2023
*/

import 'package:equatable/equatable.dart';
import 'package:form_fields/form_fields.dart';

class Description extends FormzInput<String, DescriptionValidationError>
    with EquatableMixin {

  Description.unvalidated([
    String value = '',
  ]) : super.pure(value);

  Description.validated([
    String value = '',
  ]) : super.dirty(value);

  @override
  List<Object?> get props => [pure, value];

  @override
  DescriptionValidationError? validator(String value) {
    return value.isEmpty
        ? DescriptionValidationError.empty
        : DescriptionValidationError.invalid;
  }
}

enum DescriptionValidationError {
  empty,
  invalid,
}
