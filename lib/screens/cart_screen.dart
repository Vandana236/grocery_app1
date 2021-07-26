import 'package:get/get.dart';
import 'package:grocery_onlineapp/controllers/cart_controller.dart';
import 'package:grocery_onlineapp/screens/checkout_screen.dart';
import 'package:grocery_onlineapp/screens/coupons_screen.dart';
import 'package:grocery_onlineapp/utils/navigation_utils.dart';
import 'package:grocery_onlineapp/widgets/cart_menu.dart';
import 'package:grocery_onlineapp/widgets/cart_screen_bottom_sheet.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key key}) : super(key: key);

  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    // text theme
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: textTheme.headline6,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Center(
              child: Obx(
                () => Text(
                  "${cartController.cartItems.length} items",
                  style: textTheme.subtitle1.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 16.0,
                left: 16,
                right: 16,
                bottom: 0,
              ),
              child: CartMenu(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextButton.icon(
                onPressed: () => Navigator.of(context).push(
                  NavigationUtils.createAnimatedRoute(
                    1.0,
                    CouponsScreen(),
                  ),
                ),
                icon: Icon(
                  Icons.local_offer_outlined,
                  color: Theme.of(context).primaryColor,
                ),
                label: Text(
                  "Apply discount code",
                  style: textTheme.subtitle1,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CartScreenBottomSheet(
        onButtonPressed: () => Navigator.of(context).push(
          NavigationUtils.createAnimatedRoute(
            1.0,
            CheckoutScreen(),
          ),
        ),
      ),
    );
  }
}
