import 'package:flutter/material.dart';

class CustomLabelTextFormField extends StatelessWidget {

  final TextEditingController controller;
  final String? labelText;
  final GestureTapCallback? onTap;
  final bool isRead;
  final int? maxLength;
  final int? maxLines;
  final String? hintText;
  final TextInputType? inputType;
  final Color focusColor;
  final ValueChanged<String>? onChange;

  CustomLabelTextFormField({
    required this.controller,
    this.labelText,
    this.onTap,
    this.isRead = false,
    this.maxLength,
    this.maxLines,
    this.hintText,
    this.inputType = TextInputType.text,
    this.focusColor = Colors.orangeAccent,
    this.onChange,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          labelText == null
            ? Container()
            : Container(
                width: MediaQuery.of(context).size.width * 0.20,
                padding: const EdgeInsets.all(5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    labelText!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
          labelText == null
            ? Container()
            : const SizedBox(
                width: 20
              ),
          Expanded(
            child: TextFormField(
              onTap: onTap,
              readOnly: isRead,
              controller: controller,
              maxLength: maxLength,
              maxLines: maxLines,
              decoration: InputDecoration(
                border: labelText != null ? UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: focusColor,
                  ),
                ) : InputBorder.none,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade100
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: labelText != null ? focusColor : Colors.transparent,
                  ),
                ),
                hintText: hintText,
                hintStyle: const TextStyle(fontSize: 10, color: Colors.grey),
                isDense: true,
              ),
              keyboardType: inputType,
              onChanged: onChange,
            ),
          ),
        ],
      ),
    );
  }
}