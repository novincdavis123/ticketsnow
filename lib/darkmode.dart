import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:ticketsnow/db/firebaseaccount/log.dart';
import 'package:ticketsnow/db/firebaseaccount/welcome.dart';
import 'package:ticketsnow/screens/Homescreen.dart';
import 'package:ticketsnow/screens/info.dart';

class Darkmode extends StatelessWidget {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.red,
        accentColor: Colors.amber,
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.red,
        accentColor: Colors.amber,
      ),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        useInheritedMediaQuery: true,
        debugShowCheckedModeBanner: false,
        theme: theme,
        darkTheme: darkTheme,
        routes: {
          "second": (context) => Info(),
        },
        home: user == null ? Firelog() : Welcome(),
      ),
    );
  }
}
