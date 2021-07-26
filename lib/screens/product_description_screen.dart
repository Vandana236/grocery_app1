import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_onlineapp/constants/image_constants.dart';
import 'package:grocery_onlineapp/controllers/cart_controller.dart';
import 'package:grocery_onlineapp/models/product_model.dart';
import 'package:grocery_onlineapp/screens/cart_screen.dart';
import 'package:grocery_onlineapp/widgets/bottom_button.dart';

class ProductDescriptionScreen extends StatefulWidget {
  final ProductModel product;

  ProductDescriptionScreen({Key key, this.product}) : super(key: key);

  @override
  _ProductDescriptionScreenState createState() =>
      _ProductDescriptionScreenState();
}

class _ProductDescriptionScreenState extends State<ProductDescriptionScreen> {
  final CartController cartController = Get.put(CartController());

  // check if add to cart button is pressed once
  bool _isAddedToCart = false;

  @override
  Widget build(BuildContext context) {
    // text theme
    TextTheme textTheme = Theme.of(context).textTheme;
    // screen width
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          AppBarActionButton(
            onPressed: () => Get.to(CartScreen()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: screenWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 32.0),
                child: Center(
                  child: Image.asset(
                    ImageConstants.KOKO_KRUNCH_IMAGE_URL,
                  ),
                ),
              ),
            ),
            _productNameAndPrice(textTheme),
            _productWeightAndQuantity(textTheme),
            _subHeading(textTheme, "Description"),
            _productDescription(textTheme),
            _subHeading(textTheme, "Related Products"),
            _relatedProducts(textTheme),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 32,
              ),
              child: BottomButton(
                loadingState: false,
                disabledState: false,
                onPressed: () {
                  if (!_isAddedToCart) {
                    cartController.addToCart(widget.product);
                  }
                  if (cartController.cartItems.contains(widget.product)) {
                    setState(() {
                      _isAddedToCart = true;
                    });
                  } else {
                    setState(() {
                      _isAddedToCart = false;
                    });
                  }
                },
                child: !_isAddedToCart
                    ? Text("Add to Cart")
                    : _cartButton(textTheme),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _cartButton(TextTheme textTheme) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: 16),
        InkWell(
          onTap: () => cartController.decreaseQuantity(widget.product),
          child: Text(
            "-",
            style: textTheme.subtitle1.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(width: 16),
        Obx(
          () {
            String quantity = cartController.cartItems.contains(widget.product)
                ? cartController
                    .cartItems[cartController.cartItems.indexOf(widget.product)]
                    .quantity
                    .toString()
                : "0";
            return Text(
              quantity,
              style: textTheme.subtitle1.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            );
          },
        ),
        SizedBox(width: 16),
        InkWell(
          child: InkWell(
            onTap: () => cartController.addToCart(widget.product),
            child: Text(
              "+",
              style: textTheme.subtitle1
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
        Spacer(),
        CircleAvatar(
          radius: 15,
          backgroundColor: Colors.white,
          child: Icon(
            Icons.shopping_cart_outlined,
            color: Theme.of(context).primaryColor,
          ),
        ),
        SizedBox(width: 16),
        Obx(
    () => Text(
            cartController.cartItems.contains(widget.product)
                ? "Total:  \$1650"
                : "Total:  \$0",
            style: textTheme.button,
          ),
        )
      ],
    );
  }

  Widget _relatedProducts(TextTheme textTheme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Image.asset(
                ImageConstants.MILK_IMAGE_URL,
              ),
              SizedBox(height: 4),
              Text(
                "Milk",
                style: textTheme.bodyText1,
              ),
            ],
          ),
          Column(
            children: [
              Image.asset(
                ImageConstants.SUGAR_IMAGE_URL,
              ),
              SizedBox(height: 4),
              Text(
                "Sugar",
                style: textTheme.bodyText1,
              )
            ],
          ),
          Column(
            children: [
              Image.asset(
                ImageConstants.OATS_IMAGE_URL,
              ),
              SizedBox(height: 4),
              Text(
                "Oats",
                style: textTheme.bodyText1,
              )
            ],
          ),
          Column(
            children: [
              Image.asset(
                ImageConstants.BOOST_IMAGE_URL,
              ),
              SizedBox(height: 4),
              Text(
                "Boost",
                style: textTheme.bodyText1,
              )
            ],
          ),
          Column(
            children: [
              Image.asset(
                ImageConstants.KALLOGES_IMAGE_URL,
              ),
              SizedBox(height: 4),
              Text(
                "Kelloggs",
                style: textTheme.bodyText1,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _subHeading(TextTheme textTheme, String value) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        value,
        style: textTheme.subtitle1.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _productDescription(TextTheme textTheme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        "Nestle koko krunch breakfast cereal is made with whole grain which contains more dietary fibre, nutrition values  and important minerals like iron and calcium which is really important for healthy red blood cells and bone development in children",
        style: textTheme.bodyText1.copyWith(
          height: 1.3,
        ),
      ),
    );
  }

  Widget _productWeightAndQuantity(TextTheme textTheme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Weight:  330 grams",
            style: textTheme.caption,
          ),
          Spacer(),
          InkWell(
            onTap: () => cartController.decreaseQuantity(widget.product),
            child: Text(
              "-",
              style: textTheme.subtitle1,
            ),
          ),
          SizedBox(width: 16),
          Obx(
            () {
              String quantity =
                  cartController.cartItems.contains(widget.product)
                      ? cartController
                          .cartItems[
                              cartController.cartItems.indexOf(widget.product)]
                          .quantity
                          .toString()
                      : "0";
              return Text(
                quantity,
                style: textTheme.subtitle1,
              );
            },
          ),
          SizedBox(width: 16),
          InkWell(
            child: InkWell(
              onTap: () => cartController.addToCart(widget.product),
              child: Text(
                "+",
                style: textTheme.subtitle1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _productNameAndPrice(TextTheme textTheme) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.product.productName,
            style: textTheme.headline6,
          ),
          Text(
            "\$ ${widget.product.productPrice}",
            style: textTheme.headline6,
          ),
        ],
      ),
    );
  }
}

class AppBarActionButton extends StatelessWidget {
  final Function onPressed;

  const AppBarActionButton({
    Key key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          IconButton(
            icon: Icon(
              Icons.add_shopping_cart_outlined,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () => onPressed(),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: CircleAvatar(
              radius: 9,
              backgroundColor: Theme.of(context).primaryColor,
              child: Text("3"),
            ),
          ),
        ],
      ),
    );
  }
}
