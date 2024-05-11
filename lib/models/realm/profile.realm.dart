// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Profile extends _Profile with RealmEntity, RealmObjectBase, RealmObject {
  Profile(
    int id, {
    String? passwordSalt,
    bool? active,
    String? addressId,
    String? firstName,
    String? lastName,
    String? userName,
    String? dateOfBirth,
    String? emailAddress,
    String? gender,
    String? password,
    String? confirmPassword,
    String? idNumber,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'passwordSalt', passwordSalt);
    RealmObjectBase.set(this, 'active', active);
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
  }

  Profile._();

  @override
  int get id => RealmObjectBase.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObjectBase.set(this, 'id', value);

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
  String? get addressId =>
      RealmObjectBase.get<String>(this, 'addressId') as String?;
  @override
  set addressId(String? value) => RealmObjectBase.set(this, 'addressId', value);

  @override
  String? get firstName =>
      RealmObjectBase.get<String>(this, 'firstName') as String?;
  @override
  set firstName(String? value) => RealmObjectBase.set(this, 'firstName', value);

  @override
  String? get lastName =>
      RealmObjectBase.get<String>(this, 'lastName') as String?;
  @override
  set lastName(String? value) => RealmObjectBase.set(this, 'lastName', value);

  @override
  String? get userName =>
      RealmObjectBase.get<String>(this, 'userName') as String?;
  @override
  set userName(String? value) => RealmObjectBase.set(this, 'userName', value);

  @override
  String? get dateOfBirth =>
      RealmObjectBase.get<String>(this, 'dateOfBirth') as String?;
  @override
  set dateOfBirth(String? value) =>
      RealmObjectBase.set(this, 'dateOfBirth', value);

  @override
  String? get emailAddress =>
      RealmObjectBase.get<String>(this, 'emailAddress') as String?;
  @override
  set emailAddress(String? value) =>
      RealmObjectBase.set(this, 'emailAddress', value);

  @override
  String? get gender => RealmObjectBase.get<String>(this, 'gender') as String?;
  @override
  set gender(String? value) => RealmObjectBase.set(this, 'gender', value);

  @override
  String? get password =>
      RealmObjectBase.get<String>(this, 'password') as String?;
  @override
  set password(String? value) => RealmObjectBase.set(this, 'password', value);

  @override
  String? get confirmPassword =>
      RealmObjectBase.get<String>(this, 'confirmPassword') as String?;
  @override
  set confirmPassword(String? value) =>
      RealmObjectBase.set(this, 'confirmPassword', value);

  @override
  String? get idNumber =>
      RealmObjectBase.get<String>(this, 'idNumber') as String?;
  @override
  set idNumber(String? value) => RealmObjectBase.set(this, 'idNumber', value);

  @override
  Stream<RealmObjectChanges<Profile>> get changes =>
      RealmObjectBase.getChanges<Profile>(this);

  @override
  Stream<RealmObjectChanges<Profile>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<Profile>(this, keyPaths);

  @override
  Profile freeze() => RealmObjectBase.freezeObject<Profile>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'passwordSalt': passwordSalt.toEJson(),
      'active': active.toEJson(),
      'addressId': addressId.toEJson(),
      'firstName': firstName.toEJson(),
      'lastName': lastName.toEJson(),
      'userName': userName.toEJson(),
      'dateOfBirth': dateOfBirth.toEJson(),
      'emailAddress': emailAddress.toEJson(),
      'gender': gender.toEJson(),
      'password': password.toEJson(),
      'confirmPassword': confirmPassword.toEJson(),
      'idNumber': idNumber.toEJson(),
    };
  }

  static EJsonValue _toEJson(Profile value) => value.toEJson();
  static Profile _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'passwordSalt': EJsonValue passwordSalt,
        'active': EJsonValue active,
        'addressId': EJsonValue addressId,
        'firstName': EJsonValue firstName,
        'lastName': EJsonValue lastName,
        'userName': EJsonValue userName,
        'dateOfBirth': EJsonValue dateOfBirth,
        'emailAddress': EJsonValue emailAddress,
        'gender': EJsonValue gender,
        'password': EJsonValue password,
        'confirmPassword': EJsonValue confirmPassword,
        'idNumber': EJsonValue idNumber,
      } =>
        Profile(
          fromEJson(id),
          passwordSalt: fromEJson(passwordSalt),
          active: fromEJson(active),
          addressId: fromEJson(addressId),
          firstName: fromEJson(firstName),
          lastName: fromEJson(lastName),
          userName: fromEJson(userName),
          dateOfBirth: fromEJson(dateOfBirth),
          emailAddress: fromEJson(emailAddress),
          gender: fromEJson(gender),
          password: fromEJson(password),
          confirmPassword: fromEJson(confirmPassword),
          idNumber: fromEJson(idNumber),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(Profile._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, Profile, 'Profile', [
      SchemaProperty('id', RealmPropertyType.int, primaryKey: true),
      SchemaProperty('passwordSalt', RealmPropertyType.string, optional: true),
      SchemaProperty('active', RealmPropertyType.bool, optional: true),
      SchemaProperty('addressId', RealmPropertyType.string, optional: true),
      SchemaProperty('firstName', RealmPropertyType.string, optional: true),
      SchemaProperty('lastName', RealmPropertyType.string, optional: true),
      SchemaProperty('userName', RealmPropertyType.string, optional: true),
      SchemaProperty('dateOfBirth', RealmPropertyType.string, optional: true),
      SchemaProperty('emailAddress', RealmPropertyType.string, optional: true),
      SchemaProperty('gender', RealmPropertyType.string, optional: true),
      SchemaProperty('password', RealmPropertyType.string, optional: true),
      SchemaProperty('confirmPassword', RealmPropertyType.string,
          optional: true),
      SchemaProperty('idNumber', RealmPropertyType.string, optional: true),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
