// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefreshToken _$RefreshTokenFromJson(Map<String, dynamic> json) => RefreshToken(
      tokenHash: json['tokenHash'] as String?,
      tokenSalt: json['tokenSalt'] as String?,
      userId: (json['userId'] as num).toInt(),
      ts: DateTime.parse(json['ts'] as String),
      expiryDate: DateTime.parse(json['expiryDate'] as String),
    );

Map<String, dynamic> _$RefreshTokenToJson(RefreshToken instance) =>
    <String, dynamic>{
      'tokenHash': instance.tokenHash,
      'tokenSalt': instance.tokenSalt,
      'userId': instance.userId,
      'ts': instance.ts.toIso8601String(),
      'expiryDate': instance.expiryDate.toIso8601String(),
    };
