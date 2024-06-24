// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

$Address _$$AddressFromJson(Map<String, dynamic> json) => $Address()
  ..addressId = json['addressId'] as String
  ..addressName = json['addressName'] as String
  ..addressLine1 = json['addressLine1'] as String
  ..addressLine2 = json['addressLine2'] as String?
  ..suburb = json['suburb'] as String
  ..city = json['city'] as String
  ..province = json['province'] as String
  ..country = json['country'] as String
  ..postalCode = json['postalCode'] as String;

Map<String, dynamic> _$$AddressToJson($Address instance) => <String, dynamic>{
      'addressId': instance.addressId,
      'addressName': instance.addressName,
      'addressLine1': instance.addressLine1,
      'addressLine2': instance.addressLine2,
      'suburb': instance.suburb,
      'city': instance.city,
      'province': instance.province,
      'country': instance.country,
      'postalCode': instance.postalCode,
    };
