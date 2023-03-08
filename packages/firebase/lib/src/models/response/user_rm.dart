/*
* Developer: Abubakar Abdullahi
* Date: 08/02/2023
*/

import 'package:json_annotation/json_annotation.dart';

part 'user_rm.g.dart';

@JsonSerializable(createToJson: false)
class UserRM {
  const UserRM({
    required this.uid,
    required this.email,
  });

  @JsonKey(name: 'user_id')
  final String uid;
  @JsonKey(name: 'email')
  final String email;

  static const fromJson = _$UserRMFromJson;
}
