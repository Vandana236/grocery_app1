import 'package:grocery_onlineapp/widgets/bottom_button.dart';
import 'package:flutter/material.dart';

class CartScreenBottomSheet extends StatelessWidget {
  final Function onButtonPressed;
  const CartScreenBottomSheet({Key key, this.onButtonPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // text theme
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Subtotal",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  "\$ 1290",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                )
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Shipping fee",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  "\$ 50",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Divider(),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "\$ 1350",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            BottomButton(
              loadingState: false,
              disabledState: false,
              onPressed: () => onButtonPressed(),
              child: Text("Proceed to checkout"),
            )
          ],
        ),
      ),
    );
  }
}
