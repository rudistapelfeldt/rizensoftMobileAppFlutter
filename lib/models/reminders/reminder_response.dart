import 'dart:convert';
import 'package:rizensoft_mobile_app_flutter/models/base_response.dart';
import 'package:rizensoft_mobile_app_flutter/models/realm/reminder.dart';

class ReminderResponse extends BaseResponse{
  List<$Reminder> reminders = [];

  String? json;

  ReminderResponse(this.json, {required super.success}){
    Map<String, dynamic> data = jsonDecode(this.json!) as Map<String, dynamic>;
    reminders = List<$Reminder>.from(data['reminders'].map((model)=> $Reminder.fromJson(model)));
  }
}