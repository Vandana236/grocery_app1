import 'package:flutter/material.dart';

class OrderStatusCard extends StatelessWidget {
  const OrderStatusCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // text theme
    TextTheme textTheme = Theme.of(context).textTheme;
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Order #133426",
                  style: textTheme.subtitle1.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "Delivered today at 3:00 PM",
                    style: textTheme.caption,
                  ),
                ),
                SizedBox(height: 32),
                Text(
                  "Payment Method",
                  style: textTheme.bodyText1.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "Cash on delivery",
                    style: textTheme.caption,
                  ),
                ),
              ],
            ),
            Spacer(),
            CircleAvatar(
              radius: 10,
              backgroundColor: Colors.green,
              child: Icon(
                Icons.check,
                color: Colors.white,
                size: 14,
              ),
            ),
            SizedBox(width: 8),
            Text(
              "Delivered",
              style: textTheme.bodyText1.copyWith(
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}