// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class User extends _User with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  User(
    int id, {
    String? addressId = '',
    String firstName = '',
    String lastName = '',
    String userName = '',
    String dateOfBirth = '',
    String emailAddress = '',
    String gender = '',
    String password = '',
    String confirmPassword = '',
    String idNumber = '',
    String? passwordSalt = '',
    bool? active = false,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<User>({
        'id': 0,
        'addressId': '',
        'firstName': '',
        'lastName': '',
        'userName': '',
        'dateOfBirth': '',
        'emailAddress': '',
        'gender': '',
        'password': '',
        'confirmPassword': '',
        'idNumber': '',
        'passwordSalt': '',
        'active': false,
      });
    }
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'addressId', addressId);
    RealmObjectBase.set(this, 'firstName', firstName);
    RealmObjectBase.set(this, 'lastName', lastName);
    RealmObjectBase.set(this, 'userName', userName);
    RealmObjectBase.set(this, 'dateOfBirth', dateOfBirth);
    RealmObjectBase.set(this, 'emailAddress', emailAddress);
    RealmObjectBase.set(this, 'gender', gender);
    RealmObjectBase.set(this, 'password', password);
    RealmObjectBase.set(this, 'confirmPassword', confirmPassword);
    RealmObjectBase.set(this, 'idNumber', idNumber);
    RealmObjectBase.set(this, 'passwordSalt', passwordSalt);
    RealmObjectBase.set(this, 'active', active);
  }

  User._();

  @override
  int get id => RealmObjectBase.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObjectBase.set(this, 'id', value);

  @override
  String? get addressId =>
      RealmObjectBase.get<String>(this, 'addressId') as String?;
  @override
  set addressId(String? value) => RealmObjectBase.set(this, 'addressId', value);

  @override
  String get firstName =>
      RealmObjectBase.get<String>(this, 'firstName') as String;
  @override
  set firstName(String value) => RealmObjectBase.set(this, 'firstName', value);

  @override
  String get lastName =>
      RealmObjectBase.get<String>(this, 'lastName') as String;
  @override
  set lastName(String value) => RealmObjectBase.set(this, 'lastName', value);

  @override
  String get userName =>
      RealmObjectBase.get<String>(this, 'userName') as String;
  @override
  set userName(String value) => RealmObjectBase.set(this, 'userName', value);

  @override
  String get dateOfBirth =>
      RealmObjectBase.get<String>(this, 'dateOfBirth') as String;
  @override
  set dateOfBirth(String value) =>
      RealmObjectBase.set(this, 'dateOfBirth', value);

  @override
  String get emailAddress =>
      RealmObjectBase.get<String>(this, 'emailAddress') as String;
  @override
  set emailAddress(String value) =>
      RealmObjectBase.set(this, 'emailAddress', value);

  @override
  String get gender => RealmObjectBase.get<String>(this, 'gender') as String;
  @override
  set gender(String value) => RealmObjectBase.set(this, 'gender', value);

  @override
  String get password =>
      RealmObjectBase.get<String>(this, 'password') as String;
  @override
  set password(String value) => RealmObjectBase.set(this, 'password', value);

  @override
  String get confirmPassword =>
      RealmObjectBase.get<String>(this, 'confirmPassword') as String;
  @override
  set confirmPassword(String value) =>
      RealmObjectBase.set(this, 'confirmPassword', value);

  @override
  String get idNumber =>
      RealmObjectBase.get<String>(this, 'idNumber') as String;
  @override
  set idNumber(String value) => RealmObjectBase.set(this, 'idNumber', value);

  @override
  String? get passwordSalt =>
      RealmObjectBase.get<String>(this, 'passwordSalt') as String?;
  @override
  set passwordSalt(String? value) =>
      RealmObjectBase.set(this, 'passwordSalt', value);

  @override
  bool? get active => RealmObjectBase.get<bool>(this, 'active') as bool?;
  @override
  set active(bool? value) => RealmObjectBase.set(this, 'active', value);

  @override
  Stream<RealmObjectChanges<User>> get changes =>
      RealmObjectBase.getChanges<User>(this);

  @override
  User freeze() => RealmObjectBase.freezeObject<User>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(User._);
    return const SchemaObject(ObjectType.realmObject, User, 'User', [
      SchemaProperty('id', RealmPropertyType.int, primaryKey: true),
      SchemaProperty('addressId', RealmPropertyType.string, optional: true),
      SchemaProperty('firstName', RealmPropertyType.string),
      SchemaProperty('lastName', RealmPropertyType.string),
      SchemaProperty('userName', RealmPropertyType.string),
      SchemaProperty('dateOfBirth', RealmPropertyType.string),
      SchemaProperty('emailAddress', RealmPropertyType.string),
      SchemaProperty('gender', RealmPropertyType.string),
      SchemaProperty('password', RealmPropertyType.string),
      SchemaProperty('confirmPassword', RealmPropertyType.string),
      SchemaProperty('idNumber', RealmPropertyType.string),
      SchemaProperty('passwordSalt', RealmPropertyType.string, optional: true),
      SchemaProperty('active', RealmPropertyType.bool, optional: true),
    ]);
  }
}
