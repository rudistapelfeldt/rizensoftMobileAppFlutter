import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rizensoft_mobile_app_flutter/helpers/app_constants.dart';

class DialogHelper {
  static void showToast(String msg, Toast length, ToastGravity gravity,
      Color backgroundColor, Color textColor, double fontSize) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: length,
        gravity: gravity,
        backgroundColor: backgroundColor,
        textColor: textColor,
        fontSize: fontSize);
  }

  static void displayAlert(
      BuildContext context,
      String title,
      String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Theme(
            data: ThemeData(canvasColor: Colors.orange),
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(AppConstants.dimensions.borderRadius)),
              ),
              icon: Icon(
                Icons.error,
                color: Colors.red,
                size: AppConstants.dimensions.iconSize,
              ),
              iconPadding: EdgeInsets.all(AppConstants.dimensions.iconPadding),
              title: Text(title),
              content: Text(msg),
              actions: <Widget>[
                TextButton(
                  child: Text(AppConstants.dialog.ok),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
      },
    );
  }
}
