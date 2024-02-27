import 'package:rizensoft_mobile_app_flutter/models/login/login_response.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

class AuthenticationService{
  String baseUrl;

  AuthenticationService(this.baseUrl);

  Future<LoginResponse?> login(String? emailAddress, String? password) async{
    var uri = Uri.parse('$baseUrl/auth/login');
    var response = await http.post(uri, body: {'emailAddress': emailAddress, 'password': password});
    if (response.statusCode == HttpStatus.ok){
      return response.body as LoginResponse;
    }
    else{
      return null;
    }
  }
}