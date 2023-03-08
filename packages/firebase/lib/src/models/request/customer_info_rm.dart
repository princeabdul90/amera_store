/*
* Developer: Abubakar Abdullahi
* Date: 08/02/2023
*/

import 'package:json_annotation/json_annotation.dart';

part 'customer_info_rm.g.dart';

@JsonSerializable(createFactory: false)
class CustomerInfoRM {
  const CustomerInfoRM({
    required this.cid,
    required this.name,
    required this.email,
     this.password,
     this.address,
     this.profile_image,
     this.phone_number
  });

  @JsonKey(name: 'cid')
  final String cid;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'password')
  final String? password;
  @JsonKey(name: 'address')
  final String? address;
  @JsonKey(name: 'profile_image')
  final String? profile_image;
  @JsonKey(name: 'phone_number')
  final String? phone_number;


  Map<String, dynamic> toJson() => _$CustomerInfoRMToJson(this);


}
