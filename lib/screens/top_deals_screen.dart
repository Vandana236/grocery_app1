import 'package:get/get.dart';
import 'package:grocery_onlineapp/controllers/cart_controller.dart';
import 'package:grocery_onlineapp/generators/category_generator.dart';
import 'package:grocery_onlineapp/screens/search_screen.dart';
import 'package:grocery_onlineapp/widgets/bundle_offers_menu.dart';
import 'package:grocery_onlineapp/widgets/cart_item_count_button.dart';
import 'package:grocery_onlineapp/widgets/my_chip.dart';
import 'package:grocery_onlineapp/widgets/products_menu.dart';
import 'package:flutter/material.dart';

class TopDealsScreen extends StatefulWidget {
  TopDealsScreen({Key key}) : super(key: key);

  @override
  _TopDealsScreenState createState() => _TopDealsScreenState();
}

final CartController cartController = Get.put(CartController());

class _TopDealsScreenState extends State<TopDealsScreen> {
  @override
  Widget build(BuildContext context) {
    // text theme
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Top Deals",
          style: textTheme.headline6,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search_outlined),
            onPressed: () => Get.to(() => SearchScreen()),
          )
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 80,
                    child: CategoriesListButtons(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      "Bundle Offers",
                      style: textTheme.headline6,
                    ),
                  ),
                  BundleOffersMenu(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      "Popular",
                      style: textTheme.headline6,
                    ),
                  ),
                  ProductsMenu(),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Obx(
              () => cartController.cartItems.isEmpty
                  ? Container()
                  : Align(
                      alignment: Alignment.bottomCenter,
                      child: CartItemCountButton(
                        itemCount: cartController.cartItems.length,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoriesListButtons extends StatefulWidget {
  const CategoriesListButtons({
    Key key,
  }) : super(key: key);

  @override
  _CategoriesListButtonsState createState() => _CategoriesListButtonsState();
}

class _CategoriesListButtonsState extends State<CategoriesListButtons> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: CATEGORIES.length,
      itemBuilder: (context, index) {
        return Row(
          children: [
            MyChip(
              isSelected: _selectedIndex == index,
              onPressed: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              label: CATEGORIES[index].categoryName,
            ),
            SizedBox(width: 16),
          ],
        );
      },
    );
  }
}
