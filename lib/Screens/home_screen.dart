import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xtreme_tourism/tabs/explore_tab.dart';
import 'package:xtreme_tourism/tabs/home_tab.dart';
import 'package:xtreme_tourism/tabs/profile_tab.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<IconData> data=[
    Icons.home,
    Icons.search,
    Icons.portrait,
  ];

  int currentPage = 0;
  GlobalKey bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: FancyBottomNavigation(
          circleColor:  Color(0xffff6836),
        inactiveIconColor: Colors.black,
        key: bottomNavigationKey,
        tabs: [
          TabData(iconData:Icons.home, title: "Home"),
          TabData(iconData:Icons.flight, title: "Explore"),
          TabData(iconData:Icons.portrait, title: "Profile"),
        ],
        initialSelection: 0,
        onTabChangedListener: (position){
          setState(() {
            currentPage=position;
          });
        },
          ),
        body: _getPage(currentPage),
      ),
    );
  }
}


_getPage(int page)
{
  switch(page)
  {
    case 0:
      return home_tab();

    case 1:
      return explore_tab();

    case 2:
      return profile_tab();
  }
}