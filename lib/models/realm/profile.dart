import 'package:json_annotation/json_annotation.dart';
import 'package:realm/realm.dart';
import 'package:rizensoft_mobile_app_flutter/models/realm/address.dart';
import 'package:rizensoft_mobile_app_flutter/models/realm/reminder.dart';
part 'profile.g.dart';
part 'profile.realm.dart';

@RealmModel()
@JsonSerializable(createToJson: true, )
class _Profile {

  String? passwordSalt;

  String? addressId;

  @PrimaryKey()
  late int? id;

  bool? active;

  String? gender;

  late List<$Address> addresses = List<$Address>.empty(growable: true);

  late List<$Reminder> reminders = List<$Reminder>.empty(growable: true);

  String? firstName;

  String? lastName;

  String? userName;

  String? dateOfBirth;

  String? emailAddress;

  String? password;

  String? confirmPassword;

  String? idNumber;
}


extension ProfileJ on Profile {
  static Profile? get instance => null;
  
  static Profile toRealmObject(_Profile profile) {
    return Profile(
      profile.id,
      passwordSalt: profile.passwordSalt,
      addressId: profile.addressId,
      active: profile.active,
      gender: profile.gender,
      addresses: (profile.addresses as List<Address>).map((e) => e.toRealmObject(e)).toList(),
      reminders: (profile.reminders as List<Reminder>).map((e) => e.toObject()).toList(),
      firstName: profile.firstName,
      lastName: profile.lastName,
      userName: profile.userName,
      dateOfBirth: profile.dateOfBirth,
      emailAddress: profile.emailAddress,
      password: profile.password,
      confirmPassword: profile.confirmPassword,
      idNumber: profile.idNumber
    );
  }
  static Profile fromJson(Map<String, dynamic> json) {
    var testobj =  _$ProfileFromJson(json);

    return toRealmObject(testobj);
  }}