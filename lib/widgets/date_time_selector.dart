import 'dart:math';

import 'package:flutter/material.dart';

class DateTimeSelector extends StatelessWidget {
  final String heading;
  final String value;
  final Function onPressed;
  const DateTimeSelector({
    Key key,
    this.heading,
    this.value,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: Open date/ time picker upon clicking this widget.
    // text theme
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      height: 80,
      color: Color(0xffF6F6F6),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  heading,
                  style: textTheme.caption,
                ),
                Spacer(),
                Text(
                  value,
                  style: textTheme.bodyText1.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Center(
                child: Transform.rotate(
                  angle: pi / 2,
                  child: Icon(
                    Icons.chevron_right,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
