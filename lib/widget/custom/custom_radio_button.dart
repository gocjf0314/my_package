import 'package:flutter/material.dart';
import 'custom_ink_well.dart';

class CustomRadioButton<T> extends StatefulWidget {

  T? selectedValue;
  T? value;
  ValueChanged<T>? onChanged;
  final String? label;

  CustomRadioButton({
    required this.selectedValue,
    required this.value,
    required this.onChanged,
    this.label,
  });

  @override
  State<CustomRadioButton<T>> createState() => _CustomRadioButtonState<T>();
}

class _CustomRadioButtonState<T> extends State<CustomRadioButton<T>> {
  bool isActive = false;

  final double activeCircleValue = 25;

  final double defaultCircleValue = 10;

  final EdgeInsets radioButtonPadding = const EdgeInsets.all(5);

  final TextStyle labelTextStyle = const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13);

  Color? activeColor = const Color(0xff398e5e);

  Color? inactiveColor = Colors.white;


  @override
  Widget build(BuildContext context) {
    setState(() {
      isActive = widget.value == widget.selectedValue;
    });

    return Container(
      padding: radioButtonPadding,
      child: CustomInkWell(
        onTap: () {
          widget.onChanged!(widget.value!);
        },
        child: _partOfRadio(),
      ),
    );
  }

  Widget _partOfRadio() => Stack(
    alignment: Alignment.center,
    children: [
      SizedBox(
        height: activeCircleValue,
        width: activeCircleValue,
        child: OutlinedButton(
          onPressed: () {
            widget.onChanged!(widget.value!);
          },
          style: OutlinedButton.styleFrom(
            elevation: 0.0,
            backgroundColor: isActive ? activeColor : inactiveColor,
            shape: const CircleBorder(),
            side: const BorderSide(
              color: Color(0xff398e5e),
            ),
          ),
          child: Container(),
        ),
      ),
      Container(
        width: defaultCircleValue,
        height: defaultCircleValue,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
    ],
  );
}
