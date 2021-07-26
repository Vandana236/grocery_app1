import 'package:get/get.dart';
import 'package:grocery_onlineapp/generators/cart_list_items_generator.dart';
import 'package:grocery_onlineapp/models/product_model.dart';

class CartController extends GetxController {
  RxList<ProductModel> cartItems = [...CART_ITEMS].obs;

  /// add new product to cart
  void addToCart(ProductModel product) {
    if (cartItems.contains(product)) {
      int index = cartItems.indexOf(product);
      cartItems.remove(product);
      product.quantity += 1;
      cartItems.insert(index, product);
    } else {
      if (product.quantity == 0) {
        product.quantity += 1;
      }
      cartItems.add(product);
    }
  }

  /// decrease quantity of a product from cart
  void decreaseQuantity(ProductModel product) {
    if (cartItems.contains(product)) {
      int index = cartItems.indexOf(product);
      cartItems.remove(product);
      if (product.quantity > 1) {
        product.quantity -= 1;
        cartItems.insert(index, product);
      }
    }
  }

  /// remove a product from cart
  void removeProduct(ProductModel product) {
    if (cartItems.contains(product)) {
      cartItems.remove(product);
    }
  }
}
