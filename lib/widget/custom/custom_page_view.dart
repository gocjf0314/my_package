import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CustomPageView extends StatefulWidget{

  final ExtendedIndexedWidgetBuilder items;
  final int itemCount;
  final bool autoPlay;
  final bool enlargeCenterPage;
  final double viewportFraction;
  final double aspectRatio;
  final int initialPage;
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final onPageCanged;
  final Curve autoPlayCurve;
  int currentPos;

  CustomPageView({Key? key,
    required this.items,
    required this.itemCount,
    this.autoPlay = false,
    this.enlargeCenterPage = false,
    this.viewportFraction = 0.9,
    this.aspectRatio = 2.0,
    this.initialPage = 1,
    required this.currentPos,
    this.controller,
    this.onPageCanged,
    this.autoPlayCurve = Curves.decelerate,
  }) : super(key: key);

  @override
  State<CustomPageView> createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: widget.itemCount,
      itemBuilder: widget.items,
      options: CarouselOptions(
        onPageChanged: widget.onPageCanged,
        autoPlay: widget.autoPlay,
        enlargeCenterPage: widget.enlargeCenterPage,
        viewportFraction: widget.viewportFraction,
        aspectRatio: widget.aspectRatio,
        initialPage: widget.initialPage,
        autoPlayCurve: widget.autoPlayCurve,
        autoPlayAnimationDuration: const Duration(seconds: 2),
        autoPlayInterval: const Duration(seconds: 10),
        enableInfiniteScroll: true,
      ),
      carouselController: widget.controller,
    );
  }
}