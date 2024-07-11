// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Profile _$ProfileFromJson(Map<String, dynamic> json) => _Profile()
  ..passwordSalt = json['passwordSalt'] as String?
  ..addressId = json['addressId'] as String?
  ..id = (json['id'] as num?)?.toInt()
  ..active = json['active'] as bool?
  ..gender = json['gender'] as String?
  ..addresses = (json['addresses'] as List<dynamic>)
      .map((e) => $Address.fromJson(e as Map<String, dynamic>))
      .toList()
  ..reminders = (json['reminders'] as List<dynamic>)
      .map((e) => $Reminder.fromJson(e as Map<String, dynamic>))
      .toList()
  ..firstName = json['firstName'] as String?
  ..lastName = json['lastName'] as String?
  ..userName = json['userName'] as String?
  ..dateOfBirth = json['dateOfBirth'] as String?
  ..emailAddress = json['emailAddress'] as String?
  ..password = json['password'] as String?
  ..confirmPassword = json['confirmPassword'] as String?
  ..idNumber = json['idNumber'] as String?;

Map<String, dynamic> _$ProfileToJson(_Profile instance) => <String, dynamic>{
      'passwordSalt': instance.passwordSalt,
      'addressId': instance.addressId,
      'id': instance.id,
      'active': instance.active,
      'gender': instance.gender,
      'addresses': instance.addresses,
      'reminders': instance.reminders,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'userName': instance.userName,
      'dateOfBirth': instance.dateOfBirth,
      'emailAddress': instance.emailAddress,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
      'idNumber': instance.idNumber,
    };
