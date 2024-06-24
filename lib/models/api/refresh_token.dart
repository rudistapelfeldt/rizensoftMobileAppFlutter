
class RefreshToken {

  late String tokenHash;

  late String tokenSalt;

  late int userId; 

  late DateTime ts;

  late DateTime expiryDate;

  RefreshToken(this.tokenHash, this.tokenSalt, this.userId, this.ts, this.expiryDate);

  RefreshToken toRealmObject() => RefreshToken(
    tokenHash,
    tokenSalt,
    userId,
    ts,
    expiryDate,
  );

  RefreshToken fromJson(Map<String, dynamic> json) {
    return RefreshToken(
      tokenHash = json['tokenHash'],
      tokenSalt = json['tokenSalt'],
      userId = json['userId'],
      ts = json['ts'],
      expiryDate = json['expiryDate'],
    ).toRealmObject();
  }
}