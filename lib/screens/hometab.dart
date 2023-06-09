import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ticketsnow/screens/dummy_movies.dart';
import 'package:advanced_search/advanced_search.dart';
import 'package:url_launcher/url_launcher.dart';
import '../db/firebaseaccount/FireHelper.dart';
import '../db/firebaseaccount/log.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool Switchval = false;
  final List<String> searchableList = [
    "Avatar",
    "Bahubali",
    "Kgf",
    "War",
    "Pathaan",
    "Krish",
    "Romancham",
    "Aquaman",
    "Batman",
    "Joker",
    "Avengers",
    "Spiderman",
    "Superman"
  ];

  var size, height, width;
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
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
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
            Container(
              margin: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
              child: AdvancedSearch(
                searchItems: searchableList,
                maxElementsToDisplay: 10,
                singleItemHeight: 50,
                borderColor: Colors.grey,
                minLettersForSearch: 0,
                selectedTextColor: Color(0xFF3363D9),
                fontSize: 14,
                borderRadius: 12.0,
                hintText: 'Search Me',
                cursorColor: Colors.blueGrey,
                autoCorrect: false,
                focusedBorderColor: Colors.blue,
                searchResultsBgColor: Color(0xFAFAFA),
                disabledBorderColor: Colors.cyan,
                enabledBorderColor: Colors.black,
                enabled: true,
                caseSensitive: false,
                inputTextFieldBgColor: Colors.white10,
                clearSearchEnabled: true,
                itemsShownAtStart: 10,
                searchMode: SearchMode.CONTAINS,
                showListOfResults: true,
                unSelectedTextColor: Colors.black54,
                verticalPadding: 10,
                horizontalPadding: 10,
                hideHintOnTextInputFocus: true,
                hintTextColor: Colors.grey,
                searchItemsWidget: searchWidget,
                onItemTap: (index, value) {
                  print("selected item Index is $index");
                },
                onSearchClear: () {
                  print("Cleared Search");
                },
                onSubmitted: (value, value2) {
                  print("Submitted: " + value);
                },
                onEditingProgress: (value, value2) {
                  print("TextEdited: " + value);
                  print("LENGTH: " + value2.length.toString());
                },
              ),
            ),
            CarouselSlider(
              items: List.generate(3, (index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () => launchUrl(Uri.parse('https://wynk.in/music')),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: images[index], fit: BoxFit.cover)),
                    ),
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
            Container(
              height: height * 0.03,
              width: double.infinity,
              child: ListTile(
                leading: Text('Recommended Movies'.tr().toString(),
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.bold)),
                trailing: TextButton(
                    onPressed: () =>
                        launchUrl(Uri.parse('https://psa.re/category/movie/')),
                    child: Text(
                      'See All'.tr().toString(),
                      style: TextStyle(
                          color: Colors.pink, overflow: TextOverflow.ellipsis),
                    )),
              ),
            ),
            ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(15),
              children: dummyProducts.map((product) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(product["image"])),
                    ),
                    child: ListTile(
                      title: Text(product["name"],
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      onTap: () => goToSecond(context, product["id"]),
                    ),
                  ),
                );
              }).toList(),
            ),
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
            ExpansionTile(
                title: Text('Languages', style: TextStyle(color: Colors.red)),
                children: [
                  ListTile(
                    onTap: () async {
                      context.locale = Locale('en', 'US');
                    },
                    title: Text('English'),
                  ),
                  ListTile(
                    onTap: () async {
                      context.locale = Locale('en', 'GB');
                    },
                    title: Text('Malayalam'),
                  ),
                  ListTile(
                    onTap: () async {
                      context.locale = Locale('en', 'HI');
                    },
                    title: Text('Hindi'),
                  ),
                ]),
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
    );
  }

  void goToSecond(BuildContext context, productId) {
    Navigator.pushNamed(context, "second", arguments: productId);
  }

  Widget searchWidget(String text) {
    return ListTile(
      title: Text(
        text.length > 3 ? text.substring(0, 3) : text,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.indigoAccent),
      ),
      subtitle: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 12,
          color: Colors.black26,
        ),
      ),
    );
  }
}
