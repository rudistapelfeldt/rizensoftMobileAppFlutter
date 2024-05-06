import 'dart:convert';
import 'package:rizensoft_mobile_app_flutter/models/api/user.dart' as rizensoftUser;
import 'package:rizensoft_mobile_app_flutter/models/login/login_response.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

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
    }
    return null;
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
