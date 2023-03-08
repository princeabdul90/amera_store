/*
* Developer: Abubakar Abdullahi
* Date: 08/02/2023
*/

import 'package:json_annotation/json_annotation.dart';

part 'user_credentials_rm.g.dart';

@JsonSerializable(createFactory: false)
class UserCredentialsRM {
  const UserCredentialsRM({
    required this.email,
    required this.password,
});

  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'password')
  final String password;

  Map<String, dynamic> toJson() => _$UserCredentialsRMToJson(this);

}