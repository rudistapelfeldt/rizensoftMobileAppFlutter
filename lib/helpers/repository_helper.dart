import 'package:rizensoft_mobile_app_flutter/services/authentication_service.dart';
import 'package:rizensoft_mobile_app_flutter/services/reminders_service.dart';

class RepositoryHelper{
  static const String baseUrl = 'https://10.0.2.2:5001';
  static const int port = 7290;
  static final AuthenticationService _globalAuthService = _createAuthRepository();
  static RemindersService globalReminderService(String userId) => createReminderRepository(userId);
  static AuthenticationService get globalAuthRepository => _globalAuthService;
  static AuthenticationService _createAuthRepository() => AuthenticationService(baseUrl, port);
  static RemindersService createReminderRepository(String userId) => RemindersService(baseUrl, port, userId);
}