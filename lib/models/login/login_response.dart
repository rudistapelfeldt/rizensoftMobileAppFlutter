import 'package:rizensoft_mobile_app_flutter/models/base_response.dart';
import 'package:rizensoft_mobile_app_flutter/models/realm/profile.dart';

class LoginResponse extends BaseResponse {

  Profile? profile;

  String? accessToken;

  LoginResponse(this.profile, this.accessToken,{required super.success});

  LoginResponse.fromJsonUser(Map<String, dynamic> json) : super.fromJson(json) {
    profile = json['profile'];
    accessToken = json['accessToken'].toString();
    success = super.success;
  }
} 