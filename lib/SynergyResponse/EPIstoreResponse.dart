// To parse this JSON data, do
//
//     final epiStoreState = epiStoreStateFromJson(jsonString);

import 'dart:convert';

EpiStoreState epiStoreStateFromJson(String str) => EpiStoreState.fromJson(json.decode(str));

String epiStoreStateToJson(EpiStoreState data) => json.encode(data.toJson());

class EpiStoreState {
  EpiStoreState({
    this.statusCode,
    this.message,
    this.error,
    this.storelist,
  });

  int? statusCode;
  String? message;
  bool? error;
  List<StoreType>? storelist;

  factory EpiStoreState.fromJson(Map<String, dynamic> json) => EpiStoreState(
    statusCode: json["StatusCode"] == null ? null : json["StatusCode"],
    message: json["Message"] == null ? null : json["Message"],
    error: json["Error"] == null ? null : json["Error"],
    storelist: json["List"] == null ? null : List<StoreType>.from(json["List"].map((x) => StoreType.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "StatusCode": statusCode == null ? null : statusCode,
    "Message": message == null ? null : message,
    "Error": error == null ? null : error,
    "List": storelist == null ? null : List<dynamic>.from(storelist!.map((x) => x.toJson())),
  };
}

class StoreType {
  StoreType({
    this.storeTypeId,
    this.name,
    this.isActive,
  });

  int? storeTypeId;
  String? name;
  bool? isActive;

  factory StoreType.fromJson(Map<String, dynamic> json) => StoreType(
    storeTypeId: json["StoreTypeId"] == null ? null : json["StoreTypeId"],
    name: json["Name"] == null ? null : json["Name"],
    isActive: json["IsActive"] == null ? null : json["IsActive"],
  );

  Map<String, dynamic> toJson() => {
    "StoreTypeId": storeTypeId == null ? null : storeTypeId,
    "Name": name == null ? null : name,
    "IsActive": isActive == null ? null : isActive,
  };
}
