import 'package:realm/realm.dart';
import 'package:rizensoft_mobile_app_flutter/models/base_response.dart';

class LoginResponse extends BaseResponse {

  User? user;

  String? accessToken;

  LoginResponse(this.user, this.accessToken,{required super.success});

  LoginResponse.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    user = json['user'] != null ? json['user'] : null;
    accessToken = json['accessToken'] ?? '';
  }

  LoginResponse.fromJsonUser(Map<String, dynamic> json) : super.fromJson(json) {
    user = json['user'] != null ? json['user'] : null;
    accessToken = json['accessToken'] ?? '';
  }
}