import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Music extends StatelessWidget {
  var list1 = [
    DecorationImage(
        fit: BoxFit.fill,
        image: NetworkImage(
            'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bXVzaWN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60')),
    DecorationImage(
        fit: BoxFit.fill,
        image: NetworkImage(
            'https://images.unsplash.com/photo-1511379938547-c1f69419868d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8bXVzaWN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60')),
    DecorationImage(
        fit: BoxFit.fill,
        image: NetworkImage(
            'https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8bXVzaWN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60')),
    DecorationImage(
        fit: BoxFit.fill,
        image: NetworkImage(
            'https://images.unsplash.com/photo-1506157786151-b8491531f063?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fG11c2ljfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60')),
    DecorationImage(
        fit: BoxFit.fill,
        image: NetworkImage(
            'https://images.unsplash.com/photo-1459749411175-04bf5292ceea?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fG11c2ljfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60')),
    DecorationImage(
        fit: BoxFit.fill,
        image: NetworkImage(
            'https://images.unsplash.com/photo-1446057032654-9d8885db76c6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzB8fG11c2ljfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60')),
  ];
  var list2 = [
    'Top\n50',
    'Pop\nMusic',
    'LOFI\nREMIXES ',
    'Mike',
    'Car\nMusic',
    'TikTok'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
            child: Text(
          'Playlists',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.pink.shade100),
        )),
        bottom: AppBar(
          title: TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide:
                      BorderSide(width: 1, color: Colors.pink.shade100)),
              filled: true,
              fillColor: Color.fromARGB(255, 32, 31, 31),
              hintStyle: TextStyle(color: Colors.pink.shade100),
              hintText: "Search...",
              suffixIcon: Icon(
                Icons.search,
                color: Colors.pink.shade100,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            itemCount: 6,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
            itemBuilder: (context, index) {
              return Stack(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: list1[index]),
                  ),
                ),
                Positioned(
                    left: 20,
                    top: 150,
                    child: Text(
                      list2[index],
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ))
              ]);
            }),
      ),
      bottomNavigationBar: GNav(
          rippleColor: Colors.grey, // tab button ripple color when pressed
          hoverColor: Colors.grey, // tab button hover color
          haptic: true, // haptic feedback
          tabBorderRadius: 15,
          tabActiveBorder:
              Border.all(color: Colors.blue, width: 1), // tab button border
          tabBorder:
              Border.all(color: Colors.grey, width: 1), // tab button border
          tabShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)
          ], // tab button shadow
          curve: Curves.easeOutExpo, // tab animation curves
          duration: Duration(milliseconds: 900), // tab animation duration
          gap: 8, // the tab button gap between icon and text
          color: Colors.white, // unselected icon color
          activeColor: Colors.yellow, // selected icon and text color
          iconSize: 24, // tab button icon size
          tabBackgroundColor:
              Colors.purple.withOpacity(0.1), // selected tab background color
          padding: EdgeInsets.symmetric(
              horizontal: 20, vertical: 5), // navigation bar padding
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.search,
              text: 'Search',
            ),
            GButton(
              icon: Icons.queue_music,
              text: 'Playlists',
            ),
            GButton(
              icon: Icons.person,
              text: 'Profile',
            )
          ]),
    );
  }
}
