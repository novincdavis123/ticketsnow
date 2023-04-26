import 'package:flutter/material.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:ticketsnow/screens/accounttab.dart';
import 'package:ticketsnow/screens/hometab.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final tabs = [
    SizedBox(height: 700, width: 500, child: Homepage()),
    Center(child: Text('events')),
    SizedBox(height: 700, width: 500, child: Account()),
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
              tabs[_selectedIndex],
            ]))
          ],
        ),
        bottomNavigationBar: FlashyTabBar(
          backgroundColor: Colors.black,
          selectedIndex: _selectedIndex,
          showElevation: true,
          onItemSelected: (index) => setState(() {
            _selectedIndex = index;
          }),
          items: [
            FlashyTabBarItem(
              activeColor: Colors.pink,
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            FlashyTabBarItem(
              activeColor: Colors.pink,
              icon: Icon(Icons.video_file_sharp),
              title: Text('Events'),
            ),
            FlashyTabBarItem(
              activeColor: Colors.pink,
              icon: Icon(Icons.account_box_outlined),
              title: Text('Account'),
            ),
          ],
        ),
      ),
    );
  }
}
