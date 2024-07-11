import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:rizensoft_mobile_app_flutter/models/base_response.dart';
import 'package:rizensoft_mobile_app_flutter/models/realm/profile.dart';

@JsonSerializable()
class LoginResponse extends BaseResponse {
  Profile? profile() => getProfile();

  late String? accessToken;

  late Map<String, dynamic>? data;

  String? json;

  LoginResponse({required this.json, required super.success}) {
    data = jsonDecode(this.json!) as Map<String, dynamic>;

    accessToken = data!['accessToken'].toString();
  }

  Profile getProfile(){
    return ProfileJ.fromJson(data!['profile']);
  }
}
