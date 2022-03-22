import "package:flutter/material.dart";

/// Custom Behavior
class CustomBehavior extends ScrollBehavior {
  /// Scroll Effect Delete
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}