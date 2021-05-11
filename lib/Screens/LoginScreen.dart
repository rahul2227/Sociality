import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sociality/Screens/MainTimerScreen.dart';
import 'package:sociality/Services/Auth.dart';
import 'package:sociality/HelperFunctions/HelperFunction.dart';
import 'package:sociality/Services/Database.dart';

class LoginScreen extends StatefulWidget {
  final Function toggleView;

  LoginScreen(this.toggleView);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();

  AuthService authService = new AuthService();

  final formKey = GlobalKey<FormState>();
  bool isloading = false;

  logIn() async {
    if (formKey.currentState.validate()) {
      setState(() {
        isloading = true;
      });

      await authService
          .signInWithEmailAndPassword(
              emailEditingController.text, passwordEditingController.text)
          .then((result) async {
        if (result != null) {
          QuerySnapshot userInfoSnapshot =
              await DatabaseMethods().getUserInfo(emailEditingController.text);

          HelperFunctions.saveUserLoggedInSharedPreference(true);
          HelperFunctions.saveUserNameSharedPreference(
              userInfoSnapshot.docs[0].get("name"));
          // userInfoSnapshot.documents[0].data["userName"]);
          HelperFunctions.saveUserEmailSharedPreference(
              userInfoSnapshot.docs[0].get("email"));

          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => MainTimerScreen()));
          // TODO Navigate to the main timer screen here.
        } else {
          setState(() {
            isloading = false;
            //TODO show snackbar
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff06449),
      body: ListView(
        //using this column with combination of single list instead of listview
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
            child: TextFormField(
              controller: emailEditingController,
              validator: (value) {
                return RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)
                    ? null
                    : "Please Enter Correct Email";
              },
              decoration: new InputDecoration(
                border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(30.0),
                  ),
                ),
                hintText: 'Enter your Email',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
            child: TextFormField(
              controller: passwordEditingController,
              validator: (val) {
                return val.length > 6 ? null : "Enter Password 6+ characters";
              },
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
          SizedBox(
            height: 2.0,
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text("Forgot Password"),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Center(
            child: ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 200),
              child: ElevatedButton(
                onPressed: () {
                  logIn();
                  // TODO - Implement a timer main screen to send
                  // the controller and user to the main screen
                },
                child: Text("Login"),
              ),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // You need to give new text here consult with NAV
              Text("Don't have an account "),
              GestureDetector(
                onTap: () {
                  widget.toggleView();
                },
                child: Text(
                  "Sign up Now",
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
