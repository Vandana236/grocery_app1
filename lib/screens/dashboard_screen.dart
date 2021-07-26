import 'dart:io';
import 'dart:typed_data';
import 'package:badges/badges.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:grocery_onlineapp/baseurlg/baseurlg.dart';
import 'package:grocery_onlineapp/baseurlg/bottomnavigationnavigator.dart';
import 'package:grocery_onlineapp/baseurlg/languagecubit/locationmiter.dart';
import 'package:grocery_onlineapp/baseurlg/languagecubit/locemittermodel.dart';
import 'package:grocery_onlineapp/baseurlg/locale/locales.dart';
import 'package:grocery_onlineapp/baseurlg/locationPage.dart';
import 'package:grocery_onlineapp/baseurlg/profileprovider.dart';
import 'package:grocery_onlineapp/baseurlg/topcategory.dart';
import 'package:grocery_onlineapp/screens/search_screen.dart';
import 'package:grocery_onlineapp/widgets/bundle_offers_menu.dart';
import 'package:grocery_onlineapp/widgets/products_menu.dart';
import 'package:grocery_onlineapp/widgets/select_categories.dart';
import 'package:flutter/material.dart';
import 'package:grocery_onlineapp/widgets/dashboard_screen_heading.dart';
import 'package:shared_preferences/shared_preferences.dart';



FirebaseMessaging messaging = FirebaseMessaging.instance;
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();
const AndroidNotificationChannel channel = AndroidNotificationChannel(
  '1234', // id
  'High Importance Notifications', // title
  'This channel is used for important notifications.', // description
  importance: Importance.high,
);
class DashboardScreen extends StatefulWidget {
  final Function onAppDrawerButtonPressed;

  const DashboardScreen({Key key, this.onAppDrawerButtonPressed})
      : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  List<TopCategoryDataModel> categoryList = [];
  LocationEmitter locEmitterP;

  int selectedInd = 0;

  dynamic lat;
  dynamic lng;

  String appbarTitle = '--';

  int _NotiCounter = 0;

  dynamic hintText = '--';

  BottomNavigationEmitter navBottomProvider;

  bool isKeyboardOpen = false;

  bool isEnteredFirst = false;

  ProfileProvider pRovider;

  var userName = '--';

  bool islogin = true;

  Future onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    // var message = jsonDecode('${payload}');
    _showNotification(flutterLocalNotificationsPlugin, '${title}', '${body}');
  }

  Future<void> myBackgroundMessageHandler(RemoteMessage message) async {
    _showNotification(flutterLocalNotificationsPlugin,
        '${message.notification.title}', '${message.notification.body}');
  }

  Future selectNotification(String payload) async {}

  @override
  void initState() {
    getImageBaseUrl();
    super.initState();
    setFirebase();
  }
  void setFirebase() async {
    try{
      await Firebase.initializeApp();
    }catch(e){

    }
    messaging = FirebaseMessaging.instance;
    iosPermission(messaging);
    var initializationSettingsAndroid =
    AndroidInitializationSettings('icon');
    var initializationSettingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);
    messaging.getToken().then((value) {
      debugPrint('token: $value');
    });
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage message) {
      if (message != null) {
        _showNotification(
            flutterLocalNotificationsPlugin,
            '${message.notification.title}',
            '${message.notification.body}');
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      if (notification != null && android != null) {
        _showNotification(flutterLocalNotificationsPlugin, notification.title, notification.body);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      _showNotification(
          flutterLocalNotificationsPlugin,
          '${message.notification.title}',
          '${message.notification.body}');
    });
    FirebaseMessaging.onBackgroundMessage(myBackgroundMessageHandler);
  }



  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    if (!isEnteredFirst) {
      isEnteredFirst = true;
      locEmitterP = BlocProvider.of<LocationEmitter>(context);
      // cateP = BlocProvider.of<CategoryProvider>(context);
      // searchP = BlocProvider.of<SearchProvider>(context);
      // cartListPro = BlocProvider.of<CartListProvider>(context);
      // cartCountP = BlocProvider.of<CartCountProvider>(context);
     // navBottomProvider = BlocProvider.of<BottomNavigationEmitter>(context);
     // pRovider = BlocProvider.of<ProfileProvider>(context);
      // searchController.addListener(() {
      //   if (isKeyboardOpen) {
      //     if (searchController.text.length > 0 && storeFinderData != null) {
      //       searchP.hitSearchData(searchController.text, storeFinderData);
      //     } else {
      //       searchP.hitSearchData('', storeFinderData);
      //     }
      //   }
      // });
      if (locEmitterP.state != null &&
          locEmitterP.state.lat != null &&
          locEmitterP.state.lat > 0.0 &&
          locEmitterP.state.lng != null &&
          locEmitterP.state.lng > 0.0) {
        print('in this');
        locEmitterP.getStoreId(locEmitterP.state);
      } else {
        print('in that');
        locEmitterP.hitLocEmitterInitial();
      }
      navBottomProvider.hitBottomNavigation(
          0, appbarTitle, '${locale.searchOnGoGrocer}$appname');
      getUserPrefs();
      pRovider.hitCounter();
    }

    // text theme
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.dashboard_outlined),
          onPressed: () => widget.onAppDrawerButtonPressed(),
        ),
        title:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: (selectedInd == 0),
              child: AppBar(
                title: BlocBuilder<LocationEmitter, LocEmitterModel>(
                    builder: (context, locModel) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MaterialButton(
                            onPressed: () {
                              // locEmitterP.hitLocEmitter(LocEmitterModel(0.0,0.0,'Searching your location',true,null));
                              var latdi = 0.0;
                              var lngdi = 0.0;
                              if (lat != null && lng != null) {
                                latdi = lat;
                                lngdi = lng;
                              }
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) {
                                    return LocationPage(latdi, lngdi);
                                  }));
                            },
                            splashColor: Colors.red,
                            color:  Colors.blue,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              //runSpacing: 0.0,
                              // spacing: 0.0,
                              // runAlignment: WrapAlignment.center,
                              // alignment: WrapAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(
                                    '${locModel.address}',
                                    //'kotla Rd Bartara,Uttar Pradesh 283203 India',
                                    maxLines: 2,
                                    overflow: TextOverflow.clip,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color:  Colors.white,
                                        fontSize: 14),
                                  ),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.white,
                                  size: 20,
                                )
                              ],
                            ),
                            elevation: 0,
                            padding: const EdgeInsets.all(0),
                            minWidth: 0,
                            height: 20,
                            materialTapTargetSize:
                            MaterialTapTargetSize.shrinkWrap,
                            focusColor:  Colors.red,
                          //.withOpacity(0.8),
                          ),
                          Text(
                            (locModel.storeFinderData != null &&
                                locModel.storeFinderData
                                    .store_opening_time !=
                                    null)
                                ? '${locModel.storeFinderData.store_opening_time} AM - ${locModel.storeFinderData.store_closing_time} PM'
                                : '00:00 AM - 00:00 PM',
                            style: TextStyle(
                                color: Colors.white, fontSize: 12),
                          )
                        ],
                      );
                    }),
              ),
            ),
            Visibility(
              visible: (selectedInd == 1),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Color(0xfff8f8f8), width: 1),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xfff8f8f8),
                                  offset: Offset(-1, -1),
                                  blurRadius: 5),
                              BoxShadow(
                                  color: Color(0xfff8f8f8),
                                  offset: Offset(1, 1),
                                  blurRadius: 5)
                            ]),
                        child: TextFormField(
                          readOnly: (selectedInd != 1),
                          onTap: () {
                            //categoryList = cateP.getCategoryList();
                          },
                          onChanged: (value) {
                            List<TopCategoryDataModel> chList = categoryList
                                .where((element) => element.title
                                .toString()
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                                .toList();
                            //cateP.emitCategoryList(chList, storeFinderData);
                          },
                          autofocus: false,
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(
                              color: Colors.red, fontSize: 18),
                          decoration: InputDecoration(
                              //hintText: hintText,
                              hintStyle:
                              Theme.of(context).textTheme.subtitle2,
                              contentPadding:
                              EdgeInsets.symmetric(vertical: 10),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.red,
                              ),
                              focusColor:Colors.red,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none)),
                        ),
                      )),
                  Visibility(
                    visible: (selectedInd == 2),
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 10),
                      child: Badge(
                        padding: EdgeInsets.all(5),
                        position: BadgePosition(end: -2.5, top: -5),
                        animationDuration: Duration(milliseconds: 300),
                        animationType: BadgeAnimationType.slide,
                        badgeContent: Text(
                          _NotiCounter.toString(),
                          style: TextStyle(
                              color:  Colors.red, fontSize: 10),
                        ),
                        child: Icon(
                          Icons.filter_list_sharp,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Visibility(
              visible: (selectedInd == 0),
              child: GestureDetector(
                onTap: () {
                  print('dd');
                  // searchP.emitSearchNull();
                  navBottomProvider.hitBottomNavigation(
                      2, appbarTitle, hintText);
                  // setState(() {
                  //   selectedInd = 2;
                  // });
                },
                behavior: HitTestBehavior.opaque,
                child: Container(
                  height: 32,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  // decoration: BoxDecoration(
                  //     color:Colors.white,
                  //     borderRadius: BorderRadius.circular(10),
                  //     border: Border.all(
                  //         color: Color(0xfff8f8f8), width: 1),
                  //     boxShadow: [
                  //       BoxShadow(
                  //           color: Color(0xfff8f8f8),
                  //           offset: Offset(-1, -1),
                  //           blurRadius: 5),
                  //       BoxShadow(
                  //           color: Color(0xfff8f8f8),
                  //           offset: Offset(1, 1),
                  //           blurRadius: 5)
                  //     ]),
                  child: Row(
                    children: [
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(
                          Icons.search,
                          color: Colors.red,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 2.0),
                        child: Text('$hintText',
                            style:
                            Theme.of(context).textTheme.subtitle2),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: (selectedInd == 2),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Color(0xfff8f8f8), width: 1),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xfff8f8f8),
                                  offset: Offset(-1, -1),
                                  blurRadius: 5),
                              BoxShadow(
                                  color: Color(0xfff8f8f8),
                                  offset: Offset(1, 1),
                                  blurRadius: 5)
                            ]),
                      )),
                  Visibility(
                    // visible: (selectedInd == 2),
                    visible: false,
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 10),
                      child: Badge(
                        padding: EdgeInsets.all(5),
                        position: BadgePosition(end: -2.5, top: -5),
                        animationDuration: Duration(milliseconds: 300),
                        animationType: BadgeAnimationType.slide,
                        badgeContent: Text(
                          _NotiCounter.toString(),
                          style: TextStyle(
                              color: Colors.red, fontSize: 10),
                        ),
                        child: Icon(
                          Icons.filter_list_sharp,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Visibility(
              // visible: (selectedInd == 2),
              visible: false,
              child: Container(
                height: 52,
                alignment: Alignment.centerLeft,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 10, vertical: 7),
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                              color: Colors.red, width: 2)),
                      child: Row(
                        children: [
                          Text(
                            "Category",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          Icon(
                            Icons.close,
                            size: 20,
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: 5,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search_outlined),
            onPressed: () => Get.to(() => SearchScreen()),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 16,
              ),
              child: DashboardScreenHeading(),
            ),
            SelectCategories(
              onSelected: (value) {
                setState(() {});
              },
            ),
            // _firstSlideShow(),
            Padding(
              padding: const EdgeInsets.only(
                top: 16.0,
                bottom: 8,
                left: 16,
                right: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Bundle Offers",
                    style: textTheme.headline6,
                  ),
                  Text(
                    "View All",
                    style: textTheme.caption.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            BundleOffersMenu(),
            Padding(
              padding: const EdgeInsets.only(
                top: 16.0,
                bottom: 8,
                left: 16,
                right: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular",
                    style: textTheme.headline6,
                  ),
                  Text(
                    "View All",
                    style: textTheme.caption.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ProductsMenu(),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> _showNotification(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
      dynamic title,
      dynamic body) async {
    final Int64List vibrationPattern = Int64List(4);
    vibrationPattern[0] = 0;
    vibrationPattern[1] = 1000;
    vibrationPattern[2] = 5000;
    vibrationPattern[3] = 2000;
    final AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails('1234', 'Notify', 'Notify On Shopping',
        vibrationPattern: vibrationPattern,
        importance: Importance.max,
        priority: Priority.high,
        enableLights: true,
        enableVibration: true,
        icon: 'icon',
        playSound: true,
        ticker: 'ticker');
    final IOSNotificationDetails iOSPlatformChannelSpecifics =
    IOSNotificationDetails(presentSound: true);
    final NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );
    await flutterLocalNotificationsPlugin.show(
        0, '${title}', '${body}', platformChannelSpecifics,
        payload: 'item x');
  }

  void getUserPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if (prefs.getBool('islogin')) {
        userName = prefs.getString('user_name');
        islogin = true;
      } else {
        userName = 'Hey User';
        islogin = false;
      }
    });
  }
}


void iosPermission(FirebaseMessaging firebaseMessaging) {
  if(Platform.isIOS){
    firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
}