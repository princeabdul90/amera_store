/*
* Developer: Abubakar Abdullahi
* Date: 08/02/2023
*/

import 'package:firebase/src/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_up_seller_request_rm.g.dart';

@JsonSerializable(createFactory: false)
class SignUpSellerRequestRM {
  const SignUpSellerRequestRM({
    required this.user,
  });

  @JsonKey(name: 'seller')
  final SellerInfoRM user;

  Map<String, dynamic> toJson() => _$SignUpSellerRequestRMToJson(this);
}
