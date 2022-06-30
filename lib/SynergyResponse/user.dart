import 'package:json_annotation/json_annotation.dart';

import 'SynerLoginResponse.dart';
part 'user.g.dart';


@JsonSerializable()
class User {
  User({
    this.data,
  });

  Data? data;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
