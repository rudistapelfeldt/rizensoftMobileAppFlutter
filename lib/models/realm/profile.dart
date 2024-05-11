import 'package:realm/realm.dart';

part 'profile.realm.dart';

@RealmModel()
class _Profile {

  @PrimaryKey()
  late int id;

  late String? passwordSalt;

  late bool? active;

  late String? addressId;

  late String? firstName;

  late String? lastName;

  late String? userName;

  late String? dateOfBirth;

  late String? emailAddress;

  late String? gender;

  late String? password;

  late String? confirmPassword;

  late String? idNumber;
}
