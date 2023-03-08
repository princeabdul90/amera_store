/*
* Developer: Abubakar Abdullahi
* Date: 20/02/2023
*/

import 'package:equatable/equatable.dart';
import 'package:form_fields/form_fields.dart';

class Price extends FormzInput<String, PriceValidationError>
    with EquatableMixin {

  const Price.unvalidated([
    String value = '',
  ]) : super.pure(value);

  const Price.validated([
    String value = '',
  ]) : super.dirty(value);

  static final _priceRegex =
      RegExp(r'^((([1-9][0-9]*[\\.]*)||([0][\\.]*))([0-9]{1,2}))$');

  @override
  List<Object?> get props => [pure, value];

  @override
  PriceValidationError? validator(String value) {
    return value.isEmpty
        ? PriceValidationError.empty
        : (_priceRegex.hasMatch(value) ? null : PriceValidationError.invalid);
  }
}

enum PriceValidationError { empty, invalid }
