import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ticketsnow/db/firebaseaccount/log.dart';
import 'package:ticketsnow/db/firebaseaccount/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  User? user = FirebaseAuth.instance.currentUser;
  runApp(MaterialApp(
    useInheritedMediaQuery: true,
    theme: ThemeData(primarySwatch: Colors.blue),
    debugShowCheckedModeBanner: false,
    home: user == null ? Firelog() : Welcome(),
  ));
}
