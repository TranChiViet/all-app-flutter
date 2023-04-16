import 'favorite.dart';
import 'notification.dart';
import 'package:flutter/material.dart';

import 'cart.dart';
import 'home.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _currentIndex = 0;
  List<Widget> body = [
    HomeScreen(),
    CartScreen(),
    FavoriteScreen(),
    NotificationScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int newIndex){
          setState(() {
            _currentIndex = newIndex;
          });
        },
        backgroundColor: Colors.black,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const[
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: 'Cart', icon: Icon(Icons.shopping_cart)),
          BottomNavigationBarItem(label: 'Favorite', icon: Icon(Icons.favorite)),
          BottomNavigationBarItem(label: 'Notification', icon: Icon(Icons.notifications)),
        ]),
    );
  }
}
