import 'package:grocery_onlineapp/models/product_model.dart';

class OrderModel {
  String orderId;
  String orderStatus; // DELIVERED | PENDING | CANCELLED
  List<ProductModel> products;
  double orderPrice;
  DateTime orderTimestamp;

  OrderModel(
      {this.orderId,
      this.orderPrice,
      this.orderStatus,
      this.orderTimestamp,
      this.products});

  OrderModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    orderTimestamp = json['order_timestamp'];
    orderStatus = json['order_stauts'];
    if (json['products'] != null) {
      products = [];
    }
    json['products'].forEach((v) {
      products.add(new ProductModel.fromJson(v));
    });
    orderPrice = json['order_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['order_timestamp'] = this.orderTimestamp;
    data['order_status'] = this.orderStatus;
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    data['order_price'] = this.orderPrice;
    return data;
  }
}
