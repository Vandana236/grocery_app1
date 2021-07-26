import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_onlineapp/screens/cart_screen.dart';

class CartItemCountButton extends StatelessWidget {
  final int itemCount;

  const CartItemCountButton({
    Key key,
    this.itemCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: Get.width/2,
      child: ElevatedButton.icon(
        icon: Icon(Icons.shopping_cart_outlined),
        label: Text("$itemCount items in cart"),
        onPressed: () => Get.to(() => CartScreen()),
      ),
    );
  }
}
