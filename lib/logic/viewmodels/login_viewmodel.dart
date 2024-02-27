import 'package:flutter/material.dart';
import 'package:rizensoft_mobile_app_flutter/helpers/repository_helper.dart';
import 'package:rizensoft_mobile_app_flutter/logic/viewmodels/base_viewmodel.dart';
import 'package:rizensoft_mobile_app_flutter/services/authentication_service.dart';

class LoginViewModel extends BaseViewModel {
  AuthenticationService _authenticationService = RepositoryHelper.globalAuthRepository;

  String? emailAddress;

  String? password;

  LoginViewModel(BuildContext context) {
    baseContext = context;
  }

  Future<String> validatePassword(String? value) async {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    
    return '';
  }

  Future<String> validateEmailAddress(String? value) async {
    if (value == null || value.isEmpty || !value.contains('@')) {
      return 'Please enter an email address';
    }
    
    return '';
  }

  Future<bool> login() async {
    var response = await _authenticationService.login(emailAddress, password);
    if (response != null) {
      var user = response.user;
      
      return true;
    }
    
    return false;
  }
}