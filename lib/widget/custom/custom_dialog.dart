import 'package:jimmy_development/my_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomDialog {

  Widget _squareCircle() => SpinKitSquareCircle(
    color: CustomColor().mainColor,
  );

  Widget _foldingCube() => SpinKitFoldingCube(
    color: CustomColor().mainColor,
  );

  Widget _doubleBounce() => SpinKitDoubleBounce(
    color: CustomColor().mainColor,
  );

  showInfo(context, String? infoText, {bool cantBack = false}) {
    return showDialog(
      context: context,
      barrierDismissible: !cantBack,
      builder: (context) => AlertDialog(
        content: Text(
          infoText!
        ),
        actions: [
          cantBack ? TextButton(
            child: const Text('확인'),
            onPressed: () => Navigator.of(context).pop(),
          ) : Container()
        ],
      ),
    );
  }

  showLoad(context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: _squareCircle(),
      ),
    );
  }

  showChoose(context, String? infoText, VoidCallback? onTapSure) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(infoText!),
        actions: [
          TextButton(
            child: Text('아니요'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: Text('예'),
            onPressed: onTapSure,
          ),
        ],
      ),
    );
  }

  showCustom(context, Widget? content, List<Widget>? actions) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        content: content,
        actions: actions,
      ),
    );
  }

}