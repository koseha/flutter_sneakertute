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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: const Icon(Icons.menu, color: Colors.black),
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        elevation: 0,
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                // logo
                Theme(
                  data: ThemeData(
                    dividerColor: Colors.transparent,
                    dividerTheme: DividerThemeData(color: Colors.transparent),
                  ),
                  child: DrawerHeader(
                    child: Image.asset(
                      'lib/images/nike_logo.png',
                      color: Colors.white,
                      width: 160,
                    ),
                  ),
                ),

                Divider(color: Colors.grey[800]),

                // other pages
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: ListTile(
                    leading: Icon(Icons.home, color: Colors.white),
                    title: Text('Home', style: TextStyle(color: Colors.white)),
                    onTap: () {},
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: ListTile(
                    leading: Icon(Icons.info, color: Colors.white),
                    title: Text('About', style: TextStyle(color: Colors.white)),
                    onTap: () {},
                  ),
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.only(left: 20, bottom: 20),
              child: ListTile(
                leading: Icon(Icons.logout, color: Colors.white),
                title: Text('Logout', style: TextStyle(color: Colors.white)),
                onTap: () {},
              ),
            ),

            // logout
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
