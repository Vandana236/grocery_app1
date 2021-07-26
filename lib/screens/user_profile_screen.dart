import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_onlineapp/constants/image_constants.dart';
import 'package:grocery_onlineapp/controllers/user_profile_controller.dart';
import 'package:grocery_onlineapp/screens/cards_screen.dart';
import 'package:grocery_onlineapp/widgets/profile_picture.dart';

class UserProfileScreen extends StatelessWidget {
  UserProfileScreen({Key key}) : super(key: key);

  // use object of user profile controller
  final UserProfileController userProfileController =
      Get.find<UserProfileController>();

  @override
  Widget build(BuildContext context) {
    // text theme
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "User Profile",
          style: textTheme.headline6,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32.0),
                child: Center(
                  child: ProfilePicture(
                    profilePictureUrl: ImageConstants.DUMMY_PROFILE_PICTURE_URL,
                  ),
                ),
              ),
              Center(
                child: Text(
                  userProfileController.currentUser.name,
                  style: textTheme.headline6,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UserOrdersDashboardBox(
                      heading: "Orders",
                      value:
                          userProfileController.currentUser.orders.toString(),
                    ),
                    UserOrdersDashboardBox(
                      value:
                          "\$ ${userProfileController.currentUser.moneySaved}",
                      heading: "Saved",
                    ),
                    UserOrdersDashboardBox(
                      value:
                          "\$ ${userProfileController.currentUser.moneySpent}",
                      heading: "Spent",
                    ),
                  ],
                ),
              ),
              UserInfoTile(
                heading: "Mobile Number",
                value: userProfileController.currentUser.phoneNumber,
              ),
              SizedBox(height: 8),
              UserInfoTile(
                heading: "Address",
                onPressed: () {},
                value: userProfileController.currentUser.address[0].houseNumber,
              ),
              SizedBox(height: 8),
              UserInfoTile(
                heading: "Email",
                value: userProfileController.currentUser.email,
              ),
              SizedBox(height: 16),
              UserInfoTile(
                heading: "Change Password",
                onPressed: () {},
                leadingIcon: Icon(
                  Icons.lock_outline,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16),
              UserInfoTile(
                heading: "Select default payment card",
                onPressed: () => Get.to(() => CardsScreen()),
                leadingIcon: Icon(
                  Icons.credit_card_outlined,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserInfoTile extends StatelessWidget {
  const UserInfoTile(
      {Key key,
      @required this.heading,
      this.value,
      this.leadingIcon,
      this.onPressed})
      : super(key: key);

  final String value;
  final Widget leadingIcon;
  final String heading;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    // text theme
    TextTheme textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () => onPressed(),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  leadingIcon ?? Container(),
                  leadingIcon == null ? Container() : SizedBox(width: 8),
                  Text(
                    heading,
                    style: textTheme.bodyText1.copyWith(
                        fontWeight: value == null
                            ? FontWeight.bold
                            : FontWeight.normal),
                  ),
                ],
              ),
              SizedBox(height: 8),
              value == null
                  ? Container()
                  : Text(
                      value,
                      style: textTheme.bodyText1.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              value == null ? Container() : SizedBox(height: 8),
              Divider(
                thickness: 2.0,
              ),
            ],
          ),
          onPressed == null
              ? Container()
              : Positioned(
                  bottom: 24,
                  right: 0,
                  child: Icon(
                    Icons.chevron_right,
                    color: Colors.black,
                  ),
                ),
        ],
      ),
    );
  }
}

class UserOrdersDashboardBox extends StatelessWidget {
  const UserOrdersDashboardBox({
    Key key,
    @required this.heading,
    @required this.value,
  }) : super(key: key);

  final String heading;
  final String value;

  @override
  Widget build(BuildContext context) {
    // text theme
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Text(
          heading,
          style: textTheme.subtitle1.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 8),
        Text(
          value,
          style: textTheme.caption,
        )
      ],
    );
  }
}
