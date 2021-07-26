import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MyInkWell extends StatelessWidget {
  final String introText;
  final TextStyle textStyle;
  final String mainText;
  final Function onPressed;
  const MyInkWell({
    Key key,
    @required this.onPressed,
    @required this.introText,
    @required this.mainText,
    this.textStyle,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Text Theme
    final TextTheme textTheme = Theme.of(context).textTheme;
    return RichText(
      text: TextSpan(
        style: textStyle ?? textTheme.headline6,
        children: [
          TextSpan(
            text: introText,
            style: TextStyle(
              fontWeight: FontWeight.normal,
            ),
          ),
          TextSpan(
            text: mainText,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()..onTap = onPressed,
          ),
        ],
      ),
    );
  }
}
