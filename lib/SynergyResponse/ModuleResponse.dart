// To parse this JSON data, do
//
//     final moduleResponse = moduleResponseFromJson(jsonString);

import 'dart:convert';

ModuleResponse moduleResponseFromJson(String str) => ModuleResponse.fromJson(json.decode(str));

String moduleResponseToJson(ModuleResponse data) => json.encode(data.toJson());

class ModuleResponse {
  ModuleResponse({
    this.statusCode,
    this.message,
    this.error,
    this.data,
  });

  int? statusCode;
  String? message;
  bool? error;
  List<AllModuleList>? data;

  factory ModuleResponse.fromJson(Map<String, dynamic> json) => ModuleResponse(
    statusCode: json["StatusCode"] == null ? null : json["StatusCode"],
    message: json["Message"] == null ? null : json["Message"],
    error: json["Error"] == null ? null : json["Error"],
    data: json["Data"] == null ? null : List<AllModuleList>.from(json["Data"].map((x) => AllModuleList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "StatusCode": statusCode == null ? null : statusCode,
    "Message": message == null ? null : message,
    "Error": error == null ? null : error,
    "Data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class AllModuleList {
  AllModuleList({
    this.appModuleId,
    this.appModuleName,
    this.isActive,
  });

  int? appModuleId;
  String? appModuleName;
  bool? isActive;

  factory AllModuleList.fromJson(Map<String, dynamic> json) => AllModuleList(
    appModuleId: json["AppModuleId"] == null ? null : json["AppModuleId"],
    appModuleName: json["AppModuleName"] == null ? null : json["AppModuleName"],
    isActive: json["IsActive"] == null ? null : json["IsActive"],
  );

  Map<String, dynamic> toJson() => {
    "AppModuleId": appModuleId == null ? null : appModuleId,
    "AppModuleName": appModuleName == null ? null : appModuleName,
    "IsActive": isActive == null ? null : isActive,
  };
}
