// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

$Reminder _$$ReminderFromJson(Map<String, dynamic> json) => $Reminder()
  ..reminderName = json['reminderName'] as String
  ..reminderStart = DateTime.parse(json['reminderStart'] as String)
  ..isDismissed = json['isDismissed'] as bool
  ..isArchived = json['isArchived'] as bool;

Map<String, dynamic> _$$ReminderToJson($Reminder instance) => <String, dynamic>{
      'reminderName': instance.reminderName,
      'reminderStart': instance.reminderStart.toIso8601String(),
      'isDismissed': instance.isDismissed,
      'isArchived': instance.isArchived,
    };
