import 'package:json_annotation/json_annotation.dart';
import 'package:realm/realm.dart';

part 'refresh_token.g.dart';

@RealmModel()
@JsonSerializable()
class _RefreshToken {
  @PrimaryKey()
  int id = 0;

  int userId = 0; 

  late String? tokenHash;

  late String? tokenSalt;

  late DateTime ts;

  late DateTime expiryDate;

  //RefreshToken(this.tokenHash, this.tokenSalt, {required this.expiryDate, required this.id, required this.ts, required this.userId});

  // RefreshToken.fromJson(Map<String, dynamic> json)
  //     : id = json['id'],
  //       userId = json['userId'],
  //       tokenHash = json['tokenHash'],
  //       tokenSalt = json['tokenSalt'],
  //       ts = DateTime.parse(json['ts']),
  //       expiryDate = DateTime.parse(json['expiryDate']);

  //factory RefreshToken.fromJson(Map<String, dynamic> json) =>
  //    _$RefreshTokenFromJson(json);

  //Map<String, dynamic> toJson() => _$RefreshTokenToJson(this);
}