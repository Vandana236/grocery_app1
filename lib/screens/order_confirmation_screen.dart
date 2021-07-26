import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_onlineapp/screens/home_screen.dart';

class OrderConfirmationScreen extends StatelessWidget {
  const OrderConfirmationScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // text theme
    TextTheme textTheme = Theme.of(context).textTheme;
    // screen Height
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: screenHeight * 0.3,
          ),
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Theme.of(context).primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 80,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 16.0,
              bottom: 8,
            ),
            child: Text(
              "Order placed successfully",
              style: textTheme.headline6,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 32.0),
            child: Text(
              "Order Id:  #12345677",
              style: textTheme.caption.copyWith(fontSize: 17),
            ),
          ),
          Text(
            "View Details",
            style: textTheme.bodyText1.copyWith(fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text("Go Home"),
                ),
                onPressed: () => Get.offAll(() => HomeScreen()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
