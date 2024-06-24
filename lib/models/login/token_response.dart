import 'package:rizensoft_mobile_app_flutter/models/base_response.dart';

class TokenResponse extends BaseResponse{

  String? accessToken;

  String? refreshToken;

  TokenResponse(this.accessToken, this.refreshToken, {required super.success});
}