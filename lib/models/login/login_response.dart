import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:rizensoft_mobile_app_flutter/models/base_response.dart';
import 'package:rizensoft_mobile_app_flutter/models/realm/profile.dart';

@JsonSerializable()
class LoginResponse extends BaseResponse {

  late String? accessToken;

  late Profile? profile;

  static String json ='';

  static Map<String, dynamic> get data => jsonDecode(getJson()) as Map<String, dynamic>;

    LoginResponse(String? jsonString, {required super.success}) {
      json = LoginResponse.getJson();
      accessToken = data['accessToken'].toString();
      profile = ProfileJ.fromJson((data['profile'] as Map<String, dynamic>));
    }

    static String getJson() => json;

}
