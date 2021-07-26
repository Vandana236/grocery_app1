import 'package:flutter/material.dart';
import 'package:grocery_onlineapp/generators/popular_items_generator.dart';
import 'package:grocery_onlineapp/models/product_model.dart';
import 'package:grocery_onlineapp/theme/style.dart';

class OrderDetailsCard extends StatelessWidget {
  const OrderDetailsCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // text theme
    TextTheme textTheme = Theme.of(context).textTheme;
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Items",
                  style: textTheme.bodyText1.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.edit_outlined,
                  color: Colors.black,
                )
              ],
            ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              ProductModel productModel = POPULAR_ITEMS[index];
              return Column(
                children: [
                  OrderedProductsMenuItem(productModel: productModel),
                  SizedBox(height: 8)
                ],
              );
            },
          ),
        ),
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
          ],
        ),
      ),
    );
  }
}


class OrderedProductsMenuItem extends StatelessWidget {
  const OrderedProductsMenuItem({
    Key key,
    @required this.productModel,
  }) : super(key: key);

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    // text theme
    TextTheme textTheme = Theme.of(context).textTheme;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: 100 * screenHeight / 830,
      child: Card(
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Color(0xffF7F7F7),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  productModel.imageUrl,
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
                  productModel.productName,
                  style: textTheme.bodyText1
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 8.0),
                Text(
                  productModel.shortDescription,
                  style: normalCaptionStyle(context),
                )
              ],
            ),
            Spacer(),
            Text(
              "\$ ${productModel.productPrice}",
              style: textTheme.bodyText1
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}

