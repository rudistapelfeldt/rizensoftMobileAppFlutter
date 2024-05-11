// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_token.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class RefreshToken extends $RefreshToken
    with RealmEntity, RealmObjectBase, RealmObject {
  RefreshToken(
    int id,
    int userId,
    DateTime ts,
    DateTime expiryDate, {
    String? tokenHash,
    String? tokenSalt,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'tokenHash', tokenHash);
    RealmObjectBase.set(this, 'tokenSalt', tokenSalt);
    RealmObjectBase.set(this, 'userId', userId);
    RealmObjectBase.set(this, 'ts', ts);
    RealmObjectBase.set(this, 'expiryDate', expiryDate);
  }

  RefreshToken._();

  @override
  int get id => RealmObjectBase.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObjectBase.set(this, 'id', value);

  @override
  String? get tokenHash =>
      RealmObjectBase.get<String>(this, 'tokenHash') as String?;
  @override
  set tokenHash(String? value) => RealmObjectBase.set(this, 'tokenHash', value);

  @override
  String? get tokenSalt =>
      RealmObjectBase.get<String>(this, 'tokenSalt') as String?;
  @override
  set tokenSalt(String? value) => RealmObjectBase.set(this, 'tokenSalt', value);

  @override
  int get userId => RealmObjectBase.get<int>(this, 'userId') as int;
  @override
  set userId(int value) => RealmObjectBase.set(this, 'userId', value);

  @override
  DateTime get ts => RealmObjectBase.get<DateTime>(this, 'ts') as DateTime;
  @override
  set ts(DateTime value) => RealmObjectBase.set(this, 'ts', value);

  @override
  DateTime get expiryDate =>
      RealmObjectBase.get<DateTime>(this, 'expiryDate') as DateTime;
  @override
  set expiryDate(DateTime value) =>
      RealmObjectBase.set(this, 'expiryDate', value);

  @override
  Stream<RealmObjectChanges<RefreshToken>> get changes =>
      RealmObjectBase.getChanges<RefreshToken>(this);

  @override
  Stream<RealmObjectChanges<RefreshToken>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<RefreshToken>(this, keyPaths);

  @override
  RefreshToken freeze() => RealmObjectBase.freezeObject<RefreshToken>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'tokenHash': tokenHash.toEJson(),
      'tokenSalt': tokenSalt.toEJson(),
      'userId': userId.toEJson(),
      'ts': ts.toEJson(),
      'expiryDate': expiryDate.toEJson(),
    };
  }

  static EJsonValue _toEJson(RefreshToken value) => value.toEJson();
  static RefreshToken _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'tokenHash': EJsonValue tokenHash,
        'tokenSalt': EJsonValue tokenSalt,
        'userId': EJsonValue userId,
        'ts': EJsonValue ts,
        'expiryDate': EJsonValue expiryDate,
      } =>
        RefreshToken(
          fromEJson(id),
          fromEJson(userId),
          fromEJson(ts),
          fromEJson(expiryDate),
          tokenHash: fromEJson(tokenHash),
          tokenSalt: fromEJson(tokenSalt),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(RefreshToken._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, RefreshToken, 'RefreshToken', [
      SchemaProperty('id', RealmPropertyType.int, primaryKey: true),
      SchemaProperty('tokenHash', RealmPropertyType.string, optional: true),
      SchemaProperty('tokenSalt', RealmPropertyType.string, optional: true),
      SchemaProperty('userId', RealmPropertyType.int),
      SchemaProperty('ts', RealmPropertyType.timestamp),
      SchemaProperty('expiryDate', RealmPropertyType.timestamp),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
