import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:grocery_onlineapp/constants/image_constants.dart';
import 'package:grocery_onlineapp/controllers/cart_controller.dart';
import 'package:grocery_onlineapp/generators/filter_list_generator.dart';
import 'package:grocery_onlineapp/widgets/cart_item_count_button.dart';
import 'package:grocery_onlineapp/widgets/filter_search_bottom_sheet.dart';
import 'package:grocery_onlineapp/widgets/my_chip.dart';
import 'package:grocery_onlineapp/widgets/my_text_box.dart';
import 'package:grocery_onlineapp/widgets/products_menu.dart';

class SearchResultsScreen extends StatelessWidget {
  @required
  final String searchParams;

  SearchResultsScreen({Key key, this.searchParams}) : super(key: key);

  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    // text theme
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16.0,
                      ),
                      child: SearchScreenHeader(
                        initialText: searchParams,
                      ),
                    ),
                    Container(
                      height: 80,
                      child: CategoriesListButtons(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Text(
                        "6 Items Found",
                        style: textTheme.headline6,
                      ),
                    ),
                    ProductsMenu(),
                  ],
                ),
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

class SearchScreenHeader extends StatelessWidget {
  const SearchScreenHeader({Key key, @required this.initialText})
      : super(key: key);
  final String initialText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        SizedBox(width: 8),
        MyTextBox(
          autofocus: true,
          suffixIcon: Icon(
            Icons.cancel,
            color: Theme.of(context).primaryColor,
          ),
          prefixIcon: Icon(
            Icons.search_outlined,
            color: Colors.grey[800],
          ),
          hintText: "Search products...",
          initialText: initialText,
          textCapitalization: TextCapitalization.words,
          onChanged: (value) {},
        ),
        SizedBox(width: 8),
        Center(
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
