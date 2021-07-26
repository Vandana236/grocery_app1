import 'package:get/get.dart';
import 'package:grocery_onlineapp/controllers/cart_controller.dart';
import 'package:grocery_onlineapp/generators/popular_items_generator.dart';
import 'package:grocery_onlineapp/models/product_model.dart';
import 'package:grocery_onlineapp/screens/product_description_screen.dart';
import 'package:grocery_onlineapp/theme/style.dart';
import 'package:flutter/material.dart';

class ProductsMenu extends StatelessWidget {
  const ProductsMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: POPULAR_ITEMS.length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        ProductModel productModel = POPULAR_ITEMS[index];
        return Column(
          children: [
            InkWell(
              onTap: () =>
                  Get.to(() => ProductDescriptionScreen(product: productModel)),
              child: PopularProductsMenuItem(product: productModel),
            ),
            SizedBox(height: 8)
          ],
        );
      },
    );
  }
}

class PopularProductsMenuItem extends StatefulWidget {
  PopularProductsMenuItem({
    Key key,
    @required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  _PopularProductsMenuItemState createState() =>
      _PopularProductsMenuItemState();
}

class _PopularProductsMenuItemState extends State<PopularProductsMenuItem> {
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    // text theme
    TextTheme textTheme = Theme.of(context).textTheme;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: 100 * screenHeight / 830,
      child: Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Color(0xffF7F7F7),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    widget.product.imageUrl,
                    height: 80,
                    width: 40,
                  ),
                ),
              ),
              SizedBox(width: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.productName,
                    style: textTheme.bodyText1
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    widget.product.shortDescription,
                    style: normalCaptionStyle(context),
                  )
                ],
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "\$ ${widget.product.productPrice}",
                    style: textTheme.bodyText1
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Spacer(),
                  _addButton(context)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _addButton(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        color: Theme.of(context).accentColor,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Icon(
            Icons.add,
            size: 16.0,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
