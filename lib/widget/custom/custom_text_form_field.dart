import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {

  final TextEditingController? controller;
  final bool isRead;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final String? hintText;
  final TextAlign textAlign;
  final TextInputType keyBoardType;

  CustomTextFormField({
    required this.controller,
    this.isRead = false,
    this.validator,
    this.onChanged,
    this.onTap,
    this.hintText,
    this.textAlign = TextAlign.start,
    this.keyBoardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textAlign: textAlign,
      keyboardType: keyBoardType,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 13
        ),
        isDense: true,
      ),
      onChanged: onChanged,
      onTap: onTap,
      readOnly: isRead,
      validator: validator,
    );
  }
}