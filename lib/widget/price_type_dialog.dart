import 'package:flutter/material.dart';

class PriceTypeDialog extends StatelessWidget {

  const PriceTypeDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      content: Column(
        children: [
          _chooseButton(context, '개(당)'),
          _chooseButton(context, '평(당)'),
          _chooseButton(context, '그램(당)'),
          _chooseButton(context, '키로그램(당)'),
        ],
      ),
    );
  }

  Widget _chooseButton(context, String value) {
    return TextButton(
      child: Text(value),
      onPressed: () => Navigator.of(context).pop(value),
    );
  }
}