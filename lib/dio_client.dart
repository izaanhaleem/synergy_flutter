// ignore_for_file: prefer_final_fields

import 'dart:convert';
import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:synergy_flutter/SynergyController/SynerListController.dart';
import 'package:synergy_flutter/SynergyResponse/EPIstoreResponse.dart';
import 'package:synergy_flutter/SynergyResponse/Module1check.dart';
import 'package:synergy_flutter/SynergyResponse/user.dart';

import 'SynergyResponse/ErrorResp.dart';
import 'SynergyResponse/ModuleResponse.dart';
import 'SynergyResponse/SynerLoginResponse.dart';
import 'SynergyResponse/user_info.dart';
import 'logging.dart';

class DioClient {
static ModuleListController moduleListController= Get.put(ModuleListController());
  static Dio _dio = Dio(
    BaseOptions(
      //baseUrl : "https://ams.pshealthpunjab.gov.pk",
      //baseUrl:    'https://hcms.pshealthpunjab.gov.pk/api/',
      baseUrl:        'https://sesapi.pshealthpunjab.gov.pk/api/',
      //baseUrl:        'http://172.16.20.99:50463/api/',
     // baseUrl:    'http://172.16.20.99:50463/api/',
      //baseUrl: 'https://evaccs.pshealthpunjab.gov.pk/api/',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),
  )
    ..interceptors.add(Logging());

   Future <SynerLogin?> createUser(String? username,String? password) async {
     SynerLogin? retrievedUser;
     Map<String, dynamic> jsonMap = {
       "username": "035002_250",
       "password": "R2ZWV6",
     };
      try {
        _dio.options.headers['content-Type'] = 'application/x-www-form-urlencoded';
        var response = await _dio.post(
          'UserAuthentication/UserLogin',
          data: jsonMap,
        );

        print('User created: ${response.data}');

        retrievedUser = SynerLogin.fromJson(response.data);

      } catch (e) {
        print('Error creating user: $e');
      }

      return retrievedUser;
  }

  static String? token;
   static int? moduleId;
  ModuleResponse? cmsProfile;
  List<AllModuleList>? cmsprofile = [];

  static Future<List<AllModuleList>> fetchAllModule(String bearer) async {
    SharedPreferences prefrences = await SharedPreferences.getInstance();
    token = prefrences.getString("Token");
    _dio.options.headers['content-Type'] = 'application/x-www-form-urlencoded';
    _dio.options.headers['Authorization']='Bearer $token';
    var response = await _dio.get('Profile/GetAppModules');

    if (response.statusCode == 200) {
      ModuleResponse res = ModuleResponse.fromJson(response.data);
      var allmoduleresponse = res.data!.toList();
      return allmoduleresponse;
    } else {
      throw Exception('Failed to load internet');
    }

  }

  static Module1CheckList? module1checkList;
  static List<Datum>? module1 = [];
 // Module1? module1;
  //static List<Indicator1>? indicators=[];
  static Future<List<Datum>?> fetchAllIndicators(int ModuleId) async {
    SharedPreferences prefrences = await SharedPreferences.getInstance();
    token = prefrences.getString("Token");
    _dio.options.headers['content-Type'] = 'application/x-www-form-urlencoded';
    _dio.options.headers['Authorization']='Bearer $token';
    var response = await _dio.get('Indicator/GetIndicatorsAsync?AppModuleId=$ModuleId');

    if (response.statusCode == 200) {
      Module1CheckList res = Module1CheckList.fromJson(response.data);
      module1= res.data?.toList();
      return module1;
    } else {
      throw Exception('Failed to load internet');
    }
  }


  Datum? module2;
  static List<Indicator>? checklist=[];
  static Future<List<List<Indicator>?>?> fetchAllIndicatorsCheckList(int ModuleId) async {
  SharedPreferences prefrences = await SharedPreferences.getInstance();
  token = prefrences.getString("Token");
  _dio.options.headers['content-Type'] = 'application/x-www-form-urlencoded';
  _dio.options.headers['Authorization']='Bearer $token';
  var response = await _dio.get('Indicator/GetIndicatorsAsync?AppModuleId=$ModuleId');
  if (response.statusCode == 200) {

    Module1CheckList res = Module1CheckList.fromJson(response.data);
     //checklist = Stream.fromIterable(module1!).asyncMap((indicator) => indicator.indicators).toList();
    //moduleListController.IndicatorsChecklist.value= res.module1checklist?.map((indicator) => indicator.indicators).toList(growable : true);
    var indicatorlist= res.data?.toList().map((element) => element.indicators).toList();
    //res.module1checklist?.map((element) => element.indicators).toList(growable : true);

    return indicatorlist;
  } else {
    throw Exception('Failed to load internet');
  }
}

  Future<UserInfo?> updateUser({
    required UserInfo userInfo,
    required String id,
  }) async {
    UserInfo? updatedUser;

    try {
      var response = await _dio.put(
        '/users/$id',
        data: userInfo.toJson(),
      );

      print('User updated: ${response.data}');

      updatedUser = UserInfo.fromJson(response.data);
    } catch (e) {
      print('Error updating user: $e');
    }

    return updatedUser;
  }

  Future<void> deleteUser({required String id}) async {
    try {
      await _dio.delete('/users/$id');
      print('User deleted!');
    } catch (e) {
      print('Error deleting user: $e');
    }
  }
}