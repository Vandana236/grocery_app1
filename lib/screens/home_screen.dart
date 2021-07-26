import 'package:get/get.dart';
import 'package:grocery_onlineapp/controllers/cart_controller.dart';
import 'package:grocery_onlineapp/controllers/user_profile_controller.dart';
import 'package:grocery_onlineapp/screens/app_drawer_wrapper_screen.dart';
import 'package:grocery_onlineapp/screens/cart_screen.dart';
import 'package:grocery_onlineapp/screens/order_history_screen.dart';
import 'package:grocery_onlineapp/screens/search_screen.dart';
import 'package:grocery_onlineapp/screens/user_profile_screen.dart';
import 'package:grocery_onlineapp/widgets/my_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
    final Function onAppDrawerButtonPressed;
  const HomeScreen({Key key , this.onAppDrawerButtonPressed}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  // instantiate object of user profile controller
  final UserProfileController userProfileController =
      Get.put(UserProfileController());

  // instantiate object of cart controller
  final CartController cartController = Get.put(CartController());

  
  @override
  Widget build(BuildContext context) {
    // list of items to be displayed on home screen.
    final List<Widget> _homeScreenItems = [
    AppDrawerWrapperScreen(),
    Container(),
    Container(),
    OrderHistoryScreen(),
    UserProfileScreen(),
  ];

    return Scaffold(
      body: _homeScreenItems[_currentIndex],
      // bottom navigation var
      bottomNavigationBar: MyBottomNavigationBar(onTap: (value) {
        if (value == 1) return Get.to(() => SearchScreen());
        if (value == 2) return Get.to(() => CartScreen());
        setState(() {
          _currentIndex = value;
        });
      }),
      // FAB
      floatingActionButton: FloatingActionButton(
        //backgroundColor: Colors.red,
        child: Icon(
          Icons.add_shopping_cart_outlined,
          color: Colors.white,
        ),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CartScreen(),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
