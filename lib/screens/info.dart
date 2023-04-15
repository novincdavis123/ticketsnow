import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ticketsnow/screens/dummy_movies.dart';
import 'package:ticketsnow/screens/ticketpage.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class Info extends StatefulWidget {
  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  final _txtController = TextEditingController();
  //! Use `YoutubePlayerController.fromVideoId` if just play a single video.
  final _ytController = YoutubePlayerController(
    params: const YoutubePlayerParams(
        showFullscreenButton: true, mute: false, showControls: true),
  );

//urlchanger
  @override
  void initState() {
    super.initState();
    _txtController.text = 'https://www.youtube.com/watch?v=d9MyW72ELq0';
  }

  String? _getVideoId() {
    if (_txtController.text.startsWith('https://youtu.be/')) {
      return _txtController.text.substring('https://youtu.be/'.length);
    } else if (_txtController.text
        .startsWith('https://www.youtube.com/watch?v=')) {
      return _txtController.text
          .substring('https://www.youtube.com/watch?v='.length);
    }
    return null;
  }

  Future<void> _play() async {
    final videoId = _getVideoId();
    if (videoId == null) {
      ScaffoldMessenger.of(context)
        ..clearSnackBars()
        ..showSnackBar(
          SnackBar(
            content: Text(
                'Failed to extract video Id from "${_txtController.text}"!\n'
                'Please make sure it is in either "https://youtu.be/\$id" or "https://www.youtube.com/watch?v=\$id" format!'),
          ),
        );
      return;
    }
    //? loadVideoByUrl doesn't work?
    // await _ytController.loadVideoByUrl(mediaContentUrl: _txtController.text);
    await _ytController.loadVideoById(videoId: videoId);
  }

  var images = [
    NetworkImage(
        'https://images.unsplash.com/photo-1516108317508-6788f6a160e4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8aXRhbHl8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'),
    NetworkImage(
        'https://images.unsplash.com/photo-1534445867742-43195f401b6c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGl0YWx5fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
    NetworkImage(
        'https://images.unsplash.com/photo-1594881497142-08fdfdfc4074?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzN8fGl0YWx5fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
  ];

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context)?.settings.arguments; // id from previous page
    final product =
        dummyProducts.firstWhere((element) => element["id"] == productId);
    return SafeArea(
      child: Material(
        child: YoutubePlayerScaffold(
          builder: (ctx, player) => SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          _txtController.text = product["url"];
                        },
                        child: Text('pl')),
                    ElevatedButton(onPressed: _play, child: Text('play')),
                  ],
                ),
                player,
                Text(
                  product["name"],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(product["image"]))),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => Ticket()));
                    },
                    child: Text('Book Tickets'))
              ],
            ),
          ),
          controller: _ytController,
        ),
      ),
    );
  }
}
