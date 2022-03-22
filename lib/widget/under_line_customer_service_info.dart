import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UnderLineCustomerServiceInfo extends StatelessWidget{

  final String _infoMessage = "24시간 연중무휴 고객센터 ";
  final String _customerNumber = "0000-0000";
  final String _copyRight = "copyright Wawa Family in Deagu. All Rights Reserved";

  const UnderLineCustomerServiceInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text.rich(TextSpan(
          children: [
            TextSpan(text: _infoMessage, style: const TextStyle(fontSize: 14, color: Colors.grey)),
            TextSpan(text: _customerNumber, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
          ]
        )),
        Text(_copyRight, style: const TextStyle(fontSize: 14, color: Colors.grey))
      ],
    );
  }
}