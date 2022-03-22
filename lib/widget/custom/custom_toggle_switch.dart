import 'package:jimmy_development/common_package.dart';
import 'package:flutter/material.dart';

class CustomToggleSwitch extends StatelessWidget {

  final String trueText;
  final String falseText;
  final bool value;
  final GestureTapCallback onTap;
  final double? width;
  final double? height;

  CustomToggleSwitch({
    required this.trueText,
    required this.falseText,
    required this.value,
    required this.onTap,
    this.width,
    this.height
  });

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? _size.width * 0.4,
        height: height ?? 30,
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(5)
        ),
        padding: EdgeInsets.all(3),
        child: AnimatedAlign(
          alignment: value == false ? Alignment.centerRight : Alignment.centerLeft,
          duration: const Duration(
            milliseconds: 100
          ),
          child: Container(
            width: _size.width * 0.4 / 2,
            height: 30,
            decoration: BoxDecoration(
              color: value ? Colors.green : Colors.grey,
              borderRadius: BorderRadius.circular(5)
            ),
            child: Center(
              child: Text(
                value == true ? trueText : falseText
              ),
            ),
          ),
        ),
      ),
    );
  }
}