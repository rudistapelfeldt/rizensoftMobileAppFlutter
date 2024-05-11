import 'package:realm/realm.dart';

part 'reminder.realm.dart';

@RealmModel()
class _Reminder{
  @PrimaryKey()
  late int id;

  late String reminderName;

  late DateTime reminderStart;

  late bool isDismissed;

  late bool isArchived;
}