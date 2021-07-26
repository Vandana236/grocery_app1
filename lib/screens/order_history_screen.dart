import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_onlineapp/controllers/order_controller.dart';
import 'package:grocery_onlineapp/models/order_model.dart';
import 'package:grocery_onlineapp/widgets/order_hsitory_card.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({Key key}) : super(key: key);

  @override
  _OrderHistoryScreenState createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  // private variable to switch tabs between orders
  int _tabIndex = 0;
  // filter list of orders according to tabs
  List<OrderModel> _filterOrders;
  // order controller
  OrderController orderController = Get.put(OrderController());

  @override
  void initState(){
    super.initState();
  _filterOrders  = orderController.myOrders
    .where((element) => element.orderStatus == "PENDING")
    .toList();
  }


  @override
  Widget build(BuildContext context) {
    // text theme
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Order History",
          style: textTheme.headline6,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 32.0, bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: _tabIndex == 0
                              ? Theme.of(context).primaryColor
                              : Colors.grey[100],
                        ),
                        onPressed: () {
                          setState(() {
                            _tabIndex = 0;
                            _filterOrders = orderController.myOrders
                                .where((element) =>
                                    element.orderStatus == "PENDING")
                                .toList();
                          });
                        },
                        child: Text(
                          "Active Orders",
                          style: textTheme.button.copyWith(
                            color: _tabIndex == 0 ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: _tabIndex == 1
                              ? Theme.of(context).primaryColor
                              : Colors.grey[100],
                        ),
                        onPressed: () {
                          setState(() {
                            _tabIndex = 1;
                            _filterOrders = orderController.myOrders
                                .where((element) =>
                                    element.orderStatus == "CANCELLED" ||
                                    element.orderStatus == "DELIVERED")
                                .toList();
                          });
                        },
                        child: Text(
                          "Past Orders",
                          style: textTheme.button.copyWith(
                            color: _tabIndex == 1 ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: _filterOrders.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  OrderModel order = _filterOrders[index];
                  return Column(
                    children: [
                      OrderHistoryCard(
                        order: order,
                      ),
                      SizedBox(height: 8)
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
