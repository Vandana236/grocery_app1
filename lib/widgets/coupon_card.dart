import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CouponsCard extends StatefulWidget {
  final String discount;
  final Color redeemColor;
  final String title;
  final String subTitle;

  CouponsCard({this.title, this.subTitle, this.redeemColor, this.discount});

  @override
  _CouponsCardState createState() => _CouponsCardState();
}

class _CouponsCardState extends State<CouponsCard> {
  Color color = const Color(0xffdd2e45);

  double height = Get.height;

  double width = Get.width;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.withOpacity(0.3),
          ),
        ),
        height: height * 0.18,
        width: width,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.discount,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Row(
                    children: [
                      Container(
                        height: height * 0.040,
                        width: width * 0.2,
                        child: Center(
                            child: Text(
                          "123ABC",
                          style: TextStyle(color: Colors.grey),
                        )),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: height * 0.040,
                        width: width * 0.2,
                        child: Center(
                            child: Text("Redeem",
                                style: TextStyle(color: Colors.white))),
                        decoration: BoxDecoration(
                          color: widget.redeemColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                          border: Border.all(color: Colors.transparent),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  Text(
                    widget.subTitle,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              Row(
                children: [
                  Flexible(
                    flex: 7,
                    child: LinearPercentIndicator(
                      width: 200.0,
                      lineHeight: 5.0,
                      percent: 0.7,
                      backgroundColor: Colors.grey.withOpacity(0.3),
                      progressColor: color,
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: Row(
                      children: [
                        Text(
                          "4/5 orders",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}