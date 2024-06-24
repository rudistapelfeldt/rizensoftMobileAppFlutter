import 'dart:io';

import 'package:rizensoft_mobile_app_flutter/helpers/app_constants.dart';
import 'package:rizensoft_mobile_app_flutter/helpers/secure_storage_helper.dart';
import 'package:rizensoft_mobile_app_flutter/models/reminders/reminder_response.dart';
import 'package:http/http.dart' as http;

class RemindersService{
  String baseUrl;
  int port;
  String userId;

  SecureStorageHelper secureStorageHelper = SecureStorageHelper();

  RemindersService(this.baseUrl,this.port, this.userId);

  Future<ReminderResponse?> getAll() async {
    var path = '/reminder/${userId}/get';
     var uri = Uri.parse('${baseUrl}:${port}${path}');
    var httpClient = CustomClient(baseUrl);
    
    var response = await httpClient.post(uri,
        headers: {
          'Content-Type': 'application/json',
        },
        );
        
    if (response.statusCode == HttpStatus.ok) {
      return ReminderResponse(response.body, success: AppConstants.SUCCESS);
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