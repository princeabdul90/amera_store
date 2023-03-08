/*
* Developer: Abubakar Abdullahi
* Date: 08/02/2023
*/

import 'package:firebase/src/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_seller_request_rm.g.dart';

@JsonSerializable(createFactory: false)
class UpdateSellerRequestRM {
  const UpdateSellerRequestRM({
    required this.user,
  });

  @JsonKey(name: 'seller')
  final CustomerInfoRM user;

  Map<String, dynamic> toJson() => _$UpdateSellerRequestRMToJson(this);
}
