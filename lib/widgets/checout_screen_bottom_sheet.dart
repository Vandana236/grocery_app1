import 'package:flutter/material.dart';
import 'confirmation_slider.dart';

class CheckoutScreenBottomSheet extends StatelessWidget {
  final Function onButtonPressed;

  const CheckoutScreenBottomSheet({Key key, this.onButtonPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // text theme
    TextTheme textTheme = Theme.of(context).textTheme;
    // screen width
    double screenWidth = MediaQuery.of(context).size.width;
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
                  "Total 3 items in cart",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "\$ 1290",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            SizedBox(height: 16.0),
            ConfirmationSlider(
                width: screenWidth - 32,
                height: 60,
                backgroundColor: Color(0xffFBE8E6),
                foregroundColor: Theme.of(context).primaryColor,
                backgroundShape: BorderRadius.circular(5),
                foregroundShape: BorderRadius.circular(5),
                text: "Swipe to place order",
                onConfirmation: () => onButtonPressed())
          ],
        ),
      ),
    );
  }
}
