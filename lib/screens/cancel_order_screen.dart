import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CancelOrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cancel Order",
          style: textTheme.headline6,
        ),
      ),
      backgroundColor: Color(0xfffdfdfd),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 10,
              ),
              Image.asset(
                "assets/images/cancelorder.png",
                fit: BoxFit.contain,
              ),
              SizedBox(
                height: 18,
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size.fromWidth(350.0),
                    minimumSize: Size.fromHeight(55),
                    primary: Color(0xffDC2E45),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () => Get.back(),
                  child: Text(
                    "Search Again ",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
