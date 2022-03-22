import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {

  final Icon icon;
  final VoidCallback onPressed;

  CustomIconButton({
    required this.icon,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      splashRadius: 20.0,
      icon: icon
    );
  }
}