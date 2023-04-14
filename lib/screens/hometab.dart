import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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
          SliverList(
              delegate: SliverChildListDelegate([
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
            Container(
              height: height * 0.05,
              width: double.infinity,
              child: ListTile(
                leading: Text('Recommended Movies',style: TextStyle(overflow: TextOverflow.ellipsis)),
                trailing: Text(
                  'See All',
                  style: TextStyle(color: Colors.pink,overflow: TextOverflow.ellipsis),
                ),
              ),
            )
          ]))
        ],
      ),
    );
  }
}
