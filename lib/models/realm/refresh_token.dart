import 'package:realm/realm.dart';

part 'refresh_token.realm.dart';

@RealmModel()
class $RefreshToken {
  @PrimaryKey()
  late int id;

  late String? tokenHash;

  late String? tokenSalt;

  late int userId; 

  late DateTime ts;

  late DateTime expiryDate;
}