import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class GradeRatingBar extends StatelessWidget{

  final double grade;

  GradeRatingBar({
    required this.grade
  });

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      itemSize: 18,
      direction: Axis.horizontal,
      itemCount: 5,
      rating: 5.0,
      itemPadding: const EdgeInsets.symmetric(horizontal: 0),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
    );
  }
}