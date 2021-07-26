import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductRequestListTile extends StatefulWidget {
  final String text;
  final String number;

  ProductRequestListTile({this.text, this.number});

  @override
  _ProductRequestListTileState createState() => _ProductRequestListTileState();
}

class _ProductRequestListTileState extends State<ProductRequestListTile> {
  double height = Get.height;

  double width = Get.width;

  Color color = const Color(0xffdd2e45);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  child: Center(child: Text(widget.number))),
              SizedBox(
                width: 10,
              ),
              Text(widget.text),
            ],
          ),
          IconButton(
            icon: Icon(
              Icons.cancel,
              color: color,
            ),
            onPressed: null,
            iconSize: 20,
          )
        ],
      ),
    );
  }
}
