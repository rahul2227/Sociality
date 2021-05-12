import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sociality/HelperFunctions/Authenticate.dart';

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
          canvasColor: Colors.blueGrey,
          iconTheme: IconThemeData(color: Colors.red),
          accentColor: Colors.blueAccent,
          brightness: Brightness.dark),
      initialRoute: "/authenticate",
      routes: {
        "/authenticate": (context) => Authenticate(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
