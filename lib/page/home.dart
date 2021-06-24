import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:water_reminder/component/const.dart';
import 'package:water_reminder/page/screen/history_screen.dart';
import 'package:water_reminder/page/screen/home_screen.dart';
import 'package:water_reminder/page/screen/news_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PersistentTabController _controller;
  bool openHome = true;

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 1);
    super.initState();
  }

  List<Widget> screen = [
    HistoryScreen(),
    HomeScreen(),
    NewsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: screen,
      items: [
        customBottomBar(Icon(Icons.insights), 'History'),
        customBottomBar(Icon(Icons.local_drink), 'Home'),
        customBottomBar(Icon(Icons.public), 'News'),
      ],
      confineInSafeArea: true,
      backgroundColor: openHome ? secondary : Colors.white,
      onItemSelected: (val) {
        print(val);
        val == 1
            ? setState(() {
                openHome = true;
              })
            : setState(() {
                openHome = false;
              });
      },
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      navBarStyle: NavBarStyle.style7,
    );
  }

  PersistentBottomNavBarItem customBottomBar(
    Icon icon,
    String title,
  ) {
    return PersistentBottomNavBarItem(
      icon: icon,
      title: title,
      activeColorPrimary: openHome ? Colors.white : secondary,
      inactiveColorPrimary: Colors.grey,
      activeColorSecondary: openHome ? secondary : Colors.white,
    );
  }
}
