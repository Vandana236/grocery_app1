import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderhistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
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
              _header(),
              SizedBox(
                height: 10,
              ),
              Image.asset(
                "assets/images/oeder44.png",
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
                    "Let\'s Shop ",
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

_header() {
  return ListTile(
    leading: InkWell(
      onTap: () => Get.back(),
      child: Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
      ),
    ),
    title: Text(
      "Order History",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 22,
      ),
    ),
  );
}
