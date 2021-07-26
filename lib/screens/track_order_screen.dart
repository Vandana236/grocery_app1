import 'package:flutter/material.dart';
import 'package:grocery_onlineapp/constants/image_constants.dart';
import 'package:grocery_onlineapp/widgets/delivery_details.dart';
import 'package:grocery_onlineapp/widgets/my_ink_well.dart';
import 'package:grocery_onlineapp/widgets/track_order_card.dart';

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // text theme
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Track Order",
          style: textTheme.headline6,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DeliveryDetails(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: DeliveryBoyInfo(),
              ),
              OrderInfoCard(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32.0),
                child: Text(
                  "ETA:  15 Minutes",
                  style: textTheme.headline6,
                ),
              ),
              TrackOrderCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderInfoCard extends StatelessWidget {
  const OrderInfoCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // text theme
    TextTheme textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Order #133466",
              style: textTheme.subtitle1.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 4),
            MyInkWell(
              onPressed: () {},
              introText: "Amount  ",
              mainText: "\$ 1450",
              textStyle: textTheme.bodyText1,
            ),
          ],
        ),
        Spacer(),
        OutlinedButton(
          onPressed: () {},
          child: Text(
            "Cancel Order",
            style: textTheme.bodyText1.copyWith(
              color: Theme.of(context).primaryColor,
            ),
          ),
        )
      ],
    );
  }
}

class DeliveryBoyInfo extends StatelessWidget {
  const DeliveryBoyInfo({Key key}) : super(key: key);

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
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(
                ImageConstants.DUMMY_PROFILE_PICTURE_URL,
              ),
            ),
            SizedBox(width: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "John Doe Bhai",
                  style: textTheme.bodyText1.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Your courier",
                  style: textTheme.caption,
                ),
              ],
            ),
            Spacer(),
            Icon(Icons.call),
            SizedBox(width: 16),
            Icon(Icons.mail_outline),
          ],
        ),
      ),
    );
  }
}
