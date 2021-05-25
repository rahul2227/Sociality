import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sociality/HelperFunctions/Authenticate.dart';
import 'package:sociality/HelperFunctions/Theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Constants.kBackgroundcolor,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Constants.kTextcolor,
        ),
        fontFamily: 'Rajdhani',
        textTheme: TextTheme(
                headline1:
                    TextStyle(fontSize: 35.156, fontWeight: FontWeight.w600),
                headline2: TextStyle(
                    fontSize: 28.125,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.2),
                headline3:
                    TextStyle(fontSize: 22.5, fontWeight: FontWeight.w500),
                headline4: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: .8),
                headline5:
                    TextStyle(fontSize: 14.4, fontWeight: FontWeight.w600),
                headline6:
                    TextStyle(fontSize: 14.4, fontWeight: FontWeight.w700),
                bodyText1: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    letterSpacing: .85),
                button: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500))
            .apply(
          bodyColor: Constants.kTextcolor,
          displayColor: Constants.kTextcolor,
        ),
      ),
      initialRoute: "/authenticate",
      routes: {
        "/authenticate": (context) => Authenticate(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
