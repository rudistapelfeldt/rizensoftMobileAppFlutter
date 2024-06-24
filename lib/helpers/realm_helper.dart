import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:rizensoft_mobile_app_flutter/helpers/app_constants.dart';
import 'package:rizensoft_mobile_app_flutter/helpers/dialog_helper.dart';
import 'package:rizensoft_mobile_app_flutter/models/api/refresh_token.dart';
import 'package:rizensoft_mobile_app_flutter/models/realm/profile.dart';

class RealmHelper{
  Realm? realm;
  static Profile? existingProfile;
  static RefreshToken? existingToken;
  BuildContext context;

  RealmHelper(this.context, LocalConfiguration config){
    this.realm = realmInstance(config);
  }

  Realm realmInstance(LocalConfiguration config){
    return Realm(config);
  }

  //Profile
  void allProfiles() => realm!.all<Profile>();

  bool addProfile(Profile profile){
    try{
      realm?.write(() => realm?.add(profile, update: true));
      return true;
    }on Exception catch (exception){
      DialogHelper.displayAlert(context, AppConstants.dialog.error, exception.toString());
      return false;
    } 
  }

  void deleteProfile(Profile profile){
    realm?.write(() => realm?.delete(profile));
  }

  Profile findUserByKey(int key){
    var profileFound = realm?.find<Profile>(key);
    return profileFound!;
  }

  // void updateProfile(Profile profile){
  //   existingProfile = findUserByKey(profile.id);
  //   realm?.write(() {
  //     existingProfile = profile;
  //   });
  // }
}