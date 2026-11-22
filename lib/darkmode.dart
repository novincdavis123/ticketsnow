import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:material_ui/material_ui.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:ticketsnow/db/firebaseaccount/log.dart';
import 'package:ticketsnow/screens/Homescreen.dart';
import 'package:ticketsnow/screens/info.dart';

class Darkmode extends StatelessWidget {
  final User? user = FirebaseAuth.instance.currentUser;

  Darkmode({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.red,
          brightness: Brightness.light,
        ).copyWith(secondary: Colors.amber),
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.red,
          brightness: Brightness.dark,
        ).copyWith(secondary: Colors.amber),
      ),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        darkTheme: darkTheme,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        builder: (context, child) {
          return MaterialUiCompatibilityBridge(child: child!);
        },
        routes: {
          "second": (context) => Info(),
        },
        home: user == null ? Firelog() : Home(),
      ),
    );
  }
}
