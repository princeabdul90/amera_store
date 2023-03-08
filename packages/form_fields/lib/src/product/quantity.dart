/*
* Developer: Abubakar Abdullahi
* Date: 20/02/2023
*/

import 'package:equatable/equatable.dart';
import 'package:form_fields/form_fields.dart';

class Quantity extends FormzInput<String, QuantityValidationError>
    with EquatableMixin {


  Quantity.unvalidated([
    value = '',
  ]) : super.pure(value);

  Quantity.validated([
    value = '',
  ]) : super.dirty(value);

  static final _quantityRegex = RegExp(r'^[1-9][0-9]*$');


  @override
  List<Object?> get props => [value, pure];

  @override
  QuantityValidationError? validator(String value) {
    return value.isEmpty
        ? QuantityValidationError.empty
        : (_quantityRegex.hasMatch(value)
          ? null
          : QuantityValidationError.invalid);
  }
}

enum QuantityValidationError {
  empty,
  invalid,
}
