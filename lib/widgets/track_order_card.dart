import 'package:flutter/material.dart';
import 'package:grocery_onlineapp/constants/image_constants.dart';
import 'package:grocery_onlineapp/widgets/dotted_line.dart';

class TrackOrderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OrderProgressBox(
          heading: "Order Placed",
          value: "2:30 PM, 27 jUNE 2020",
          isStepComplete: true,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: DottedLine(
            direction: Axis.vertical,
            lineLength: 48,
            dashColor: Color(0xff136F63),
          ),
        ),
        OrderProgressBox(
          heading: "Items Processed",
          value: "Bagged in warehouse at 2:40 PM",
          isStepComplete: true,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: DottedLine(
            direction: Axis.vertical,
            lineLength: 48,
            dashColor: Color(0xff136F63),
          ),
        ),
        OrderProgressBox(
          heading: "Delivering",
          value: "Your courier is on the way",
          isStepComplete: true,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: DottedLine(
                direction: Axis.vertical,
                lineLength: 140,
                dashColor: Colors.grey,
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 24.0,
                bottom: 16,
                top: 16.0
              ),
              child: Image.asset(
                ImageConstants.MAP_IMAGE_URL,
                height: 130,
              ),
            )
          ],
        ),
        OrderProgressBox(
          heading: "Shoping delivered",
          value: "Expected at 3:05 pm, 27/Jun/2020",
          isStepComplete: false,
        ),
      ],
    );
  }
}

class OrderProgressBox extends StatelessWidget {
  final String heading;
  final String value;
  final bool isStepComplete;
  const OrderProgressBox({
    Key key,
    this.heading,
    this.value,
    this.isStepComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // text theme
    TextTheme textTheme = Theme.of(context).textTheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.check,
              color: isStepComplete
                  ? Color(0xff136F63)
                  : Theme.of(context).scaffoldBackgroundColor,
            ),
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 1.5,
              color: isStepComplete ? Color(0xff136F63) : Colors.grey,
            ),
          ),
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              heading,
              style: textTheme.bodyText1.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              value,
              style: textTheme.caption,
            ),
          ],
        ),
      ],
    );
  }
}
