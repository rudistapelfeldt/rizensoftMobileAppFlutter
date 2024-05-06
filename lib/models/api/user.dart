import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {

  String? passwordSalt;

  bool? active;

  String? addressId;

  String firstName;

  String lastName;

  String userName;

  String dateOfBirth;

  String emailAddress;

  String gender;

  String password;

  String confirmPassword;

  String idNumber;

  User (
    this.passwordSalt,
    this.addressId, 
    this.active,{
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.dateOfBirth,
    required this.emailAddress,
    required this.gender,
    required this.password,
    required this.confirmPassword,
    required this.idNumber,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
