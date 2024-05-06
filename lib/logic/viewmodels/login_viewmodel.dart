import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:rizensoft_mobile_app_flutter/helpers/repository_helper.dart';
import 'package:rizensoft_mobile_app_flutter/logic/viewmodels/base_viewmodel.dart';
import 'package:rizensoft_mobile_app_flutter/models/api/user.dart' as app_user;
import 'package:rizensoft_mobile_app_flutter/services/authentication_service.dart';

class LoginViewModel extends BaseViewModel {
  AuthenticationService _authenticationService =
      RepositoryHelper.globalAuthRepository;

  String? emailAddress = '';

  String? password = '';

  LoginViewModel(BuildContext context, this.emailAddress, this.password) {
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

  void setEmailText(String newValue) {
    emailAddress = newValue;
    notifyListeners();
  }

  void setPasswordText(String newValue) {
    password = newValue;
    notifyListeners();
  }


  Future<bool> login() async {
    // try {
    //   var config = Configuration.local([app_user.User.schema]);
    //   var realm = Realm(config);
    //   var response = await _authenticationService.login(this.emailAddress, this.password);
    //   if (response != null) {
    //     var user = response.user;
    //     realm.write<app_user.User>(
    //         () => realm.add((user as app_user.User).toRealmObject()));

    //     return true;
    //   }
    // } on Exception catch (e) {
    //   print(e.toString());
    //   return false;
    // }

    return false;
  }
}
