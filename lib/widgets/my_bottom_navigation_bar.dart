import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatefulWidget {
  final Function(int) onTap;

  const MyBottomNavigationBar({Key key, this.onTap}) : super(key: key);

  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      //backgroundColor: Colors.red,
      currentIndex: _currentIndex,
      onTap: (value) {
        setState(() {
          if (value != 2 && value != 1) {
            _currentIndex = value;
          }
          widget.onTap(value);
        });
      },
      items: [
        BottomNavigationBarItem(
          backgroundColor: Colors.blue,
          icon: Icon(Icons.home_outlined),
          label: "Home",
        ),
        BottomNavigationBarItem(
          //backgroundColor: Colors.red,
          icon: Icon(Icons.search_outlined),
          label: "Search",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search_outlined,
            color: Colors.white,
          ),
          label: "Cart",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history_outlined),
          label: "History",
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: "Profile")
      ],
    );
  }
}
