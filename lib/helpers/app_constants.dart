import 'package:rizensoft_mobile_app_flutter/models/dialog.dart';
import 'package:rizensoft_mobile_app_flutter/models/dimensions.dart';
import 'package:rizensoft_mobile_app_flutter/models/font_size.dart';
import 'package:rizensoft_mobile_app_flutter/models/layout.dart';
import 'package:rizensoft_mobile_app_flutter/models/login_texts.dart';
import 'package:rizensoft_mobile_app_flutter/models/profile_text.dart';
import 'package:rizensoft_mobile_app_flutter/models/register_texts.dart';
import 'package:rizensoft_mobile_app_flutter/models/reminder_text.dart';

class AppConstants{
  static const String APP_TITLE = 'Rizensoft Flutter Template App';

  //Api Responses
  static String successfulInsert(String type) => '$type record inserted successfully';

  static bool SUCCESS = true;

  static bool FAIL = false;

  //login
  static LoginTexts get loginTexts => LoginTexts();

  //register
  static RegisterTexts get registerTexts => RegisterTexts();

  //secure storage
  static const String ACCOUNT_NAME = 'flutter secure storage';

  //profile
  static ProfileText get profileText => ProfileText();

  //reminder
  static ReminderText get reminderText => ReminderText();

  //dialog
  static Dialog get dialog => Dialog();

  //dimensions
  static Dimensions get dimensions => Dimensions();

  //font size
  static FontSize get fontSize => FontSize();

  //layout
  static Layout get layout => Layout();
}