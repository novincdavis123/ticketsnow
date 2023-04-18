import 'package:flutter/material.dart';
import 'package:ticketsnow/db/firebaseaccount/FireHelper.dart';
import 'package:ticketsnow/db/firebaseaccount/log.dart';
import 'package:ticketsnow/screens/Homescreen.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
            icon: Icon(Icons.nat)),
      ),
      body: Center(
        child: Text('welcome'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AuthHelper().signOut().then((_) => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Firelog())));
        },
        child: Text('Logout'),
      ),
    );
  }
}
