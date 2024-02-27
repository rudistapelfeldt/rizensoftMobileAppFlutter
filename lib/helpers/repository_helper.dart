import 'package:rizensoft_mobile_app_flutter/services/authentication_service.dart';

class RepositoryHelper{
  static const String baseUrl = 'https://10.0.2.2:7290';

  static final AuthenticationService _globalAuthService = _createAuthRepository();
  static AuthenticationService get globalAuthRepository => _globalAuthService;

  static AuthenticationService _createAuthRepository() => AuthenticationService(baseUrl);
}