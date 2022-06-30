// To parse this JSON data, do
//
//     final designationResponse = designationResponseFromJson(jsonString);

import 'dart:convert';

DesignationResponse designationResponseFromJson(String str) => DesignationResponse.fromJson(json.decode(str));

String designationResponseToJson(DesignationResponse data) => json.encode(data.toJson());

class DesignationResponse {
  DesignationResponse({
    this.statusCode,
    this.message,
    this.error,
    this.list,
  });

  int? statusCode;
  String? message;
  bool? error;
  List<ListElement>? list;

  factory DesignationResponse.fromJson(Map<String, dynamic> json) => DesignationResponse(
    statusCode: json["StatusCode"] == null ? null : json["StatusCode"],
    message: json["Message"] == null ? null : json["Message"],
    error: json["Error"] == null ? null : json["Error"],
    list: json["List"] == null ? null : List<ListElement>.from(json["List"].map((x) => ListElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "StatusCode": statusCode == null ? null : statusCode,
    "Message": message == null ? null : message,
    "Error": error == null ? null : error,
    "List": list == null ? null : List<dynamic>.from(list!.map((x) => x.toJson())),
  };
}

class ListElement {
  ListElement({
    this.designationId,
    this.designationName,
  });

  int? designationId;
  String? designationName;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    designationId: json["DesignationId"] == null ? null : json["DesignationId"],
    designationName: json["DesignationName"] == null ? null : json["DesignationName"],
  );

  Map<String, dynamic> toJson() => {
    "DesignationId": designationId == null ? null : designationId,
    "DesignationName": designationName == null ? null : designationName,
  };
}
