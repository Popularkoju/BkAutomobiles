import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showLoaderDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    // ignore: unnecessary_new
    content: Row(
      children: const [
        CircularProgressIndicator(
          backgroundColor: Colors.blueAccent,
          color: Colors.redAccent,
        ),
        SizedBox(
          width: 10,
        ),
        Text("Loading..."),
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showFlutterToast(String msg, Color? backgroundColor, ToastGravity gravity) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity,
      backgroundColor: backgroundColor,
      textColor: Colors.white,
      fontSize: 12.0);
}
