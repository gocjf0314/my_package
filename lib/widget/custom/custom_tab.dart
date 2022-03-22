import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget{

  final String? tabText;

  CustomTab({
    this.tabText
  });

  final AlignmentGeometry _alignmentGeometry = Alignment.center;
  final EdgeInsets _contentsPadding = const EdgeInsets.all(10);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: _alignmentGeometry,
        child: Padding(
          padding: _contentsPadding,
          child: Text(tabText!),
        ),
      ),
    );
  }
}