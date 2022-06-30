import 'package:json_annotation/json_annotation.dart';

import 'SynerLoginResponse.dart';
part 'user_info.g.dart';

@JsonSerializable(explicitToJson: true)
class UserInfo {
  int? userId;
  String? name;
  String? password;
  String? username;
  String? userRole;
  int? roleId;
  String? token;
  String? locationCode;
  String? locationName;
  int? provinceId;
  int? storeTypeId;
  String? designation;
  String? provinceImage;
  String? provinceName;
  String? divsionId;
  String? districtId;
  String? tehsilId;
  String? ucId;
  String? userType;
  Data? data;


  UserInfo({
    this.userId,
    this.name,
    this.password,
    this.username,
    this.userRole,
    this.roleId,
    this.token,
    this.locationCode,
    this.locationName,
    this.provinceId,
    this.storeTypeId,
    this.designation,
    this.provinceImage,
    this.provinceName,
    this.divsionId,
    this.districtId,
    this.tehsilId,
    this.ucId,
    this.userType

  });

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
}
