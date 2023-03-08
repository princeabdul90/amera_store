/*
* Developer: Abubakar Abdullahi
* Date: 08/02/2023
*/

import 'package:json_annotation/json_annotation.dart';

part 'seller_info_rm.g.dart';

@JsonSerializable(createFactory: false)
class SellerInfoRM {
  const SellerInfoRM({
    required this.sid,
    required this.email,
    required this.password,
     this.address,
     this.phone,
    required this.company_name,
    required this.image_url,
     this.cover_photo,
  });

  @JsonKey(name: 'sid')
  final String sid;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'password')
  final String password;
  @JsonKey(name: 'address')
  final String? address;
  @JsonKey(name: 'phone')
  final String? phone;
  @JsonKey(name: 'company_name')
  final String company_name;
  @JsonKey(name: 'image_url')
  final String image_url;
  @JsonKey(name: 'cover_photo')
  final String? cover_photo;

  Map<String, dynamic> toJson() => _$SellerInfoRMToJson(this);

}
