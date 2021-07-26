import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:grocery_onlineapp/screens/user_profile_screen.dart';

class CardsScreen extends StatelessWidget {
  final double height = Get.height;
  final double width = Get.width;
  final Color color = const Color(0xffdd2e45);
  final imageList = [
    "assets/images/mcard.png",
    "assets/images/tcard.png",
    "assets/images/mccard.png",
    "assets/images/mcsampleblue.png",
    "assets/images/mcsample.png",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(),
              Container(
                height: height * 0.25,
                width: width,
                child: Swiper(
                  autoplay: true,
                  itemBuilder: (BuildContext context, int index) {
                    var image = "${imageList[index]}";
                    return new Image.asset(
                      image,
                      fit: BoxFit.fill,
                    );
                  },
                  itemCount: imageList.length,
                  pagination: new SwiperPagination(),
                  control: new SwiperControl(
                    color: Colors.transparent,
                    disableColor: Colors.transparent,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Add new Card",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _radioButton(),
                  _radioButton(),
                  _radioButton(),
                  _radioButton(),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              UserInfoTile(
                heading: "Cardholder name",
                value: "John Doe",
                onPressed: () {},
              ),
              SizedBox(
                height: 15,
              ),
              UserInfoTile(
                heading: "Cardholder number",
                value: "558813489889",
                onPressed: () {},
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: _customColumn(heading: "MM/YY", subHeading: "08 23"),
                  ),
                  Expanded(
                    child: _customColumn(heading: "CVV", subHeading: "784"),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: null,
                    checkColor: Colors.white,
                    activeColor: Colors.red,
                  ),
                  Text(
                    "Set as Default payment card",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
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
    ));
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
        "My Cards",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  _radioButton() {
    return Container(
      width: width * 0.11,
      child: Column(
        children: [
          Image.asset("assets/images/mclogo.png"),
          Radio(),
        ],
      ),
    );
  }

  _customForm({
    String heading,
    String subHeading,
    IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: TextStyle(color: Colors.grey),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(subHeading,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              Icon(
                icon,
                size: 20,
              ),
            ],
          ),
          //Text(subHeading, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          //Icon(icon),
        ],
      ),
    );
  }

  _customColumn({
    String heading,
    String subHeading,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: TextStyle(color: Colors.grey),
          ),
          Text(subHeading,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          Divider(
            color: Colors.grey.withOpacity(0.3),
            endIndent: 15,
            indent: 15,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
