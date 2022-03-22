import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NCImage extends StatelessWidget {

  final String? url;
  final BoxFit? fit;

  // ignore: use_key_in_widget_constructors
  const NCImage({
    this.url,
    this.fit = BoxFit.cover
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      placeholderFadeInDuration: Duration(microseconds: 1),
      fadeInDuration: Duration(milliseconds: 1),
      fadeOutDuration: Duration(microseconds: 1),
      imageUrl: url.toString(),
      useOldImageOnUrlChange: true,
      errorWidget: (context, url, error) => const Icon(Icons.report_gmailerrorred_outlined, color: Colors.red,),
      placeholder: (context, url) => Container(color: Colors.black,),
      fit: fit,
    );
  }

}