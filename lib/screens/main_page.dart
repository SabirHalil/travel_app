import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/core/colors.dart';
import 'package:travel_app/screens/home_page.dart';
import 'package:travel_app/screens/map_page.dart';
import 'package:travel_app/screens/notification_page.dart';
import 'package:travel_app/screens/post_page.dart';
import 'package:travel_app/screens/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final autoSizeGroup = AutoSizeGroup();
  var _bottomNavIndex = 0;
  final iconList = <IconData>[
    Icons.home,
    Icons.location_on,
    Icons.notification_add,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _floatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar:  _bottomNavigationBar(),
      body: _body(),
    );
  }

  _body() {

    switch (_bottomNavIndex) {
      case 0:
        return const HomePage();
      case 1:
        return const MapPage();
      case 2:
        return const NotificationPage();
      case 3:
        return ProfilePage();
      case -1:
        return const PostPage();
      default:
        return const HomePage();
    }
  
  }

  _floatingButton() {
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          _bottomNavIndex = -1;
        });
      },
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
      ),
      backgroundColor: GlobalColors.primaryColor,
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }

  _bottomNavigationBar(){
    return AnimatedBottomNavigationBar.builder(
        gapLocation: GapLocation.center, // Set the gap location to center
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
          });
        },
        activeIndex: _bottomNavIndex,
        itemCount: iconList.length,
        tabBuilder: (int index, bool isActive) {
          final color = isActive ? Colors.red : Colors.grey;
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconList[index],
                size: 24,
                color: color,
              ),
            ],
          );
        },
      );
  }
}
