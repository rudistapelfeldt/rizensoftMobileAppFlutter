// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_token.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class RefreshToken extends _RefreshToken
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  RefreshToken(
    int id,
    DateTime ts,
    DateTime expiryDate, {
    int userId = 0,
    String? tokenHash,
    String? tokenSalt,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<RefreshToken>({
        'id': 0,
        'userId': 0,
      });
    }
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'userId', userId);
    RealmObjectBase.set(this, 'tokenHash', tokenHash);
    RealmObjectBase.set(this, 'tokenSalt', tokenSalt);
    RealmObjectBase.set(this, 'ts', ts);
    RealmObjectBase.set(this, 'expiryDate', expiryDate);
  }

  RefreshToken._();

  @override
  int get id => RealmObjectBase.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObjectBase.set(this, 'id', value);

  @override
  int get userId => RealmObjectBase.get<int>(this, 'userId') as int;
  @override
  set userId(int value) => RealmObjectBase.set(this, 'userId', value);

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
  RefreshToken freeze() => RealmObjectBase.freezeObject<RefreshToken>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(RefreshToken._);
    return const SchemaObject(
        ObjectType.realmObject, RefreshToken, 'RefreshToken', [
      SchemaProperty('id', RealmPropertyType.int, primaryKey: true),
      SchemaProperty('userId', RealmPropertyType.int),
      SchemaProperty('tokenHash', RealmPropertyType.string, optional: true),
      SchemaProperty('tokenSalt', RealmPropertyType.string, optional: true),
      SchemaProperty('ts', RealmPropertyType.timestamp),
      SchemaProperty('expiryDate', RealmPropertyType.timestamp),
    ]);
  }
}
