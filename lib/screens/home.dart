import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ticketsnow/screens/play.dart';

class Musify extends StatefulWidget {
  @override
  State<Musify> createState() => _MusifyState();
}

class _MusifyState extends State<Musify> {
  bool Switchval = false;
  int _selectedIndex = 0;
  var images = [
    NetworkImage(
        'https://images.unsplash.com/photo-1504898770365-14faca6a7320?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzl8fG11c2ljfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
    NetworkImage(
        'https://images.unsplash.com/photo-1619961602105-16fa2a5465c2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8ODB8fG11c2ljfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
    NetworkImage(
        'https://images.unsplash.com/photo-1520166012956-add9ba0835cb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTc4fHxtdXNpY3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            ElevatedButton(
                onPressed: () async {
                  context.locale = Locale('en', 'GB');
                },
                child: Text('dara')),
            Center(
                child: Text('Musify.'.tr().toString().toUpperCase(),
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink.shade100))),
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
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Music()));
                },
                child: Text('dara')),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Text('Suggested playlists'.tr().toString(),
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink.shade100)),
            ),
            CarouselSlider(
              items: List.generate(3, (index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: images[index], fit: BoxFit.cover)),
                  ),
                );
              }),
              options: CarouselOptions(
                height: 200,
                pauseAutoPlayInFiniteScroll: true,
                autoPlay: true,
                enlargeCenterPage: false,
                viewportFraction: .4,
                aspectRatio: 16 / 7,
                initialPage: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Text('Recommended for you'.tr().toString(),
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink.shade100)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: ListTile(
                  leading: Image(
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bXVzaWN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60')),
                  title: Text('Hero',
                      style: TextStyle(color: Colors.pink.shade100)),
                  subtitle: Text('Taylor Swift',
                      style: TextStyle(color: Colors.white)),
                  trailing: Wrap(
                    children: [
                      Icon(Icons.star_border, color: Colors.pink.shade100),
                      SizedBox(width: 10),
                      Icon(Icons.download_outlined,
                          color: Colors.pink.shade100),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: ListTile(
                  leading: Image(
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1511379938547-c1f69419868d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8bXVzaWN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60')),
                  title: Text('Unholy',
                      style: TextStyle(color: Colors.pink.shade100)),
                  subtitle: Text('Sam Smith,Kim Petras',
                      style: TextStyle(color: Colors.white)),
                  trailing: Wrap(
                    children: [
                      Icon(Icons.star_border, color: Colors.pink.shade100),
                      SizedBox(width: 10),
                      Icon(Icons.download_outlined,
                          color: Colors.pink.shade100),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: ListTile(
                  leading: Image(
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1487180144351-b8472da7d491?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fG11c2ljfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60')),
                  title: Text('Lift Me Up',
                      style: TextStyle(color: Colors.pink.shade100)),
                  subtitle:
                      Text('Rihanna', style: TextStyle(color: Colors.white)),
                  trailing: Wrap(
                    children: [
                      Icon(Icons.star_border, color: Colors.pink.shade100),
                      SizedBox(width: 10),
                      Icon(Icons.download_outlined,
                          color: Colors.pink.shade100),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: ListTile(
                  leading: Image(
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1506157786151-b8491531f063?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fG11c2ljfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60')),
                  title: Text('"Depression"',
                      style: TextStyle(color: Colors.pink.shade100)),
                  subtitle: Text('Dax', style: TextStyle(color: Colors.white)),
                  trailing: Wrap(
                    children: [
                      Icon(Icons.star_border, color: Colors.pink.shade100),
                      SizedBox(width: 10),
                      Icon(Icons.download_outlined,
                          color: Colors.pink.shade100),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: ListTile(
                  leading: Image(
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1421217336522-861978fdf33a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjl8fG11c2ljfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60')),
                  title: Text('I\'m Good',
                      style: TextStyle(color: Colors.pink.shade100)),
                  subtitle: Text('Davis Guetta & Bebe Rexha',
                      style: TextStyle(color: Colors.white)),
                  trailing: Wrap(
                    children: [
                      Icon(Icons.star_border, color: Colors.pink.shade100),
                      SizedBox(width: 10),
                      Icon(Icons.download_outlined,
                          color: Colors.pink.shade100),
                    ],
                  ),
                ),
              ),
            ),
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
              icon: Icon(Icons.search),
              title: Text('Search'),
            ),
            FlashyTabBarItem(
              activeColor: Colors.pink,
              icon: Icon(Icons.video_file_sharp),
              title: Text('Files'),
            ),
            FlashyTabBarItem(
              activeColor: Colors.pink,
              icon: Icon(Icons.more_horiz),
              title: Text('More'),
            ),
          ],
        ),
      ),
    );
  }
}
