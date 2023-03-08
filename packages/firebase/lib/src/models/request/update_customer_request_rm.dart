/*
* Developer: Abubakar Abdullahi
* Date: 08/02/2023
*/

import 'package:firebase/src/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_customer_request_rm.g.dart';

@JsonSerializable(createFactory: false)
class UpdateCustomerRequestRM {
  const UpdateCustomerRequestRM({
    required this.user,
  });

  @JsonKey(name: 'customer')
  final CustomerInfoRM user;

  Map<String, dynamic> toJson() => _$UpdateCustomerRequestRMToJson(this);
}
