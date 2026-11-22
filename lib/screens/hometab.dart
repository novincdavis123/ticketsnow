import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:material_ui/material_ui.dart';
import 'package:ticketsnow/screens/dummy_movies.dart';
import 'package:url_launcher/url_launcher.dart';

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
                      Switchval = value;
                    });
                    if (Switchval == false) {
                      AdaptiveTheme.of(context).setLight();
                    } else {
                      AdaptiveTheme.of(context).setDark();
                    }
                  },
                  value: Switchval),
            ],
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              margin: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
              child: SearchAnchor.bar(
                barHintText: 'Search Me',
                barLeading: const Icon(Icons.search, color: Colors.blueGrey),
                barShape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    side: const BorderSide(color: Colors.grey),
                  ),
                ),
                onSubmitted: (value) {
                  debugPrint("Submitted: $value");
                },
                suggestionsBuilder: (context, controller) {
                  final query = controller.text.toLowerCase();
                  final matches = searchableList
                      .where((item) => item.toLowerCase().contains(query))
                      .toList();

                  return List<ListTile>.generate(matches.length, (index) {
                    final item = matches[index];
                    return ListTile(
                      title: Text(
                        item,
                        style: const TextStyle(fontSize: 14),
                      ),
                      onTap: () {
                        debugPrint("Selected item: $item");
                        controller.closeView(item);
                      },
                    );
                  });
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
            SizedBox(
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
          margin: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
          child: SearchAnchor.bar(
            barHintText: 'Search Me',
            barLeading: const Icon(Icons.search, color: Colors.blueGrey),
            barShape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
                side: const BorderSide(color: Colors.grey),
              ),
            ),
            onSubmitted: (value) {
              debugPrint("Submitted: $value");
            },
            suggestionsBuilder: (context, controller) {
              final query = controller.text.toLowerCase();
              final matches = searchableList
                  .where((item) => item.toLowerCase().contains(query))
                  .toList();

              return List<ListTile>.generate(matches.length, (index) {
                final item = matches[index];
                return ListTile(
                  title: Text(
                    item,
                    style: const TextStyle(fontSize: 14),
                  ),
                  onTap: () {
                    debugPrint("Selected item: $item");
                    controller.closeView(item);
                  },
                );
              });
            },
          ),
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
