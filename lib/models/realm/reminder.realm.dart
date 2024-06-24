// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Reminder extends $Reminder
    with RealmEntity, RealmObjectBase, EmbeddedObject {
  Reminder(
    String reminderName,
    DateTime reminderStart,
    bool isDismissed,
    bool isArchived,
  ) {
    RealmObjectBase.set(this, 'reminderName', reminderName);
    RealmObjectBase.set(this, 'reminderStart', reminderStart);
    RealmObjectBase.set(this, 'isDismissed', isDismissed);
    RealmObjectBase.set(this, 'isArchived', isArchived);
  }

  Reminder._();

  @override
  String get reminderName =>
      RealmObjectBase.get<String>(this, 'reminderName') as String;
  @override
  set reminderName(String value) =>
      RealmObjectBase.set(this, 'reminderName', value);

  @override
  DateTime get reminderStart =>
      RealmObjectBase.get<DateTime>(this, 'reminderStart') as DateTime;
  @override
  set reminderStart(DateTime value) =>
      RealmObjectBase.set(this, 'reminderStart', value);

  @override
  bool get isDismissed =>
      RealmObjectBase.get<bool>(this, 'isDismissed') as bool;
  @override
  set isDismissed(bool value) =>
      RealmObjectBase.set(this, 'isDismissed', value);

  @override
  bool get isArchived => RealmObjectBase.get<bool>(this, 'isArchived') as bool;
  @override
  set isArchived(bool value) => RealmObjectBase.set(this, 'isArchived', value);

  @override
  Stream<RealmObjectChanges<Reminder>> get changes =>
      RealmObjectBase.getChanges<Reminder>(this);

  @override
  Stream<RealmObjectChanges<Reminder>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<Reminder>(this, keyPaths);

  @override
  Reminder freeze() => RealmObjectBase.freezeObject<Reminder>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'reminderName': reminderName.toEJson(),
      'reminderStart': reminderStart.toEJson(),
      'isDismissed': isDismissed.toEJson(),
      'isArchived': isArchived.toEJson(),
    };
  }

  static EJsonValue _toEJson(Reminder value) => value.toEJson();
  static Reminder _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'reminderName': EJsonValue reminderName,
        'reminderStart': EJsonValue reminderStart,
        'isDismissed': EJsonValue isDismissed,
        'isArchived': EJsonValue isArchived,
      } =>
        Reminder(
          fromEJson(reminderName),
          fromEJson(reminderStart),
          fromEJson(isDismissed),
          fromEJson(isArchived),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(Reminder._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.embeddedObject, Reminder, 'Reminder', [
      SchemaProperty('reminderName', RealmPropertyType.string),
      SchemaProperty('reminderStart', RealmPropertyType.timestamp),
      SchemaProperty('isDismissed', RealmPropertyType.bool),
      SchemaProperty('isArchived', RealmPropertyType.bool),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
