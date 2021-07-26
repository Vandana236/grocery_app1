import 'package:get/get.dart';
import 'package:grocery_onlineapp/controllers/cart_controller.dart';
import 'package:grocery_onlineapp/generators/bundle_offer_generator.dart';
import 'package:grocery_onlineapp/models/product_model.dart';
import 'package:grocery_onlineapp/theme/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BundleOffersMenu extends StatefulWidget {
  final Function(int) onSelected;

  const BundleOffersMenu({Key key, this.onSelected}) : super(key: key);

  @override
  _BundleOffersMenuState createState() => _BundleOffersMenuState();
}

class _BundleOffersMenuState extends State<BundleOffersMenu> {

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * 264 / 796,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: BUNDLE_OFFERS.length,
          itemBuilder: (context, index) {
            ProductModel productModel = BUNDLE_OFFERS[index];
           if(index == 0){
             return Row(
               children: [
                 SizedBox(width: 16),
                 BundleOffersMenuItem(product: productModel),
                 SizedBox(width: 8),
               ],
             );
           }
              if(index == BUNDLE_OFFERS.length - 1){
                return Row(
                  children: [
                    BundleOffersMenuItem(product: productModel),
                    SizedBox(width: 16),
                  ],
                );
              }
            return Row(
              children: [
                BundleOffersMenuItem(product: productModel),
                SizedBox(width: 8),
              ],
            );
          }),
    );
  }
}

class BundleOffersMenuItem extends StatefulWidget {
  const BundleOffersMenuItem({
    Key key,
    @required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  _BundleOffersMenuItemState createState() => _BundleOffersMenuItemState();
}

class _BundleOffersMenuItemState extends State<BundleOffersMenuItem> {
  final CartController cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    // text theme
    TextTheme textTheme = Theme.of(context).textTheme;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 220 / 411,
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Color(0xffF4F4F4),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(4.0),
        ),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(),
              Image.asset(
                widget.product.imageUrl,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              SizedBox(height: 8),
              Text(
                widget.product.productName,
                style: textTheme.bodyText1
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Text(widget.product.shortDescription,
                    style: normalCaptionStyle(context)),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "\$ ${widget.product.productPrice}",
                    style: textTheme.bodyText1
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Spacer(),
                  _addButton(context),
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
      onTap: () {
      },
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
