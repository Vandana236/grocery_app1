import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_onlineapp/widgets/my_text_field.dart';
import 'package:grocery_onlineapp/widgets/product_request_list_tile.dart';

class ProductRequestScreen extends StatelessWidget {
  final double height = Get.height;
  final double width = Get.width;
  final Color color = const Color(0xffdd2e45);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              _header(),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  "Can't find your desired items in the shop? ",
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: ListTile(
                  leading: Icon(
                    Icons.cloud_upload_outlined,
                    color: color,
                  ),
                  title: Text(
                    "Upload Image",
                    style: TextStyle(
                      //   fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Text(
                    "Choose image of your shopping list from gallery",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text("Give us a list of products",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 10,
              ),
              ProductRequestListTile(
                number: "1",
                text: "Rice",
              ),
              ProductRequestListTile(
                number: "2",
                text: "Eggs",
              ),
              ProductRequestListTile(
                number: "3",
                text: "Lentils",
              ),
              ProductRequestListTile(
                number: "4",
                text: "Chicken",
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.withOpacity(0.1),
                          ),
                          child: Center(child: Text("5"))),
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      flex: 8,
                      child: MyTextField(
                        hintText: "Enter item",
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: ListTile(
                  leading: Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                  title: Text(
                    "Add new item",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: height * 0.07,
                      width: width * 0.9,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                      ),
                      child: Center(
                          child: Text(
                        "Submit",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
        "Make Product Request",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 22,
        ),
      ),
    );
  }
}
