import 'package:realm/realm.dart';
import 'package:rizensoft_mobile_app_flutter/models/realm/address.dart';
import 'package:rizensoft_mobile_app_flutter/models/realm/refresh_token.dart';
import 'package:rizensoft_mobile_app_flutter/models/realm/reminder.dart';

//part 'profile.realm.dart';

@RealmModel()
class _Profile{
  @PrimaryKey()
  late int id;

  late bool active;

  late String gender;

  late String? passwordSalt;

  late String? addressId;

  late List<Address>? addresses;

  late List<RefreshToken>? refreshTokens;

  late List<Reminder>? reminders;

  late String firstName;

  late String lastName;

  late String userName;

  late String dateOfBirth;

  late String emailAddress;

  late String password;

  late String confirmPassword;

  late String idNumber;
}
