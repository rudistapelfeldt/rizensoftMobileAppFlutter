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

  List<$Address> addresses = [];

  List<$Reminder> reminders = [];

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
  static Profile toRealmObject(_Profile profile) {
    return Profile(
      profile.id,
      passwordSalt: profile.passwordSalt,
      addressId: profile.addressId,
      active: profile.active,
      gender: profile.gender,
      addresses: profile.addresses.map((e) => Address(e.addressId, e.addressName, e.addressLine1, e.suburb, e.city, e.province, e.country, e.postalCode)),
      reminders: profile.reminders.map((e) => Reminder(e.reminderName, e.reminderStart, e.isDismissed, e.isArchived)),
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

  static Profile fromJson(Map<String, dynamic> json) => toRealmObject(_$ProfileFromJson(json));
  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}