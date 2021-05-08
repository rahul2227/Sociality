import "package:flutter/material.dart";
import 'package:sociality/Screens/LoginScreen.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return showSignIn ? LoginScreen(toggleView) : SignUp(toggleView);
  }
}
