import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

class CustomExpandPannel extends StatelessWidget {

  final Widget? headWidget;
  final Widget? simpleBodyWidget;
  final Widget? bodyWidget;
  final EdgeInsetsGeometry contentsPadding;

  CustomExpandPannel({
    required this.headWidget,
    required this.simpleBodyWidget,
    required this.bodyWidget,
    this.contentsPadding = const EdgeInsets.all(10)
  });

  final EdgeInsetsGeometry inSizePadding = const EdgeInsets.only(left: 10, right: 10, bottom: 10);

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: Padding(
        padding: contentsPadding,
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: <Widget>[
              ScrollOnExpand(
                scrollOnExpand: true,
                scrollOnCollapse: false,
                child: ExpandablePanel(
                  theme: const ExpandableThemeData(
                    headerAlignment: ExpandablePanelHeaderAlignment.center,
                    tapBodyToCollapse: true,
                  ),
                  header: Padding(
                    padding: contentsPadding,
                    child: headWidget!,
                  ),
                  collapsed: simpleBodyWidget!,
                  expanded: bodyWidget!,
                  builder: (_, collapsed, expanded) {
                    return Padding(
                      padding: inSizePadding,
                      child: Expandable(
                        collapsed: collapsed,
                        expanded: expanded,
                        theme: const ExpandableThemeData(crossFadePoint: 0),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}