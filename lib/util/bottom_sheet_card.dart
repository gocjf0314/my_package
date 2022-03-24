import 'package:jimmy_development/my_package.dart';
import 'package:flutter/material.dart';

class BottomSheetCard {

  void open(
    context,
    Widget body,
    {
      Color backgroundColor = Colors.grey
    }) {
      showModalBottomSheet(
        context: context,
        backgroundColor: backgroundColor,
        builder: (context) => body,
      );
  }

  void openImage(context, {
    VoidCallback? takeImage,
    VoidCallback? getGallery,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.grey.shade200,
      builder: (context) => ScrollConfiguration(
        behavior: CustomBehavior(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FlatButton(
                child: Text('사진 촬영'),
                onPressed: takeImage,
              ),
              FlatButton(
                child: Text('갤러리'),
                onPressed: getGallery,
              ),
            ],
          ),
        )
      ),
    );
  }
}