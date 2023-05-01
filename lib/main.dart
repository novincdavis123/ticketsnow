import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flame_splash_screen/flame_splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'package:ticketsnow/darkmode.dart';
import 'package:ticketsnow/provider/prov/movie_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  runApp(EasyLocalization(
      supportedLocales: [
        Locale('en', 'US'),
        Locale('en', 'GB'),
        Locale('en', 'HI'),
      ],
      path: 'assets/translations',
      saveLocale: true,
      fallbackLocale: Locale('en', 'US'),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          useInheritedMediaQuery: true,
          home: ChangeNotifierProvider<MovieProvider>(
            child: MyApp(),
            create: (_) =>
                MovieProvider(), // Create a new ChangeNotifier object
          ))));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      theme: ThemeData(primarySwatch: Colors.blue),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      home: MusiSplash(),
    );
  }
}

class MusiSplash extends StatelessWidget {
  const MusiSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FlameSplashScreen(
            theme: FlameSplashTheme.dark,
            showBefore: (BuildContext context) {
              return Text(
                "Special Thanks\nNovin\nLuminar Technolab\nGoogle\nMicrosoft\n\n\nInspiratons\nBookmyshow\nTicketsnew",
                style: TextStyle(color: Colors.amber, fontSize: 25),
              );
            },
            onFinish: (BuildContext context) => Navigator.of(context)
                .pushReplacement(
                    MaterialPageRoute(builder: (context) => Darkmode()))));
  }
}
