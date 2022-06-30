// To parse this JSON data, do
//
//     final synerLogin = synerLoginFromJson(jsonString);

import 'dart:convert';

SynerLogin synerLoginFromJson(String str) => SynerLogin.fromJson(json.decode(str));

String synerLoginToJson(SynerLogin data) => json.encode(data.toJson());

class SynerLogin {
  SynerLogin({
    this.statusCode,
    this.message,
    this.error,
    this.data,
  });

  int? statusCode;
  String? message;
  bool? error;
  Data? data;

  factory SynerLogin.fromJson(Map<String, dynamic> json) => SynerLogin(
    statusCode: json["StatusCode"] == null ? null : json["StatusCode"],
    message: json["Message"] == null ? null : json["Message"],
    error: json["Error"] == null ? null : json["Error"],
    data: json["Data"] == null ? null : Data.fromJson(json["Data"]),
  );

  Map<String, dynamic> toJson() => {
    "StatusCode": statusCode == null ? null : statusCode,
    "Message": message == null ? null : message,
    "Error": error == null ? null : error,
    "Data": data == null ? null : data!.toJson(),
  };
}

class Data {
  Data({
    this.userId,
    this.name,
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
    this.userType,
  });

  int? userId;
  String? name;
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userId: json["UserId"] == null ? null : json["UserId"],
    name: json["Name"] == null ? null : json["Name"],
    username: json["Username"] == null ? null : json["Username"],
    userRole: json["UserRole"] == null ? null : json["UserRole"],
    roleId: json["RoleId"] == null ? null : json["RoleId"],
    token: json["Token"] == null ? null : json["Token"],
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

  Map<String, dynamic> toJson() => {
    "UserId": userId == null ? null : userId,
    "Name": name == null ? null : name,
    "Username": username == null ? null : username,
    "UserRole": userRole == null ? null : userRole,
    "RoleId": roleId == null ? null : roleId,
    "Token": token == null ? null : token,
    "LocationCode": locationCode == null ? null : locationCode,
    "LocationName": locationName == null ? null : locationName,
    "ProvinceId": provinceId == null ? null : provinceId,
    "StoreTypeId": storeTypeId == null ? null : storeTypeId,
    "designation": designation == null ? null : designation,
    "provinceImage": provinceImage == null ? null : provinceImage,
    "provinceName": provinceName == null ? null : provinceName,
    "divsionId": divsionId == null ? null : divsionId,
    "districtId": districtId == null ? null : districtId,
    "tehsilId": tehsilId == null ? null : tehsilId,
    "ucId": ucId == null ? null : ucId,
    "userType": userType == null ? null : userType,
  };
}
