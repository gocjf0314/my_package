import 'package:flutter/material.dart';

class CustomPage extends StatelessWidget {

  final Widget body;
  final String? appBarTitleText;
  final Widget? sideWidget;
  final List<Widget>? actions;

  CustomPage({
    required this.body,
    this.appBarTitleText,
    this.sideWidget,
    this.actions,
  });

  final TextStyle _appBarTextStyle = const TextStyle(color: Colors.black, fontWeight: FontWeight.bold,);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        appBarTitleText != null
          ? AppBar(
              title: Text(
                appBarTitleText!,
                style: _appBarTextStyle,
              ),
              actions: actions,
            )
          : Container(),
        sideWidget ?? Container(),
        Expanded(
          child: body,
        )
      ],
    );
  }
}