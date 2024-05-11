import 'dart:ffi';

class RefreshTokenRequest{
  String? accessToken;

  Int? userId;

  RefreshTokenRequest(this.accessToken, this.userId);

  RefreshTokenRequest.fromJsonUser(Map<String, dynamic> json) {
    accessToken = json['accessToken'].toString();
    userId = int.tryParse(json['userId'].toString()) as Int?;
  }
}