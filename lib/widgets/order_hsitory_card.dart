import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_onlineapp/models/order_model.dart';
import 'package:grocery_onlineapp/screens/cancel_order_screen.dart';
import 'package:grocery_onlineapp/screens/order_summary_screen.dart';
import 'package:grocery_onlineapp/screens/track_order_screen.dart';
import 'package:grocery_onlineapp/utils/date_formatter.dart';
import 'package:grocery_onlineapp/utils/string_formatter.dart';

class OrderHistoryCard extends StatelessWidget {
  final OrderModel order;

  const OrderHistoryCard({Key key, this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // list of names of products
    final List<String> products =
        order.products.map((e) => e.productName).toList();
    // text theme
    TextTheme textTheme = Theme.of(context).textTheme;
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Color(0xffF4F4F4),
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(4.0),
      ),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormatter.formatDate(order.orderTimestamp),
                  style: textTheme.subtitle1.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "\$ ${order.orderPrice} >",
                  style: textTheme.bodyText1.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
                bottom: 16,
              ),
              child: Text(
                "Order ${order.orderId}",
                style: textTheme.subtitle2.copyWith(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                StringFormatter.convertListItemsToString(products),
                style: textTheme.caption,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: _orderStatusNotifier(order, textTheme, context),
            )
          ],
        ),
      ),
    );
  }

  Widget _orderStatusNotifier(
      OrderModel order, TextTheme textTheme, BuildContext context) {
    if (order.orderStatus == "PENDING") {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 5,
                backgroundColor: Colors.green,
              ),
              SizedBox(width: 8),
              Text(
                "Out for delivery",
                style: textTheme.bodyText1,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () => Get.to(() => CancelOrderScreen()),
                  child: Text(
                    "Cancel Order",
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => Get.to(() => TrackOrderScreen()),
                  child: Text(
                    "Track Order",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      );
    } else if (order.orderStatus == "DELIVERED") {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 5,
                backgroundColor: Colors.purple,
              ),
              SizedBox(width: 8),
              Text(
                "Delivered",
                style: textTheme.bodyText1.copyWith(
                  color: Colors.purple,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Ask Refund",
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => Get.to(() => OrderSummaryScreen()),
                  child: Text(
                    "Reorder Items",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 5,
                backgroundColor: Colors.grey[600],
              ),
              SizedBox(width: 8),
              Text(
                "Order Cancelled",
                style: textTheme.bodyText1.copyWith(
                  color: Colors.grey[600],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Center(
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Report your problem",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          )
        ],
      );
    }
  }
}
