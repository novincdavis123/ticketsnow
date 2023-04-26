import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticketsnow/demo/provider/prov/movie_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MyListScreen extends StatefulWidget {
  const MyListScreen({Key? key}) : super(key: key);

  @override
  _MyListScreenState createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> {
  @override
  Widget build(BuildContext context) {
    final _myList = context.watch<MovieProvider>().myList;

    return Scaffold(
      appBar: AppBar(
        title: Text("My List (${_myList.length})"),
      ),
      body: ListView.builder(
          itemCount: _myList.length,
          itemBuilder: (_, index) {
            final currentMovie = _myList[index];
            return Card(
              key: ValueKey(currentMovie.title),
              elevation: 4,
              child: ListTile(
                title: Text(currentMovie.title),
                subtitle: Text(currentMovie.runtime ?? ''),
                trailing: TextButton(
                  child: const Text(
                    'Remove',
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () {
                    context.read<MovieProvider>().removeFromList(currentMovie);
                  },
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton.large(
          child: Text('Payments'),
          onPressed: () => launchUrl(Uri.parse(
              'https://accounts.google.com/InteractiveLogin/signinchooser?continue=https%3A%2F%2Fpay.google.com%2Fpayments%2Fhome%23&followup=https%3A%2F%2Fpay.google.com%2Fpayments%2Fhome&osid=1&passive=1209600&service=billing&ifkv=AQMjQ7TwMyPmfgHpx4R01ZRuAL6MkAUPGNAKi4p6kxJAYqCMZ_JTTOCE_Ecp7yB4HLvvwJQI7iNUDw&flowName=GlifWebSignIn&flowEntry=ServiceLogin'))),
    );
  }
}
