
import 'package:flutter/material.dart';
import 'package:grocery_onlineapp/baseurlg/languagecubit/changePassword.dart';
import 'package:grocery_onlineapp/baseurlg/languagecubit/resetpasswordno.dart';
import 'package:grocery_onlineapp/baseurlg/languagecubit/varification.dart';
import 'package:grocery_onlineapp/screens/Sign_Up.dart';
import 'package:grocery_onlineapp/screens/home_screen.dart';
import 'package:grocery_onlineapp/screens/login_screen.dart';
import 'package:grocery_onlineapp/screens/otp_screen.dart';

class PageRoutes {
  static const String signInRoot = 'signIn/';
  static const String signUp = 'signUp';
  static const String verification = 'verification';
  static const String restpassword1 = 'restpassword1';
  static const String restpassword2 = 'restpassword2';
  static const String restpassword3 = 'restpassword3';

  static const String sidebar = '/side_bar';
  static const String viewall = '/viewall';
  static const String homePage = '/home_page';
  // static const String all_category = '/all_category';
  static const String cat_product = '/cat_product';
  static const String product = '/product';

   static const String cart = '/cart';
  static const String search = '/search';
  // static const String searchhistory = '/searchhistory';
  static const String cat_sub_p = '/catsubp';
  static const String tagproduct = '/tagproduct';
  static const String reviewsall = '/reviewsall';

//  static const String confirmOrder = 'confirm_order';
  static const String cartPage = 'checkout';
  static const String selectAddress = 'selectAddress';
  static const String editAddress = 'editAddress';
  static const String paymentMode = 'paymentMode';
  static const String confirmOrder = 'confirmOrder';
  static const String orderdetailspage = 'orderdetailspage';
  static const String myorder = 'myorder';
  static const String addaddressp = 'addaddressp';
  static const String stripecard = 'stripecard';
  static const String invoice = 'invoice';
  static const String langnewf = '/langnewf';
  static const String sellerinfo = '/sellerinfo';
  static const String offerpage = '/offerpage';
  static const String yourbasket = '/yourbasket';
  static const String deliveryoption = '/deliveryoption';
  static const String support = '/support';
  static const String sharescreen = '/sharescreen';
  static const String tncPage = '/tncpage';
  static const String aboutusscreen = '/aboutusscreen';
  static const String favouriteitem = '/favouriteitem';
  static const String myaccount = '/myaccount';
  static const String orderscreen = '/orderscreen';
  static const String walletscreen = '/walletscreen';
  static const String paymentOption = '/paymentoption';
  static const String orderdetails = '/orderdetials';
  static const String trackorder = '/trackorder';
  static const String myaddress = '/myaddress';
  static const String notification = '/notification';
  static const String paymentdoned = '/paymentdoned';
  static const String settingsAccount = '/settingaccount';

  Map<String, WidgetBuilder> routes() {
    return {
      //signInRoot: (context) => LoginScreen(),
      homePage: (context) => HomeScreen(),
      // // all_category: (context) => AllCategory(),
      // cat_product: (context) => CategoryProduct(),
      // product: (context) => ProductInfo(),
      // // cart: (context) => CheckOutNavigator(),
      // search: (context) => SearchEan(),
      // // searchhistory: (context) => SearchHistory(),
      // cat_sub_p: (context) => CategorySubProduct(),
      // tagproduct: (context) => TagsProduct(),
      // reviewsall: (context) => Reviews(),
      // cartPage: (context) => YourBasket(),
      // // selectAddress: (context) => AddressPage(),
      // editAddress: (context) => EditAddressPage(),
      // // orderdetailspage: (context) => OrderDeatilsPage(),
      // // paymentMode: (context) => PaymentModePage(),
      // confirmOrder: (context) => ConfirmOrderPage(),
      // myorder: (context) => MyOrders(),
      // addaddressp: (context) => AddAddressPage(),
      // stripecard: (context) => MyStripeCard(),
      // invoice: (context) => MyInvoicePdf(),
      signInRoot: (context) => LoginScreen(),
      signUp: (context) => SignUp(),
      verification: (context) => VerificationPage(),
      restpassword1: (context) => NumberScreenRestPassword(),
     restpassword2: (context) => ResetOtpVerify(),
      restpassword3: (context) => ChangePassword(),
      // viewall: (context) => ViewAllProduct(),
      // langnewf: (context) => ChooseLanguageNew(),
      // sellerinfo: (context) => SellerInfo(),
      // offerpage: (context) => OffersPage(),
      // yourbasket: (context) => YourBasket(),
      // deliveryoption: (context) => DeliveryOption(),
      // support: (context) => ContactUsPage(),
      // sharescreen: (context) => RefferScreen(),
      // tncPage: (context) => TNCPage(),
      // aboutusscreen: (context) => AboutUsPage(),
      // favouriteitem: (context) => MyWishList(),
      // myaccount: (context) => MyAccount(),
      // myaddress: (context) => MyAddress(),
      // orderscreen: (context) => MyOrdersDrawer(),
      // walletscreen: (context) => Wallet(),
      // paymentOption: (context) => PaymentOption(),
      // orderdetails: (context) => OrderDetails(),
      // trackorder: (context) => TrackOrders(),
      // notification: (context) => NotificationShow(),
      // paymentdoned: (context) => PaymentDoneWebView(),
      // settingsAccount: (context) => SettingPage(),
    };
  }
}