/*
* Developer: Abubakar Abdullahi
* Date: 08/02/2023
*/

import 'package:firebase/src/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_up_customer_request_rm.g.dart';

@JsonSerializable(createFactory: false)
class SignUpCustomerRequestRM {
  const SignUpCustomerRequestRM({
    required this.user,
  });

  @JsonKey(name: 'customer')
  final CustomerInfoRM user;

  Map<String, dynamic> toJson() => _$SignUpCustomerRequestRMToJson(this);
}
