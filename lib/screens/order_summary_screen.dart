import 'package:flutter/material.dart';
import 'package:grocery_onlineapp/widgets/bottom_button.dart';
import 'package:grocery_onlineapp/widgets/delivery_details.dart';
import 'package:grocery_onlineapp/widgets/order_details_card.dart';
import 'package:grocery_onlineapp/widgets/order_status_card.dart';

class OrderSummaryScreen extends StatelessWidget {
  const OrderSummaryScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // text theme
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Order Summary",
          style: textTheme.headline6,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              OrderStatusCard(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: OrderDetailsCard(),
              ),
              DeliveryDetails(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: BottomButton(
                  loadingState: false,
                  disabledState: false,
                  onPressed: () {},
                  child: Text("Reorder"),
                ),
              ),
              SizedBox(width: 32),
            ],
          ),
        ),
      ),
    );
  }
}

