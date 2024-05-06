// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['passwordSalt'] as String?,
      json['addressId'] as String?,
      json['active'] as bool?,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      userName: json['userName'] as String,
      dateOfBirth: json['dateOfBirth'] as String,
      emailAddress: json['emailAddress'] as String,
      gender: json['gender'] as String,
      password: json['password'] as String,
      confirmPassword: json['confirmPassword'] as String,
      idNumber: json['idNumber'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'passwordSalt': instance.passwordSalt,
      'active': instance.active,
      'addressId': instance.addressId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'userName': instance.userName,
      'dateOfBirth': instance.dateOfBirth,
      'emailAddress': instance.emailAddress,
      'gender': instance.gender,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
      'idNumber': instance.idNumber,
    };
