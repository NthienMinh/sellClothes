import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_ui/Colors.dart';

import 'package:mobile_ui/screens/account/account.dart';
import 'package:mobile_ui/screens/all_products/all_products_screen.dart';
import 'package:mobile_ui/screens/history/history.dart';
import 'package:mobile_ui/screens/main_screen/main_clothes_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class HomePage extends StatefulWidget {
  static String routeName = "/home";
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  late PersistentTabController _controller;

  void onTapNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens = [
    MainClothesPage(),
    AllProductsScreen(),
    HistoryScreen(),
    AccountScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _buildScreens[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.archivebox), label: "Products"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.cart), label: "History"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person), label: "Account"),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColor.mainColor,
        unselectedItemColor: AppColor.signColor,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
