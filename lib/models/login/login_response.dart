import 'dart:convert';
import 'package:rizensoft_mobile_app_flutter/models/base_response.dart';
import 'package:rizensoft_mobile_app_flutter/models/realm/profile.dart';

class LoginResponse extends BaseResponse {

  late Profile profile;

  late String accessToken;

  String? json;

  LoginResponse(this.json, {required super.success}){
    Map<String, dynamic> data = jsonDecode(this.json!) as Map<String, dynamic>;
    profile =  $Profile.fromJson(data['profile'])!.instance;
    accessToken = data['accessToken'].toString();
  }
} 