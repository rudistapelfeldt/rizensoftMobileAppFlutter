import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:realm/realm.dart';
import 'package:rizensoft_mobile_app_flutter/helpers/app_constants.dart';
import 'package:rizensoft_mobile_app_flutter/helpers/dialog_helper.dart';
import 'package:rizensoft_mobile_app_flutter/helpers/realm_helper.dart';
import 'package:rizensoft_mobile_app_flutter/helpers/repository_helper.dart';
import 'package:rizensoft_mobile_app_flutter/helpers/secure_storage_helper.dart';
import 'package:rizensoft_mobile_app_flutter/logic/viewmodels/base_viewmodel.dart';
import 'package:rizensoft_mobile_app_flutter/models/realm/profile.dart';
import 'package:rizensoft_mobile_app_flutter/models/realm/refresh_token.dart';
import 'package:rizensoft_mobile_app_flutter/services/authentication_service.dart';

class LoginViewModel extends BaseViewModel {
  AuthenticationService _authenticationService =
      RepositoryHelper.globalAuthRepository;

  RealmHelper? realmHelper;

  SecureStorageHelper secureStorageHelper = SecureStorageHelper();

  String? emailAddress = '';

  String? password = '';

  LoginViewModel(BuildContext context, this.emailAddress, this.password) {
    baseContext = context;
    realmHelper = RealmHelper(Configuration.local([Profile.schema, RefreshToken.schema]));
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
    try {
      var response = await _authenticationService.login(this.emailAddress, this.password);
      if (response!.success) {
        var profile = response.profile;

        //Add access token to secure storage
        addAccessToken(response.accessToken!);
        //Add the user's profile
        realmHelper!.addProfile(profile!);
        DialogHelper.showToast(AppConstants.LOGGING_IN, Toast.LENGTH_LONG, ToastGravity.BOTTOM, Theme.of(baseContext!).primaryColor, Theme.of(baseContext!).colorScheme.secondary, Theme.of(baseContext!).textTheme.displaySmall!.fontSize!);
        return true;
      }else{
        DialogHelper.showToast(response.error!, Toast.LENGTH_LONG, ToastGravity.BOTTOM, Theme.of(baseContext!).colorScheme.errorContainer, Theme.of(baseContext!).colorScheme.error, Theme.of(baseContext!).textTheme.displaySmall!.fontSize!);
        return false;
      }
    } on Exception catch (e) {
      DialogHelper.showToast(
        e.toString(), Toast.LENGTH_LONG, ToastGravity.BOTTOM, Theme.of(baseContext!).colorScheme.primary, Theme.of(baseContext!).colorScheme.secondary, Theme.of(baseContext!).textTheme.displaySmall!.fontSize!);
      return false;
    } finally{
      realmHelper!.realm!.close();
    }
  }

  void addAccessToken(String token){
    secureStorageHelper.addNewItem(AppConstants.ACCESS_TOKEN, token);
  }
}
