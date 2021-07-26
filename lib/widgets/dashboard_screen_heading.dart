import 'package:flutter/material.dart';

class DashboardScreenHeading extends StatelessWidget {
  const DashboardScreenHeading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // text theme
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: textTheme.headline5,
            children: [
              TextSpan(
                text: "Get your",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                ),
              ),
              TextSpan(
                text: " groceries",
              ),
            ],
          ),
        ),
        Text(
          "delivered quickly",
          style: textTheme.headline6.copyWith(
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
