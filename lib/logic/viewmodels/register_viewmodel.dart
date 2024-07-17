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
import 'package:rizensoft_mobile_app_flutter/models/realm/profile.dart';
import 'package:rizensoft_mobile_app_flutter/models/realm/reminder.dart';
import 'package:rizensoft_mobile_app_flutter/models/register/register_request.dart';
import 'package:rizensoft_mobile_app_flutter/models/routes.dart';
import 'package:rizensoft_mobile_app_flutter/services/authentication_service.dart';

class RegisterViewModel extends BaseViewModel {
  AuthenticationService _authenticationService =
      RepositoryHelper.globalAuthRepository;

  SecureStorageHelper secureStorageHelper = SecureStorageHelper();

  NavigationHelper navigationHelper = NavigationHelper();

  late Profile? profile;

  late Address? address;

  RealmHelper? realmHelper;

  RegisterViewModel(BuildContext context, {required this.profile, required this.address}){
    baseContext = context;
    realmHelper = RealmHelper(context, Configuration.local([Address.schema, Reminder.schema, Profile.schema]));
  }

  Future register() async{
    try{
      var response = await _authenticationService.register(RegisterRequest(registerProfile: this.profile));

      //Add access token to secure storage
      await addAccessToken(response!.accessToken);
      //Add the user's profile
      if (realmHelper!.addProfile(response.getProfile!)){
        DialogHelper.showToast(AppConstants.registerTexts.SUCCESSFUL, Toast.LENGTH_LONG, ToastGravity.BOTTOM, Theme.of(baseContext!).primaryColor, Theme.of(baseContext!).colorScheme.secondary, Theme.of(baseContext!).textTheme.displaySmall!.fontSize!);
        //navigate to dashboard
        await navigateToDashboard();
      }
    } on Exception catch (e) {
      DialogHelper.showToast(
        e.toString(), Toast.LENGTH_LONG, ToastGravity.BOTTOM, Theme.of(baseContext!).colorScheme.primary, Theme.of(baseContext!).colorScheme.secondary, Theme.of(baseContext!).textTheme.displaySmall!.fontSize!);
      return false;
    } finally{
      realmHelper!.realm!.close();
    }
  }

  Future navigateToDashboard() async {
    await NavigationHelper.navigateTo(route: PackageRoutes.dashboard.path);
  }

  Future addAccessToken(String token) async => 
    await secureStorageHelper.addNewItem(AppConstants.profileText.accessToken, token);
}