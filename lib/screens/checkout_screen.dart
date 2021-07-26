import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_onlineapp/controllers/user_profile_controller.dart';
import 'package:grocery_onlineapp/models/user_model.dart';
import 'package:grocery_onlineapp/screens/cart_screen.dart';
import 'package:grocery_onlineapp/screens/order_confirmation_screen.dart';
import 'package:grocery_onlineapp/utils/string_formatter.dart';
import 'package:grocery_onlineapp/widgets/address_info_card.dart';
import 'package:grocery_onlineapp/widgets/checout_screen_bottom_sheet.dart';
import 'package:grocery_onlineapp/widgets/date_time_selector.dart';
import 'package:grocery_onlineapp/widgets/payment_method_selector.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key key}) : super(key: key);

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  // user profile controller
  final UserProfileController userProfileController =
      Get.put(UserProfileController());

  // user profile data
  UserModel user;

  // currently selected address of user
  String _selectedAddressType;

  @override
  void initState() {
    super.initState();
    user = userProfileController.currentUser;
    _selectedAddressType = "HOME";
  }

  @override
  Widget build(BuildContext context) {
    // text theme
    TextTheme textTheme = Theme.of(context).textTheme;
    // sub-heading style
    TextStyle subHeadingStyle = textTheme.subtitle1.copyWith(
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Checkout",
          style: textTheme.headline6,
        ),
        actions: [
          AppBarActionButton(
            onPressed: () => Get.to(() => CartScreen()),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  "Shipping to",
                  style: subHeadingStyle,
                ),
              ),
              user.address.length < 1
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _selectedAddressType = "HOME";
                          });
                        },
                        child: AddressInfoCard(
                          isSelected: _selectedAddressType == "HOME",
                          addressModel:
                              userProfileController.currentUser.address[0],
                          value: "HOME",
                          groupValue: _selectedAddressType,
                          onChanged: (value) {
                            setState(() {
                              _selectedAddressType = value;
                            });
                          },
                          addressType: "Home",
                          address: StringFormatter.getAddress(user.address[0]),
                          phoneNumber: user.phoneNumber,
                        ),
                      ),
                    ),
              user.address.length < 2
                  ? Container()
                  : InkWell(
                      onTap: () {
                        setState(() {
                          _selectedAddressType = "OFFICE";
                        });
                      },
                      child: AddressInfoCard(
                        isSelected: _selectedAddressType == "OFFICE",
                        addressModel:
                            userProfileController.currentUser.address[1],
                        value: "OFFICE",
                        groupValue: _selectedAddressType,
                        onChanged: (value) {
                          setState(() {
                            _selectedAddressType = value;
                          });
                        },
                        addressType: "Office",
                        address: StringFormatter.getAddress(user.address[1]),
                        phoneNumber: user.officePhoneNumber,
                      ),
                    ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12.0),
                child: InkWell(
                  // onTap: () => Get.to(() => AddAddressScreen(
                  //   address: AddressModel(),
                  // )),
                  child: Text(
                    "Add new address",
                    style: textTheme.subtitle1.copyWith(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0, bottom: 8.0),
                child: Text(
                  "Preferred delivery time",
                  style: subHeadingStyle,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  DateTimeSelector(
                    heading: "Date",
                    value: "Sat, 10 June",
                  ),
                  Spacer(),
                  DateTimeSelector(
                    heading: "Time",
                    value: "9:00 AM - 10:00 AM",
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0, bottom: 8),
                child: Text(
                  "Payment method",
                  style: subHeadingStyle,
                ),
              ),
              PaymentMethodSelector(
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CheckoutScreenBottomSheet(
          onButtonPressed: () => Get.to(() => OrderConfirmationScreen())),
    );
  }
}

class AppBarActionButton extends StatelessWidget {
  final Function onPressed;

  const AppBarActionButton({
    Key key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          IconButton(
            icon: Icon(
              Icons.add_shopping_cart_outlined,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () => onPressed(),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: CircleAvatar(
              radius: 9,
              backgroundColor: Theme.of(context).primaryColor,
              child: Text("3"),
            ),
          ),
        ],
      ),
    );
  }
}
