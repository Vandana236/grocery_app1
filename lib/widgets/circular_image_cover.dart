import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CircularImageCover extends StatelessWidget {
  final Color backgroundColor;
  final String imageUrl;

  const CircularImageCover({
    Key key,
    this.backgroundColor,
    @required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: backgroundColor ?? Colors.white,
      child: Center(
        child: Padding(
          padding: const EdgeInsetsDirectional.all(12.0),
          child: SvgPicture.asset(
            imageUrl,
            height: 100,
          ),
        ),
      ),
    );
  }
}
