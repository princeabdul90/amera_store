/*
* Developer: Abubakar Abdullahi
* Date: 20/02/2023
*/

import 'package:equatable/equatable.dart';
import 'package:form_fields/form_fields.dart';

class ProductName extends FormzInput<String, ProductNameValidationError> with EquatableMixin {
  const ProductName.unvalidated([
    String value = ''
  ]): super.pure(value);

  const ProductName.validated([
    String value = '',
  ]): super.dirty(value);


  @override
  List<Object?> get props => [pure, value];

  @override
 ProductNameValidationError? validator(String value) {
    return value.isEmpty
        ? ProductNameValidationError.empty
        : ProductNameValidationError.invalid;
  }

}

enum ProductNameValidationError {
  empty, invalid,
}