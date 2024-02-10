import 'package:flutter/material.dart';
import 'package:rizensoft_mobile_app_flutter/logic/viewmodels/base_viewmodel.dart';

class LoginViewModel extends BaseViewModel {

  String? emailAddress;

  String? password;

  LoginViewModel(BuildContext context) {
    baseContext = context;
  }

  Future<bool> login(String email, String password) async {
    // setState(ViewState.Busy);
    // var success = await _authenticationService.login(email, password);
    // setState(ViewState.Idle);
    return false;
  }
}