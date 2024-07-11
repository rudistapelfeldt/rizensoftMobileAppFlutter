import 'dart:convert';
import 'dart:core';
import 'package:rizensoft_mobile_app_flutter/helpers/app_constants.dart';
import 'package:rizensoft_mobile_app_flutter/models/login/login_response.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:rizensoft_mobile_app_flutter/models/login/refresh_token_request.dart';
import 'package:rizensoft_mobile_app_flutter/models/login/token_response.dart';
import 'package:rizensoft_mobile_app_flutter/models/register/register_request.dart';
import 'package:rizensoft_mobile_app_flutter/models/register/register_response.dart';

class AuthenticationService {
  String baseUrl;
  int port;

  AuthenticationService(this.baseUrl,this.port);

  Future<LoginResponse?> login(String? emailAddress, String? password) async {
    var path = '/auth/login';
     var uri = Uri.parse('${baseUrl}${path}');
    var httpClient = CustomClient(baseUrl);
    
  
    Map jsonData = {
      'emailAddress': emailAddress,
      'password': password,
    };
   
    var response = await httpClient.post(uri,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(jsonData),
        
        );
        
    if (response.statusCode == HttpStatus.ok) {
      return LoginResponse(json: response.body, success: AppConstants.SUCCESS);
    }else{
      throw Exception(response.reasonPhrase);
    }
  }

  Future<RegisterResponse?> register(RegisterRequest request) async {
    var path = '/auth/register';
     var uri = Uri.parse('${baseUrl}${path}');
    var httpClient = CustomClient(baseUrl);
    
    var response = await httpClient.post(uri,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(request),
        );
        
    if (response.statusCode == HttpStatus.ok) {
      return RegisterResponse(json: response.body, success: AppConstants.SUCCESS);
    }else{
      throw Exception(response.reasonPhrase);
    }
  }

  Future<TokenResponse?> refreshToken(RefreshTokenRequest tokenRequest) async {
    var path = '/auth/refresh_token';
     var uri = Uri.parse('${baseUrl}:${port}${path}');
    var httpClient = CustomClient(baseUrl);
    
    Map jsonData = {
      'accessToken': tokenRequest.accessToken,
      'userId': tokenRequest.userId,
    };
   
    var response = await httpClient.post(uri,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(jsonData),
        );
        
    if (response.statusCode == HttpStatus.ok) {
      var data = jsonDecode(response.body) as Map<String, dynamic>;
      return TokenResponse(jsonDecode(data['accessToken']).toString(), jsonDecode(data['refreshToken']).toString(), success: true);
    }else{
      throw Exception(response.reasonPhrase);
    }
  }
}

class CustomClient extends http.BaseClient {
  bool Function(X509Certificate cert, String host, int port)?
      badCertificateCallback;

  CustomClient(String serverHost) {
    badCertificateCallback = (cert, host, port) {
      port = 7290;
      if (host.isEmpty || host == serverHost) {
        return true;
      }
      return false;
    };
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    return http.Client().send(request);
  }
}
