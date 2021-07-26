import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_onlineapp/controllers/cart_controller.dart';
import 'package:grocery_onlineapp/models/product_model.dart';
import 'package:grocery_onlineapp/theme/style.dart';

class CartMenu extends StatelessWidget {
  CartMenu({Key key}) : super(key: key);

  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Obx(
      () => ListView.separated(
        separatorBuilder: (context , index) => SizedBox(height: 16),
        shrinkWrap: true,
        itemCount: cartController.cartItems.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          ProductModel productModel = cartController.cartItems[index];
          return Dismissible(
            key: ObjectKey(productModel.productName),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              cartController.removeProduct(productModel);
            },
            background: _backgroundContainer(context , screenHeight),
            child: CartMenuItem(productModel: productModel),
          );
        },
      ),
    );
  }

  Widget _backgroundContainer(BuildContext context , double screenHeight) {
    return Column(
      children: [
        SizedBox(height: 8),
        Wrap(
          children: [
            Container(
               height: 80 * screenHeight / 830,
              color: Theme.of(context).errorColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 32),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CartMenuItem extends StatelessWidget {
  CartMenuItem({
    Key key,
    @required this.productModel,
  }) : super(key: key);

  final ProductModel productModel;
  final CartController cartController = Get.find<CartController>();

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
          padding: const EdgeInsets.all(12.0),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    productModel.imageUrl,
                    height: 80,
                    width: 40,
                  ),
                  SizedBox(width: 8.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productModel.productName,
                        style: textTheme.bodyText1.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        productModel.shortDescription,
                        style: normalCaptionStyle(context),
                      )
                    ],
                  ),
                  Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "\$ ${productModel.productPrice}",
                        style: textTheme.bodyText1.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  )
                ],
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () =>
                          cartController.decreaseQuantity(productModel),
                      child: Text(
                        "-",
                        style: textTheme.subtitle1,
                      ),
                    ),
                    SizedBox(width: 16),
                    Text(
                      productModel.quantity.toString(),
                      style: textTheme.subtitle1,
                    ),
                    SizedBox(width: 16),
                    InkWell(
                      onTap: () => cartController.addToCart(productModel),
                      child: Text(
                        "+",
                        style: textTheme.subtitle1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
