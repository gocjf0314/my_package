import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomCircleAvatar extends StatelessWidget{

  final String? avatarImageUrl;
  final double? maxRadius;

  CustomCircleAvatar({
    required this.avatarImageUrl,
    this.maxRadius = 20.0
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      backgroundImage: CachedNetworkImageProvider(avatarImageUrl!),
      maxRadius: maxRadius,
    );
  }
}