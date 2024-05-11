import 'dart:convert';
import 'package:rizensoft_mobile_app_flutter/models/login/login_response.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:rizensoft_mobile_app_flutter/models/login/refresh_token_request.dart';
import 'package:rizensoft_mobile_app_flutter/models/login/token_response.dart';

class AuthenticationService {
  String baseUrl;
  int port;

  AuthenticationService(this.baseUrl,this.port);

  Future<LoginResponse?> login(String? emailAddress, String? password) async {
    var path = '/auth/login';
     var uri = Uri.parse('${baseUrl}:${port}${path}');
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
      var data = jsonDecode(response.body);
      return LoginResponse.fromJsonUser(data);
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
      var data = jsonDecode(response.body);
      return TokenResponse.fromJsonUser(data);
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
