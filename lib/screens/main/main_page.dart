// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:delivery_app/screens/Home/homepage.dart';
import 'package:delivery_app/screens/cart/cart_history.dart';
import 'package:delivery_app/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedPage = 0;

  void onTap(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark));
  }

  final List _pages = [
    HomeScreen(),
    Container(
      child: const Center(child: Text('another Container 2')),
    ),
    CartHistoryPage(),
    Container(
      child: const Center(child: Text('another Container 3')),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          selectedItemColor: main1Color,
          unselectedItemColor: yellow2Color.withOpacity(0.8),
          currentIndex: _selectedPage,
          selectedFontSize: 0,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          unselectedFontSize: 0,
          onTap: onTap,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.home,
                ),
                label: 'home'),
            BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.archivebox,
                ),
                label: 'archives'),
            BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.cart,
                ),
                label: 'cart'),
            BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.person,
                ),
                label: 'user'),
          ]),
    );
  }
}
