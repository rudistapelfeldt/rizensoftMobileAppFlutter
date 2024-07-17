import 'package:flutter/material.dart';
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
import 'package:rizensoft_mobile_app_flutter/services/reminders_service.dart';

class RemindersViewModel extends BaseViewModel{
  RemindersService? _remindersService;
 
  RealmHelper? realmHelper;

  NavigationHelper navigationHelper = NavigationHelper(); 

  SecureStorageHelper secureStorageHelper = SecureStorageHelper();

  RemindersViewModel(BuildContext context){
    baseContext = context;
    realmHelper = RealmHelper(context, Configuration.local([Address.schema, Reminder.schema, Profile.schema]));
    _remindersService = RepositoryHelper.createReminderRepository(realmHelper!.realm!.all<Profile>().first.id.toString());
  }

  Future<List<$Reminder>?> getReminders() async {
    try{
      var response = await _remindersService?.getAll();
      return response!.reminders;
    } on Exception catch(exception){
      DialogHelper.displayAlert(baseContext!, AppConstants.dialog.error, exception.toString());
      return null;
    }
  }
}