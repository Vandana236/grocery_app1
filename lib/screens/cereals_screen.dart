import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:grocery_onlineapp/constants/image_constants.dart';
import 'package:grocery_onlineapp/controllers/cart_controller.dart';
import 'package:grocery_onlineapp/generators/filter_list_generator.dart';
import 'package:grocery_onlineapp/widgets/cart_item_count_button.dart';
import 'package:grocery_onlineapp/widgets/filter_search_bottom_sheet.dart';
import 'package:grocery_onlineapp/widgets/my_chip.dart';
import 'package:grocery_onlineapp/widgets/products_menu.dart';
import 'package:flutter/material.dart';

class CerealsScreen extends StatefulWidget {
  const CerealsScreen({Key key}) : super(key: key);

  @override
  _CerealsScreenState createState() => _CerealsScreenState();
}

class _CerealsScreenState extends State<CerealsScreen> {
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    // text theme
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cereals",
          style: textTheme.headline6,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => Wrap(
                    children: [
                      FilterSearchBottomSheet(),
                    ],
                  ),
                );
              },
              child: SvgPicture.asset(
                ImageConstants.FILTER_SEARCH_LOGO_URL,
                height: 25,
              ),
            ),
          ),
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
      itemCount: FILTER_LIST.length,
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
              label: FILTER_LIST[index],
            ),
            SizedBox(width: 16),
          ],
        );
      },
    );
  }
}
