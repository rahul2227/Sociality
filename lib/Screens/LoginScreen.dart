import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  // final Function toggleView;

  // LoginScreen(this.toggleView)

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff06449),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.45,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text("Main Themed Icon will come here."),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
            child: TextField(
              decoration: new InputDecoration(
                border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(30.0),
                  ),
                ),
                hintText: 'Enter your username',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(30.0),
                  ),
                ),
                hintText: 'Enter your password',
              ),
              autofocus: false,
              obscureText: true,
            ),
          ),
          Center(
            child: ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 200),
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Login"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
