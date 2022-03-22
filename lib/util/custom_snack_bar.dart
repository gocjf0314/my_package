import 'package:flutter/material.dart';

class CustomSnackBar {

  doubleActionSnack(context,
      String contentText, String trueText, String falseText,
      VoidCallback trueOnPressed, VoidCallback falseOnPressed) async {
    Scaffold.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
      content: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(contentText),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: Text(trueText),
                  onPressed: trueOnPressed,
                ),
                TextButton(
                  child: Text(falseText),
                  onPressed: falseOnPressed,
                ),
              ],
            )
          ],
        ),
      )
    ));
  }

  actionSnack(context, String contentText, String labelText, VoidCallback onPressed) async {
    Scaffold.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      content: Text(contentText),
      action: SnackBarAction(
        label: labelText,
        onPressed: onPressed,
      ),
    ));
  }

  infoSnack(context, String contentText) async {
    Scaffold.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      content: Text(contentText),
    ));
  }

}