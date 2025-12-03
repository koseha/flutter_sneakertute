import 'package:flutter/material.dart';
import 'package:flutter_sneakertute/components/bottom_nav_bar.dart';
import 'package:flutter_sneakertute/pages/shop_page.dart';
import 'package:flutter_sneakertute/pages/cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // this selected index is used to navigate the bottom bar
  int _selectedIndex = 0;

  // this method will update the selected index
  // when the bottom bar is tapped
  void navigationBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // page to display
  final List<Widget> _pages = [const ShopPage(), const CartPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: BottomNavBar(
        onTabChange: (value) => navigationBottomBar(value),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
