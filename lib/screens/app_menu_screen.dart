import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_onlineapp/screens/Rewards.dart';
import 'package:grocery_onlineapp/screens/aboutus.dart';
import 'package:grocery_onlineapp/screens/chat_screen.dart';
import 'package:grocery_onlineapp/screens/coupons_screen.dart';
import 'package:grocery_onlineapp/screens/language.dart';
import 'package:grocery_onlineapp/screens/login_screen.dart';
import 'package:grocery_onlineapp/screens/product_request_screen.dart';
import 'package:grocery_onlineapp/constants/image_constants.dart';
import 'package:grocery_onlineapp/controllers/user_profile_controller.dart';
import 'package:grocery_onlineapp/screens/all_categories_screen.dart';
import 'package:grocery_onlineapp/screens/teamsandcondition.dart';
import 'package:grocery_onlineapp/screens/top_deals_screen.dart';
import 'package:grocery_onlineapp/screens/track_order_screen.dart';
import 'package:grocery_onlineapp/screens/wallet.dart';
import 'package:grocery_onlineapp/widgets/app_menu_list_tile.dart';

import 'help.dart';

class AppMenuScreen extends StatelessWidget {
  final Function onBackPressed;
  AppMenuScreen({Key key , this.onBackPressed}) : super(key: key);

  // use object of user profile controller
  final UserProfileController userProfileController =
      Get.find<UserProfileController>();

  @override
  Widget build(BuildContext context) {
    // text theme
    TextTheme textTheme = Theme.of(context).textTheme;
    // screen height
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      //backgroundColor: Colors.red,
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.white,
          ),
          onPressed: () => onBackPressed()
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserInfoTile(
              userProfileController: userProfileController,
              textTheme: textTheme,
            ),
            Container(
              height: screenHeight * 0.15,
            ),
            Expanded(child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppMenuListTile(
                    label: "All Categories",
                    leadingIconUrl: ImageConstants.ALL_CATEGORIES_LOGO_URL,
                    onPressed: () => Get.to(() => AllCategoriesScreen()),
                  ),
                  SizedBox(height: 8.0),
                  AppMenuListTile(
                    label: "Top Deals",
                    leadingIconUrl: ImageConstants.TOP_DEALS_LOGO_URL,
                    onPressed: () => Get.to(() => TopDealsScreen()),
                  ),
                  SizedBox(height: 8.0),
                  AppMenuListTile(
                    label: "Make product requests",
                    leadingIconUrl: ImageConstants.PRODUCT_REQUEST_LOGO_URL,
                    onPressed: () => Get.to(() => ProductRequestScreen()),
                  ),
                  SizedBox(height: 8.0),
                  AppMenuListTile(
                    label: "Track your order",
                    leadingIconUrl: ImageConstants.TRACK_ORDER_LOGO_URL,
                    onPressed: () => Get.to(() => TrackOrderScreen()),
                  ),
                  SizedBox(height: 8.0),
                  AppMenuListTile(
                    label: "Coupons",
                    leadingIconUrl: ImageConstants.COUPONS_LOGO_URL,
                    onPressed: () => Get.to(() => CouponsScreen()),
                  ),
                  SizedBox(height: 8.0),
                  AppMenuListTile(
                    label: "Live Chat",
                    leadingIconUrl: ImageConstants.LIVE_CHAT_LOGO_URL,
                    onPressed: () => Get.to(() => ChatScreen()),
                  ),
                  SizedBox(height: 8.0),
                  AppMenuListTile(
                    label: "Rewards",
                    leadingIconUrl: ImageConstants.LIVE_CHAT_LOGO_URL,
                    onPressed: () => Get.to(() => Rewards()),
                  ),
                  SizedBox(height: 8.0),
                  AppMenuListTile(
                    label: "Wallet",
                    leadingIconUrl: ImageConstants.LIVE_CHAT_LOGO_URL,
                    onPressed: () => Get.to(() =>  Wallet()),
                  ),
                  SizedBox(height: 8.0),
                  AppMenuListTile(
                    label: "Terms & Condition",
                    leadingIconUrl: ImageConstants.LIVE_CHAT_LOGO_URL,
                    onPressed: () => Get.to(() =>  condition()),
                  ),
                  SizedBox(height: 8.0),
                  AppMenuListTile(
                    label: "Help",
                    leadingIconUrl: ImageConstants.LIVE_CHAT_LOGO_URL,
                    onPressed: () => Get.to(() =>  help()),
                  ),
                  SizedBox(height: 8.0),
                  AppMenuListTile(
                    label: "Languages",
                    leadingIconUrl: ImageConstants.LIVE_CHAT_LOGO_URL,
                    onPressed: () => Get.to(() =>  Languages ()),
                  ),
                  SizedBox(height: 8.0),
                  AppMenuListTile(
                    label: "About Us",
                    leadingIconUrl: ImageConstants.LIVE_CHAT_LOGO_URL,
                    onPressed: () => Get.to(() => about()),
                  ),
                  SizedBox(height: 8.0),
                  AppMenuListTile(
                    label: "Log Out",
                    leadingIconUrl: ImageConstants.LOGOUT_LOGO_URL,
                    onPressed: () => Get.offAll(() => LoginScreen()),
                  ),
                  SizedBox(height: 32)
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class UserInfoTile extends StatelessWidget {
  const UserInfoTile({
    Key key,
    @required this.userProfileController,
    @required this.textTheme,
  }) : super(key: key);

  final UserProfileController userProfileController;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage(ImageConstants.DUMMY_PROFILE_PICTURE_URL),
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                userProfileController.currentUser.name,
                style: textTheme.subtitle1.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
            ),
            SizedBox(height: 8),
            Text(
              userProfileController.currentUser.phoneNumber,
              style: textTheme.subtitle1.copyWith(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
