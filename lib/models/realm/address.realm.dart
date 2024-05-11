// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Address extends $Address with RealmEntity, RealmObjectBase, RealmObject {
  Address(
    int id,
    String addressLine1,
    String addressLine2,
    String suburb,
    String city,
    String province,
    String country,
    String postalCode, {
    String? addressId,
    String? addressName,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'addressId', addressId);
    RealmObjectBase.set(this, 'addressName', addressName);
    RealmObjectBase.set(this, 'addressLine1', addressLine1);
    RealmObjectBase.set(this, 'addressLine2', addressLine2);
    RealmObjectBase.set(this, 'suburb', suburb);
    RealmObjectBase.set(this, 'city', city);
    RealmObjectBase.set(this, 'province', province);
    RealmObjectBase.set(this, 'country', country);
    RealmObjectBase.set(this, 'postalCode', postalCode);
  }

  Address._();

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
  String? get addressName =>
      RealmObjectBase.get<String>(this, 'addressName') as String?;
  @override
  set addressName(String? value) =>
      RealmObjectBase.set(this, 'addressName', value);

  @override
  String get addressLine1 =>
      RealmObjectBase.get<String>(this, 'addressLine1') as String;
  @override
  set addressLine1(String value) =>
      RealmObjectBase.set(this, 'addressLine1', value);

  @override
  String get addressLine2 =>
      RealmObjectBase.get<String>(this, 'addressLine2') as String;
  @override
  set addressLine2(String value) =>
      RealmObjectBase.set(this, 'addressLine2', value);

  @override
  String get suburb => RealmObjectBase.get<String>(this, 'suburb') as String;
  @override
  set suburb(String value) => RealmObjectBase.set(this, 'suburb', value);

  @override
  String get city => RealmObjectBase.get<String>(this, 'city') as String;
  @override
  set city(String value) => RealmObjectBase.set(this, 'city', value);

  @override
  String get province =>
      RealmObjectBase.get<String>(this, 'province') as String;
  @override
  set province(String value) => RealmObjectBase.set(this, 'province', value);

  @override
  String get country => RealmObjectBase.get<String>(this, 'country') as String;
  @override
  set country(String value) => RealmObjectBase.set(this, 'country', value);

  @override
  String get postalCode =>
      RealmObjectBase.get<String>(this, 'postalCode') as String;
  @override
  set postalCode(String value) =>
      RealmObjectBase.set(this, 'postalCode', value);

  @override
  Stream<RealmObjectChanges<Address>> get changes =>
      RealmObjectBase.getChanges<Address>(this);

  @override
  Stream<RealmObjectChanges<Address>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<Address>(this, keyPaths);

  @override
  Address freeze() => RealmObjectBase.freezeObject<Address>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'addressId': addressId.toEJson(),
      'addressName': addressName.toEJson(),
      'addressLine1': addressLine1.toEJson(),
      'addressLine2': addressLine2.toEJson(),
      'suburb': suburb.toEJson(),
      'city': city.toEJson(),
      'province': province.toEJson(),
      'country': country.toEJson(),
      'postalCode': postalCode.toEJson(),
    };
  }

  static EJsonValue _toEJson(Address value) => value.toEJson();
  static Address _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'addressId': EJsonValue addressId,
        'addressName': EJsonValue addressName,
        'addressLine1': EJsonValue addressLine1,
        'addressLine2': EJsonValue addressLine2,
        'suburb': EJsonValue suburb,
        'city': EJsonValue city,
        'province': EJsonValue province,
        'country': EJsonValue country,
        'postalCode': EJsonValue postalCode,
      } =>
        Address(
          fromEJson(id),
          fromEJson(addressLine1),
          fromEJson(addressLine2),
          fromEJson(suburb),
          fromEJson(city),
          fromEJson(province),
          fromEJson(country),
          fromEJson(postalCode),
          addressId: fromEJson(addressId),
          addressName: fromEJson(addressName),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(Address._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, Address, 'Address', [
      SchemaProperty('id', RealmPropertyType.int, primaryKey: true),
      SchemaProperty('addressId', RealmPropertyType.string, optional: true),
      SchemaProperty('addressName', RealmPropertyType.string, optional: true),
      SchemaProperty('addressLine1', RealmPropertyType.string),
      SchemaProperty('addressLine2', RealmPropertyType.string),
      SchemaProperty('suburb', RealmPropertyType.string),
      SchemaProperty('city', RealmPropertyType.string),
      SchemaProperty('province', RealmPropertyType.string),
      SchemaProperty('country', RealmPropertyType.string),
      SchemaProperty('postalCode', RealmPropertyType.string),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
