import 'package:flutter/material.dart';
import 'package:grocery_onlineapp/screens/app_menu_screen.dart';
import 'package:grocery_onlineapp/screens/dashboard_screen.dart';
import 'package:grocery_onlineapp/widgets/swiper_drawer.dart';

class AppDrawerWrapperScreen extends StatefulWidget {
   AppDrawerWrapperScreen({ Key key }) : super(key: key);

  @override
  _AppDrawerWrapperScreenState createState() => _AppDrawerWrapperScreenState();
}

class _AppDrawerWrapperScreenState extends State<AppDrawerWrapperScreen> {
     GlobalKey<SwiperDrawerState> drawerKey = GlobalKey<SwiperDrawerState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
       body: SwiperDrawer(
        radius: 30,
        bodySize: 40,
        key: drawerKey,
        hasClone: false,
        bodyBackgroundPeekSize: 30,
        //backgroundColor: Colors.red,
        backgroundColor: Theme.of(context).primaryColor,
        // pass drawer widget
        drawer: AppMenuScreen(
          onBackPressed: (){
            drawerKey.currentState.closeDrawer();
          },
        ),
        // pass body widget
        child: DashboardScreen(
          onAppDrawerButtonPressed: (){
             if (drawerKey.currentState.isOpened()) {
                  drawerKey.currentState.closeDrawer();
                } else {
                  drawerKey.currentState.openDrawer();
                }
          },
        ),
      ), 
    );
  }
}