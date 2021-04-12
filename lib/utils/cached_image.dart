 //import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  final String imageUrl;
  final bool isRound;
  final double radius;
  final double height;
  final double width;

  final BoxFit fit;

  CachedImage(
    this.imageUrl, {
    this.isRound = false,
    this.radius = 0,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
  });

  Widget imageDef(BuildContext context) =>
      Image.asset("assets/blah.png", fit: BoxFit.cover, color: Theme.of(context).buttonColor);

  @override
  Widget build(BuildContext context) {
    try {
      return SizedBox(
        height: isRound ? radius : height,
        width: isRound ? radius : width,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(isRound ? radius : 20),
            child: (imageUrl == null)
                ? imageDef(context)
                : Image.network(
                    imageUrl,
                    errorBuilder: (BuildContext context, Object obj, StackTrace e) => imageDef(context),
                    fit: fit,
                  )
            // : CachedNetworkImage(
            //   imageUrl: imageUrl,
            //   fit: fit,
            //   placeholder: (context, url) =>
            //       Center(child: CircularProgressIndicator()),
            //   errorWidget: (context, url, error) => imageDef(context),
            // )
            ),
      );
    } catch (e) {
      print(e);
      return imageDef(context);
    }
  }
}
