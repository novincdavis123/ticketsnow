import 'package:flutter/material.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:ticketsnow/api/event.dart';
import 'package:ticketsnow/db/firebaseaccount/FireHelper.dart';
import 'package:ticketsnow/db/firebaseaccount/log.dart';
import 'package:ticketsnow/screens/accounttab.dart';
import 'package:ticketsnow/screens/hometab.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final tabs = [
    SizedBox(height: 800, width: 500, child: Homepage()),
    SizedBox(height: 820, width: 500, child: Event()),
    SizedBox(height: 800, width: 500, child: Account()),
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
        drawer: Drawer(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.orange.shade300, Colors.red.shade900])),
            child: ListView(children: [
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fHBlcnNvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1400&q=60"),
                  ),
                  title: Text("Alan Paul"),
                  subtitle: Text("alanpaul@gmail.com"),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: ListTile(
                  leading: Icon(Icons.space_dashboard_outlined),
                  title: Text('Dashboard'),
                ),
              ),
              const ListTile(
                leading: Icon(Icons.leak_add_sharp),
                title: Text('Leads'),
              ),
              const ListTile(
                leading: Icon(Icons.people_outline),
                title: Text('Clients'),
              ),
              const ListTile(
                leading: Icon(Icons.rocket_launch),
                title: Text('Projects'),
              ),
              const ListTile(
                leading: Icon(Icons.man),
                title: Text('Patients'),
              ),
              const ListTile(
                leading: Icon(Icons.subscriptions),
                title: Text('Subscription'),
              ),
              const ListTile(
                leading: Icon(Icons.payments),
                title: Text('Payments'),
              ),
              const ListTile(
                leading: Icon(Icons.supervised_user_circle_outlined),
                title: Text('Users'),
              ),
              const ListTile(
                leading: Icon(Icons.local_library_outlined),
                title: Text('Library'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      AuthHelper().signOut().then((_) =>
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Firelog())));
                    },
                    child: const Text('Log out')),
              ),
            ]),
          ),
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
