import 'package:jimmy_development/common_package.dart';
import 'package:flutter/material.dart';
import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';

class CustomBottomSheet extends StatelessWidget {

  final Widget? body;
  final Widget? bottomSheetBody;
  final List<BottomBarWithSheetItem> bottomSheetItemList;
  final BottomBarWithSheetController? controller;
  final Function(int)? onSelect;

  CustomBottomSheet({
    required this.body,
    required this.bottomSheetBody,
    required this.bottomSheetItemList,
    required this.controller,
    this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: BottomBarWithSheet(
        controller: controller,
        selectedIndex: 0,
        sheetChild: bottomSheetBody!,
        bottomBarTheme: BottomBarTheme(
          mainButtonPosition: MainButtonPosition.left,
          selectedItemIconColor: CustomColor().mainColor,
          backgroundColor: Colors.grey.shade100
        ),
        mainActionButtonTheme: MainActionButtonTheme(
          size: 60,
          color: const Color(0xFF2B65E3),
          icon: Icon(
            Icons.lock_open_outlined,
            color: Colors.white,
            size: 35,
          ),
        ),
        onSelectItem: onSelect,
        items: bottomSheetItemList,
      ),
    );
  }
}