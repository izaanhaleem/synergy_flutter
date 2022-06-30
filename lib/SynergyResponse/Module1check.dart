// To parse this JSON data, do
//
//     final module1CheckList = module1CheckListFromJson(jsonString);

import 'dart:convert';

Module1CheckList module1CheckListFromJson(String str) => Module1CheckList.fromJson(json.decode(str));

String module1CheckListToJson(Module1CheckList data) => json.encode(data.toJson());

class Module1CheckList {
  Module1CheckList({
    this.statusCode,
    this.message,
    this.error,
    this.data,
  });

  int? statusCode;
  String? message;
  bool? error;
  List<Datum>? data;

  factory Module1CheckList.fromJson(Map<String, dynamic> json) => Module1CheckList(
    statusCode: json["StatusCode"] == null ? null : json["StatusCode"],
    message: json["Message"] == null ? null : json["Message"],
    error: json["Error"] == null ? null : json["Error"],
    data: json["Data"] == null ? null : List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "StatusCode": statusCode == null ? null : statusCode,
    "Message": message == null ? null : message,
    "Error": error == null ? null : error,
    "Data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.srNo,
    this.appModuleTypeId,
    this.appModuleId,
    this.name,
    this.fieldType,
    this.sequenceNo,
    this.isActive,
    this.indicators,
  });

  int? srNo;
  int? appModuleTypeId;
  int? appModuleId;
  String? name;
  String? fieldType;
  int? sequenceNo;
  bool? isActive;
  List<Indicator>? indicators;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    srNo: json["SrNo"] == null ? null : json["SrNo"],
    appModuleTypeId: json["AppModuleTypeId"] == null ? null : json["AppModuleTypeId"],
    appModuleId: json["AppModuleId"] == null ? null : json["AppModuleId"],
    name: json["Name"] == null ? null : json["Name"],
    fieldType: json["FieldType"] == null ? null : json["FieldType"],
    sequenceNo: json["SequenceNo"] == null ? null : json["SequenceNo"],
    isActive: json["IsActive"] == null ? null : json["IsActive"],
    indicators: json["Indicators"] == null ? null : List<Indicator>.from(json["Indicators"].map((x) => Indicator.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "SrNo": srNo == null ? null : srNo,
    "AppModuleTypeId": appModuleTypeId == null ? null : appModuleTypeId,
    "AppModuleId": appModuleId == null ? null : appModuleId,
    "Name": name == null ? null : name,
    "FieldType": fieldType == null ? null : fieldType,
    "SequenceNo": sequenceNo == null ? null : sequenceNo,
    "IsActive": isActive == null ? null : isActive,
    "Indicators": indicators == null ? null : List<dynamic>.from(indicators!.map((x) => x.toJson())),
  };
}

class Indicator {
  Indicator({
    this.srNo,
    this.indicatorId,
    this.appModuleTypeId,
    this.indicatorParentId,
    this.showInCase,
    this.question,
    this.fieldType,
    this.sequenceNo,
    this.isOptional,
    this.isNaShow,
    this.isRemarksMandatory,
    this.isRemarksShow,
    this.showRemarksInCase,
    this.remarksPlaceHolderText,
    this.isActive,
    this.subIndicators,
  });

  String? srNo;
  int? indicatorId;
  int? appModuleTypeId;
  int? indicatorParentId;
  int? showInCase;
  String? question;
  FieldType? fieldType;
  int? sequenceNo;
  bool? isOptional;
  bool? isNaShow;
  bool? isRemarksMandatory;
  bool? isRemarksShow;
  int? showRemarksInCase;
  String? remarksPlaceHolderText;
  bool? isActive;
  List<Indicator>? subIndicators;

  factory Indicator.fromJson(Map<String, dynamic> json) => Indicator(
    srNo: json["SrNo"] == null ? null : json["SrNo"],
    indicatorId: json["IndicatorId"] == null ? null : json["IndicatorId"],
    appModuleTypeId: json["AppModuleTypeId"] == null ? null : json["AppModuleTypeId"],
    indicatorParentId: json["IndicatorParentId"] == null ? null : json["IndicatorParentId"],
    showInCase: json["ShowInCase"] == null ? null : json["ShowInCase"],
    question: json["Question"] == null ? null : json["Question"],
    fieldType: json["FieldType"] == null ? null : fieldTypeValues.map[json["FieldType"]],
    sequenceNo: json["SequenceNo"] == null ? null : json["SequenceNo"],
    isOptional: json["IsOptional"] == null ? null : json["IsOptional"],
    isNaShow: json["IsNAShow"] == null ? null : json["IsNAShow"],
    isRemarksMandatory: json["IsRemarksMandatory"] == null ? null : json["IsRemarksMandatory"],
    isRemarksShow: json["IsRemarksShow"] == null ? null : json["IsRemarksShow"],
    showRemarksInCase: json["ShowRemarksInCase"] == null ? null : json["ShowRemarksInCase"],
    remarksPlaceHolderText: json["RemarksPlaceHolderText"] == null ? null : json["RemarksPlaceHolderText"],
    isActive: json["IsActive"] == null ? null : json["IsActive"],
    subIndicators: json["SubIndicators"] == null ? null : List<Indicator>.from(json["SubIndicators"].map((x) => Indicator.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "SrNo": srNo == null ? null : srNo,
    "IndicatorId": indicatorId == null ? null : indicatorId,
    "AppModuleTypeId": appModuleTypeId == null ? null : appModuleTypeId,
    "IndicatorParentId": indicatorParentId == null ? null : indicatorParentId,
    "ShowInCase": showInCase == null ? null : showInCase,
    "Question": question == null ? null : question,
    "FieldType": fieldType == null ? null : fieldTypeValues.reverse[fieldType],
    "SequenceNo": sequenceNo == null ? null : sequenceNo,
    "IsOptional": isOptional == null ? null : isOptional,
    "IsNAShow": isNaShow == null ? null : isNaShow,
    "IsRemarksMandatory": isRemarksMandatory == null ? null : isRemarksMandatory,
    "IsRemarksShow": isRemarksShow == null ? null : isRemarksShow,
    "ShowRemarksInCase": showRemarksInCase == null ? null : showRemarksInCase,
    "RemarksPlaceHolderText": remarksPlaceHolderText == null ? null : remarksPlaceHolderText,
    "IsActive": isActive == null ? null : isActive,
    "SubIndicators": subIndicators == null ? null : List<dynamic>.from(subIndicators!.map((x) => x.toJson())),
  };
}

enum FieldType { RADIO_BUTTON, TEXTBOX }

final fieldTypeValues = EnumValues({
  "Radio Button": FieldType.RADIO_BUTTON,
  "Textbox": FieldType.TEXTBOX
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
