import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:realm/realm.dart';
import 'package:rizensoft_mobile_app_flutter/helpers/app_constants.dart';
import 'package:rizensoft_mobile_app_flutter/helpers/dialog_helper.dart';
import 'package:rizensoft_mobile_app_flutter/helpers/navigation_helper.dart';
import 'package:rizensoft_mobile_app_flutter/helpers/realm_helper.dart';
import 'package:rizensoft_mobile_app_flutter/helpers/repository_helper.dart';
import 'package:rizensoft_mobile_app_flutter/helpers/secure_storage_helper.dart';
import 'package:rizensoft_mobile_app_flutter/logic/viewmodels/base_viewmodel.dart';
import 'package:rizensoft_mobile_app_flutter/models/realm/address.dart';
import 'package:rizensoft_mobile_app_flutter/models/routes.dart';
import 'package:rizensoft_mobile_app_flutter/services/authentication_service.dart';
import 'package:rizensoft_mobile_app_flutter/models/realm/reminder.dart';
import 'dart:developer';

class LoginViewModel extends BaseViewModel {
  AuthenticationService _authenticationService =
      RepositoryHelper.globalAuthRepository;

  RealmHelper? realmHelper;

  bool isLoggingIn = false;

  NavigationHelper navigationHelper = NavigationHelper();

  SecureStorageHelper secureStorageHelper = SecureStorageHelper();

  String? emailAddress = '';

  String? password = '';

  LoginViewModel(BuildContext context, this.emailAddress, this.password) {
    baseContext = context;
    initRealm();
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

  void initRealm() {
    realmHelper = RealmHelper(
        baseContext!, Configuration.local([Address.schema, Reminder.schema]));
    realmHelper!.realm = realmHelper!
        .realmInstance(Configuration.local([Address.schema, Reminder.schema]));
  }

  Future login() async {
    try {
      isLoggingIn = true;
      var response =
          await _authenticationService.login(this.emailAddress, this.password);

      //Add access token to secure storage
      await addAccessToken(response!.accessToken!);

      //if realm is closed, open an instance
      if (realmHelper!.realm!.isClosed) {
        initRealm();
      }

      //Add the user's profile
      realmHelper!.addProfile(response.profile()!);
       
      DialogHelper.showToast(
          AppConstants.loginTexts.LOGGING_IN,
          Toast.LENGTH_LONG,
          ToastGravity.BOTTOM,
          Theme.of(baseContext!).primaryColor,
          Theme.of(baseContext!).colorScheme.secondary,
          Theme.of(baseContext!).textTheme.displaySmall!.fontSize!);
    } on StackOverflowError catch (e) {
      log('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ${e.stackTrace}');
      DialogHelper.showToast(
          e.toString(),
          Toast.LENGTH_LONG,
          ToastGravity.BOTTOM,
          Theme.of(baseContext!).colorScheme.primary,
          Theme.of(baseContext!).colorScheme.secondary,
          Theme.of(baseContext!).textTheme.displaySmall!.fontSize!);
    } finally {
      realmHelper!.realm!.close();
      isLoggingIn = false;
    }
  }

  Future navigateToRegistration() async {
    await NavigationHelper.navigateTo(route: PackageRoutes.register.path);
  }

  Future addAccessToken(String token) async => await secureStorageHelper
      .addNewItem(AppConstants.profileText.accessToken, token);
}
