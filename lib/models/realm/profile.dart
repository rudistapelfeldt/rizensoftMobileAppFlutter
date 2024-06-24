import 'package:json_annotation/json_annotation.dart';
import 'package:realm/realm.dart';
import 'package:rizensoft_mobile_app_flutter/models/realm/address.dart';
import 'package:rizensoft_mobile_app_flutter/models/realm/reminder.dart';
part 'profile.g.dart';
part 'profile.realm.dart';

@RealmModel()
@JsonSerializable(createToJson: true, )
class $Profile {
  Profile get instance=> Profile._();
      
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

  static $Profile? fromJson(Map<String, dynamic> json)  => _$$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$$ProfileToJson(this);

}