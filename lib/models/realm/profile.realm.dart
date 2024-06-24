// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Profile extends $Profile with RealmEntity, RealmObjectBase, RealmObject {
  Profile(
    int? id, {
    String? passwordSalt,
    String? addressId,
    bool? active,
    String? gender,
    Iterable<Address> addresses = const [],
    Iterable<Reminder> reminders = const [],
    String? firstName,
    String? lastName,
    String? userName,
    String? dateOfBirth,
    String? emailAddress,
    String? password,
    String? confirmPassword,
    String? idNumber,
  }) {
    RealmObjectBase.set(this, 'passwordSalt', passwordSalt);
    RealmObjectBase.set(this, 'addressId', addressId);
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'active', active);
    RealmObjectBase.set(this, 'gender', gender);
    RealmObjectBase.set<RealmList<Address>>(
        this, 'addresses', RealmList<Address>(addresses));
    RealmObjectBase.set<RealmList<Reminder>>(
        this, 'reminders', RealmList<Reminder>(reminders));
    RealmObjectBase.set(this, 'firstName', firstName);
    RealmObjectBase.set(this, 'lastName', lastName);
    RealmObjectBase.set(this, 'userName', userName);
    RealmObjectBase.set(this, 'dateOfBirth', dateOfBirth);
    RealmObjectBase.set(this, 'emailAddress', emailAddress);
    RealmObjectBase.set(this, 'password', password);
    RealmObjectBase.set(this, 'confirmPassword', confirmPassword);
    RealmObjectBase.set(this, 'idNumber', idNumber);
  }

  Profile._();

  @override
  String? get passwordSalt =>
      RealmObjectBase.get<String>(this, 'passwordSalt') as String?;
  @override
  set passwordSalt(String? value) =>
      RealmObjectBase.set(this, 'passwordSalt', value);

  @override
  String? get addressId =>
      RealmObjectBase.get<String>(this, 'addressId') as String?;
  @override
  set addressId(String? value) => RealmObjectBase.set(this, 'addressId', value);

  @override
  int? get id => RealmObjectBase.get<int>(this, 'id') as int?;
  @override
  set id(int? value) => RealmObjectBase.set(this, 'id', value);

  @override
  bool? get active => RealmObjectBase.get<bool>(this, 'active') as bool?;
  @override
  set active(bool? value) => RealmObjectBase.set(this, 'active', value);

  @override
  String? get gender => RealmObjectBase.get<String>(this, 'gender') as String?;
  @override
  set gender(String? value) => RealmObjectBase.set(this, 'gender', value);

  @override
  RealmList<Address> get addresses =>
      RealmObjectBase.get<Address>(this, 'addresses') as RealmList<Address>;
  @override
  set addresses(covariant RealmList<Address> value) =>
      throw RealmUnsupportedSetError();

  @override
  RealmList<Reminder> get reminders =>
      RealmObjectBase.get<Reminder>(this, 'reminders') as RealmList<Reminder>;
  @override
  set reminders(covariant RealmList<Reminder> value) =>
      throw RealmUnsupportedSetError();

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
      'passwordSalt': passwordSalt.toEJson(),
      'addressId': addressId.toEJson(),
      'id': id.toEJson(),
      'active': active.toEJson(),
      'gender': gender.toEJson(),
      'addresses': addresses.toEJson(),
      'reminders': reminders.toEJson(),
      'firstName': firstName.toEJson(),
      'lastName': lastName.toEJson(),
      'userName': userName.toEJson(),
      'dateOfBirth': dateOfBirth.toEJson(),
      'emailAddress': emailAddress.toEJson(),
      'password': password.toEJson(),
      'confirmPassword': confirmPassword.toEJson(),
      'idNumber': idNumber.toEJson(),
    };
  }

  static EJsonValue _toEJson(Profile value) => value.toEJson();
  static Profile _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'passwordSalt': EJsonValue passwordSalt,
        'addressId': EJsonValue addressId,
        'id': EJsonValue id,
        'active': EJsonValue active,
        'gender': EJsonValue gender,
        'addresses': EJsonValue addresses,
        'reminders': EJsonValue reminders,
        'firstName': EJsonValue firstName,
        'lastName': EJsonValue lastName,
        'userName': EJsonValue userName,
        'dateOfBirth': EJsonValue dateOfBirth,
        'emailAddress': EJsonValue emailAddress,
        'password': EJsonValue password,
        'confirmPassword': EJsonValue confirmPassword,
        'idNumber': EJsonValue idNumber,
      } =>
        Profile(
          fromEJson(id),
          passwordSalt: fromEJson(passwordSalt),
          addressId: fromEJson(addressId),
          active: fromEJson(active),
          gender: fromEJson(gender),
          addresses: fromEJson(addresses),
          reminders: fromEJson(reminders),
          firstName: fromEJson(firstName),
          lastName: fromEJson(lastName),
          userName: fromEJson(userName),
          dateOfBirth: fromEJson(dateOfBirth),
          emailAddress: fromEJson(emailAddress),
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
      SchemaProperty('passwordSalt', RealmPropertyType.string, optional: true),
      SchemaProperty('addressId', RealmPropertyType.string, optional: true),
      SchemaProperty('id', RealmPropertyType.int,
          optional: true, primaryKey: true),
      SchemaProperty('active', RealmPropertyType.bool, optional: true),
      SchemaProperty('gender', RealmPropertyType.string, optional: true),
      SchemaProperty('addresses', RealmPropertyType.object,
          linkTarget: 'Address', collectionType: RealmCollectionType.list),
      SchemaProperty('reminders', RealmPropertyType.object,
          linkTarget: 'Reminder', collectionType: RealmCollectionType.list),
      SchemaProperty('firstName', RealmPropertyType.string, optional: true),
      SchemaProperty('lastName', RealmPropertyType.string, optional: true),
      SchemaProperty('userName', RealmPropertyType.string, optional: true),
      SchemaProperty('dateOfBirth', RealmPropertyType.string, optional: true),
      SchemaProperty('emailAddress', RealmPropertyType.string, optional: true),
      SchemaProperty('password', RealmPropertyType.string, optional: true),
      SchemaProperty('confirmPassword', RealmPropertyType.string,
          optional: true),
      SchemaProperty('idNumber', RealmPropertyType.string, optional: true),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
