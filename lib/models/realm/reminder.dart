import 'package:json_annotation/json_annotation.dart';
import 'package:realm/realm.dart';

part 'reminder.g.dart';
part 'reminder.realm.dart';

@RealmModel(ObjectType.embeddedObject)
@JsonSerializable(createToJson: true)
class $Reminder {
  static Reminder get instance => Reminder._();

  late String reminderName;

  late DateTime reminderStart;

  late bool isDismissed;

  late bool isArchived;

  $Reminder toRealmObject() => instance.toRealmObject();

  Reminder toObject() => instance;

  static $Reminder fromJson(Map<String, dynamic> json) => _$$ReminderFromJson(json).toRealmObject();
  Map<String, dynamic> toJson() => _$$ReminderToJson(this);
}

