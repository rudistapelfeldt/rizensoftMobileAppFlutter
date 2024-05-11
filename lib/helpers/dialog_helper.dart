import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DialogHelper {

  static void showToast(String msg, Toast length, ToastGravity gravity, Color backgroundColor, Color textColor, double fontSize ){
    Fluttertoast.showToast(
        msg: msg,
        toastLength: length,
        gravity: gravity,
        backgroundColor: backgroundColor,
        textColor: textColor,
        fontSize: fontSize
    );
  }
}