import 'package:e_com/components/bottom_nav_bar.dart';
import 'package:e_com/screens/cart_screen.dart';
import 'package:e_com/screens/shop_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // this index controls the bottom nav bar
  //0 == home and 1 == cart
  int _selectedIdx = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIdx = index;
    });
  }

  // Pages to navigate between
  final List<Widget> _pages = [
    // Shop Page
    const ShopScreen(),

    // Cart Page
    const CartScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIdx],
    );
  }
}
