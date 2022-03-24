import 'package:jimmy_development/my_package.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabScaffold extends StatefulWidget {

  final Widget? appTitle;
  final TabController? tabController;
  final Function(int)? onTap;
  final Widget? body;
  final Widget? bottomTabBar;
  final Widget? tabsAllShowButton;
  final Decoration? indicator;
  final List<Widget>? tabChildren;
  final List<Widget>? actionButtons;

  TabScaffold({
    required this.appTitle,
    required this.tabChildren,
    required this.body,
    this.tabController,
    this.onTap,
    this.indicator,
    this.tabsAllShowButton,
    this.actionButtons,
    this.bottomTabBar,
  });

  @override
  _TabScaffoldState createState() => _TabScaffoldState();
}

class _TabScaffoldState extends State<TabScaffold> {

  final TextStyle appBarTitleTextStyle = const TextStyle(color: Colors.black, fontWeight: FontWeight.bold);
  final TextStyle unselectedLabelStyle = TextStyle(color: Colors.grey.shade700);
  final TextStyle tabLabelTextStyle = const TextStyle(color: Colors.black, fontWeight: FontWeight.bold);
  final double indicatorWeight = 0.5;
  final double leftCircularValue = 10.0;
  final double rightCircularValue = 10.0;
  final double elevationValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.tabChildren!.length,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: elevationValue,
            toolbarHeight: 50,
            title: widget.appTitle,
            // title: Text(
            //   widget.appTitle!,
            //   textAlign: TextAlign.center,
            //   style: appBarTitleTextStyle,
            //   textScaleFactor: 1.0,
            // ),
            actions: widget.actionButtons,
          ),
          body: Column(
            children: [
              Divider(
                color: Colors.grey.shade400,
                thickness: 1.0,
                height: 0.5,
              ),
              widget.tabChildren!.length > 0 ?
              Container(
                padding: const EdgeInsets.only(
                    right: 5,
                    left: 5
                ),
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(right: 40),
                          alignment: Alignment.centerLeft,
                          child: TabBar(
                            controller: widget.tabController,
                            unselectedLabelColor: Colors.black,
                            indicatorSize: TabBarIndicatorSize.label,
                            indicatorColor: CustomColor().mainColor,
                            indicatorWeight: indicatorWeight,
                            indicator: widget.indicator,
                            // indicator: BoxDecoration(
                            //   // borderRadius: BorderRadius.only(
                            //   //     topLeft: Radius.circular(leftCircularValue),
                            //   //     topRight: Radius.circular(rightCircularValue)),
                            //   color: CustomColor().mainColor,
                            // ),
                            isScrollable: true,
                            tabs: widget.tabChildren!,
                            onTap: widget.onTap,
                            // onTap: (value) => setState(() => currentIndex = value),
                            unselectedLabelStyle: unselectedLabelStyle,
                            labelStyle: tabLabelTextStyle,
                          ),
                        ),
                        widget.tabsAllShowButton!,
                      ],
                    ),
                  ],
                ),
              ) :
              Container(),
              widget.bottomTabBar!,
              Expanded(
                child: ScrollConfiguration(
                  behavior: CustomBehavior(),
                  child: widget.body!
                ),
              ),
            ],
          ),
      ),
    );
  }
}
