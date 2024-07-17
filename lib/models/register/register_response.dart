import 'dart:convert';

import 'package:rizensoft_mobile_app_flutter/models/base_response.dart';
import 'package:rizensoft_mobile_app_flutter/models/realm/profile.dart';

class RegisterResponse extends BaseResponse{

  Profile? get getProfile => profile;

  late Profile? profile;

  late String accessToken;

  late String? json;

  late Map<String, dynamic> data;

  RegisterResponse({required this.json,required super.success, required this.profile}){
    data = jsonDecode(this.json!) as Map<String, dynamic>;
    accessToken = data['accessToken'].toString();
  }
}