import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sociality/HelperFunctions/Authenticate.dart';
import 'package:sociality/HelperFunctions/Theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
                    TextStyle(fontSize: 31.104, fontWeight: FontWeight.w600),
                headline2:
                    TextStyle(fontSize: 25.92, fontWeight: FontWeight.w600),
                headline3:
                    TextStyle(fontSize: 21.6, fontWeight: FontWeight.w600),
                headline4:
                    TextStyle(fontSize: 15.0, fontWeight: FontWeight.w700),
                bodyText1:
                    TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
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
