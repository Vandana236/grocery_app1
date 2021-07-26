import 'package:get/get.dart';
import 'package:grocery_onlineapp/generators/cart_list_items_generator.dart';
import 'package:grocery_onlineapp/models/order_model.dart';

class OrderController extends GetxController {
  List<OrderModel> myOrders = new List<OrderModel>.empty(growable: true);

  OrderController() {
    // dummy orders
    myOrders.addAll([
      OrderModel(
        orderId: "#12990234",
        products: CART_ITEMS,
        orderPrice: 1440,
        orderStatus: "PENDING",
        orderTimestamp: DateTime.now(),
      ),
      OrderModel(
        orderId: "#12990235",
        products: CART_ITEMS,
        orderPrice: 1480,
        orderStatus: "PENDING",
        orderTimestamp: DateTime.now(),
      ),
      OrderModel(
        orderId: "#12990234",
        products: CART_ITEMS,
        orderPrice: 1440,
        orderStatus: "CANCELLED",
        orderTimestamp: DateTime.now(),
      ),
      OrderModel(
        orderId: "#12990234",
        products: CART_ITEMS,
        orderPrice: 1440,
        orderStatus: "DELIVERED",
        orderTimestamp: DateTime.now(),
      )
    ]);
  }
}
