import 'package:realm/realm.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@RealmModel()
@JsonSerializable(createToJson: false)
class _User {
  @PrimaryKey()
  late int id = 0;

  late String? addressId = '';

  late String firstName = '';

  late String lastName = '';

  late String userName = '';

  late String dateOfBirth = '';

  late String emailAddress = '';

  late String gender = '';

  late String password = '';

  late String confirmPassword = '';

  late String? passwordSalt = '';

  late bool? active = false;

  User toRealmObject() => User(id,
      addressId: addressId,
      firstName: firstName,
      lastName: lastName,
      userName: userName,
      dateOfBirth: dateOfBirth,
      emailAddress: emailAddress,
      gender: gender,
      password: password,
      confirmPassword: confirmPassword,
      passwordSalt: passwordSalt,
      active: active);

  User fromJson(Map<String, dynamic> json) {
    return User(
      json['id'],
      addressId: json['addressId'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      userName: json['userName'],
      dateOfBirth: json['dateOfBirth'],
      emailAddress: json['emailAddress'],
      password: json['password'],
      confirmPassword: json['confirmPassword'],
      passwordSalt: json['passwordSalt'],
      active: json['active']
    ); // Replace this with the actual conversion logic
  }
}