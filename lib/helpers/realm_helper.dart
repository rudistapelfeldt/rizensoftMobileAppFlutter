import 'package:realm/realm.dart';
import 'package:rizensoft_mobile_app_flutter/models/realm/profile.dart';
import 'package:rizensoft_mobile_app_flutter/models/realm/refresh_token.dart';

class RealmHelper{
  Realm? realm;
  static late Profile existingProfile;
  static late RefreshToken existingToken;

  RealmHelper(LocalConfiguration config){
    this.realm = realmInstance(config);
  }

  Realm realmInstance(LocalConfiguration config){
    return Realm(config);
  }

  //Profile
  void allProfiles() => realm?.all<Profile>();

  void addProfile(Profile profile){
    realm?.write(() => realm?.add(profile, update: true));
  }

  void deleteProfile(Profile profile){
    realm?.write(() => realm?.delete(profile));
  }

  Profile findUserByKey(int key){
    var profileFound = realm?.find<Profile>(key);
    return profileFound!;
  }

  void updateProfile(Profile profile){
    existingProfile = findUserByKey(profile.id);
    realm?.write(() {
      existingProfile = profile;
    });
  }

  //RefreshToken
  void allTokens() => realm?.all<RefreshToken>();

  void addToken(RefreshToken token){
    realm?.write(() => realm?.add(token, update: true));
  }

  void deleteToken(RefreshToken token){
    realm?.write(() => realm?.delete(token));
  }

  RefreshToken findTokenByKey(int key){
    var tokenFound = realm?.find<RefreshToken>(key);
    return tokenFound!;
  }

  void updateToken(RefreshToken token){
    existingToken = findTokenByKey(token.id);
    realm?.write(() {
      existingToken = token;
    });
  }
}