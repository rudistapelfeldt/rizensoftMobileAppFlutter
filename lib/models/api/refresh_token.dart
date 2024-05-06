import 'package:json_annotation/json_annotation.dart';

part 'refresh_token.g.dart';

@JsonSerializable()
class RefreshToken {

  String? tokenHash;

  String? tokenSalt;

  int userId; 

  DateTime ts;

  DateTime expiryDate;

  RefreshToken ({
    this.tokenHash, 
    this.tokenSalt, 
    required this.userId,
    required this.ts,
    required this.expiryDate
  });

  factory RefreshToken.fromJson(Map<String, dynamic> json) => _$RefreshTokenFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshTokenToJson(this);
}