import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget{

  final Color? color;
  final double height;
  final EdgeInsetsGeometry padding;

  CustomDivider({
    this.height = 2.0,
    this.color = Colors.black,
    this.padding = const EdgeInsets.only(left: 10, right: 10)
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Divider(
        color: color,
        height: height,
      ),
    );
  }
}