// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => UserInfo(
      userId: json["UserId"] == null ? null : json["UserId"],
      name: json["Name"] == null ? null : json["Name"],
      password: json["password"] == null ? null : json["password"],
      username: json["Username"] == null ? null : json["Username"],
      userRole: json["UserRole"] == null ? null : json["UserRole"],
      roleId: json["RoleId"] == null ? null : json["RoleId"],
      token: json["token"] == null ? null : json["token"],
      locationCode: json["LocationCode"] == null ? null : json["LocationCode"],
      locationName: json["LocationName"] == null ? null : json["LocationName"],
      provinceId: json["ProvinceId"] == null ? null : json["ProvinceId"],
      storeTypeId: json["StoreTypeId"] == null ? null : json["StoreTypeId"],
      designation: json["designation"] == null ? null : json["designation"],
      provinceImage: json["provinceImage"] == null ? null : json["provinceImage"],
      provinceName: json["provinceName"] == null ? null : json["provinceName"],
      divsionId: json["divsionId"] == null ? null : json["divsionId"],
      districtId: json["districtId"] == null ? null : json["districtId"],
      tehsilId: json["tehsilId"] == null ? null : json["tehsilId"],
      ucId: json["ucId"] == null ? null : json["ucId"],
      userType: json["userType"] == null ? null : json["userType"],
);

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'UserId': instance.userId,
      'userName': instance.username,
      'password': instance.password,
      'token': instance.token,
      'UserRole': instance.userRole,
      'RoleId': instance.roleId,
      'LocationCode': instance.locationCode,
      'LocationName': instance.locationName,
      'ProvinceId': instance.provinceId,
      'StoreTypeId': instance.storeTypeId,
      'designation': instance.designation,
      'provinceImage': instance.provinceImage,
      'provinceName' : instance.provinceName,
      'divsionId': instance.districtId,
      'districtId': instance.districtId,
      'tehsilId': instance.tehsilId,
      'ucId': instance.ucId,
      'userType': instance.userType
    };
