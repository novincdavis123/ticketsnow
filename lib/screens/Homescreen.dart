import 'package:material_ui/material_ui.dart';
import 'package:ticketsnow/api/event.dart';
import 'package:ticketsnow/screens/accounttab.dart';
import 'package:ticketsnow/screens/hometab.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final tabs = const [
    Homepage(),
    Event(),
    Account(),
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.black,
        indicatorColor: Colors.pink.withValues(alpha: 0.25),
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) => setState(() {
          _selectedIndex = index;
        }),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined, color: Colors.white70),
            selectedIcon: Icon(Icons.home, color: Colors.pink),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.video_file_outlined, color: Colors.white70),
            selectedIcon: Icon(Icons.video_file_sharp, color: Colors.pink),
            label: 'Events',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_box_outlined, color: Colors.white70),
            selectedIcon: Icon(Icons.account_box, color: Colors.pink),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
