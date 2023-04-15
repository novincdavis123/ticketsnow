import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
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
  bool Switchval = false;
  final tabs = [
    SizedBox(height: 600, width: 500, child: Homepage()),
    Center(child: Text('events')),
    SizedBox(height: 620, width: 500, child: Account()),
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: Wrap(children: [
                ElevatedButton(
                    onPressed: () async {
                      context.locale = Locale('en', 'GB');
                    },
                    onLongPress: () async {
                      context.locale = Locale('en', 'HI');
                    },
                    child: Text('Lan')),
                TextButton(
                  child: Text('City>'.tr().toString(),
                      style: TextStyle(color: Colors.green)),
                  onPressed: () {},
                ),
              ]),
              title: Center(
                  child: Text(
                'TicketsNow'.tr().toString().toUpperCase(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
              actions: [
                Switch(
                    onChanged: (bool value) {
                      setState(() {
                        this.Switchval = value;
                      });
                      if (Switchval == false) {
                        AdaptiveTheme.of(context).setLight();
                      } else {
                        AdaptiveTheme.of(context).setDark();
                      }
                    },
                    value: this.Switchval),
              ],
            ),
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
