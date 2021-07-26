import 'package:flutter/material.dart';
import 'package:grocery_onlineapp/widgets/coupon_card.dart';

class CouponsScreen extends StatelessWidget {
  Color color = const Color(0xffdd2e45);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(
            Icons.shopping_bag,
            color: color,
          ),
          SizedBox(
            width: 15,
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "My Coupons",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: _listComponents(),
    );
  }

  _listComponents() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          CouponsCard(
            discount: "15% off",
            redeemColor: color,
            title: "Applies to first Purchase",
            subTitle: "Valid Until 25 Aug",
          ),
          SizedBox(
            height: 10,
          ),
          CouponsCard(
            discount: "15% off",
            redeemColor: Colors.grey,
            title: "Applies to first Purchase",
            subTitle: "Valid Until 25 Aug",
          ),
          SizedBox(
            height: 10,
          ),
          CouponsCard(
            discount: "15% off",
            redeemColor: Colors.grey,
            title: "Applies to first Purchase",
            subTitle: "Valid Until 25 Aug",
          ),
          SizedBox(
            height: 10,
            width: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.local_offer_outlined,
                color: color,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Enter other promo code",
                style: TextStyle(color: color),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
