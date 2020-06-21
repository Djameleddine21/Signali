import 'package:flutter/material.dart';
import 'package:signalini/utils/constants.dart';

class AlertWidget {
  ///show Circular Progress Indicator at the middle of the screen
  static void circularProgressIndicator(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Container(
            height: 50.0,
            width: 50.0,
            color: Colors.transparent,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }

  ///show Error Message
  static void showError(BuildContext context, String error) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Erreur", style: TextStyle(color: redColor)),
          content: Text(error, style: TextStyle(color: Colors.black87)),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Ok", style: TextStyle(fontSize: 20.0)),
              textColor: Colors.blue,
              color: Colors.transparent,
            ),
          ],
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        );
      },
    );
  }
}
