import 'package:flutter/material.dart';

class DeliveryDetails extends StatelessWidget {
  const DeliveryDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // text theme
    TextTheme textTheme = Theme.of(context).textTheme;
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Color(0xffF4F4F4),
          width: 1.5,
        ),
      ),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.timer_outlined,
                  color: Colors.black,
                ),
                SizedBox(width: 8),
                Text(
                  "Delivery today at 3:00 PM",
                  style: textTheme.caption,
                ),
                Spacer(),
                Text(
                  "Change time",
                  style: textTheme.bodyText1,
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: Colors.black,
                ),
                SizedBox(width: 8),
                Text(
                  "Luminous tower, Flat E2, Sheikhghat",
                  maxLines: 2,
                  style: textTheme.caption,
                ),
                Spacer(),
                Text(
                  "Edit",
                  style: textTheme.bodyText1,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Divider(),
            ),
            Center(
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Write Instructions (Optional)",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
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
