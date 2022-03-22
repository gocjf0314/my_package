import 'package:flutter/material.dart';

class CustomInkWell extends StatelessWidget {

  final double? width;
  final double? height;
  final double? circularValue;
  final EdgeInsets? padding;
  final Widget? child;
  final Color? color;
  final GestureTapCallback? onTap;

  CustomInkWell({
    required this.child,
    required this.onTap,
    this.color,
    this.circularValue = 0.0,
    this.padding,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(circularValue!)
      ),
      child: Material(
        child: InkWell(
          onTap: onTap,
          child: Container(
            width: width,
            padding: padding,
            child: child,
          ),
        ),
        color: Colors.transparent,
      ),
    );
  }
}