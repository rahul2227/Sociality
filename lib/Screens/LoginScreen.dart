import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sociality/HelperFunctions/Theme.dart';
import 'package:sociality/Services/Auth.dart';
import 'package:sociality/HelperFunctions/HelperFunction.dart';
import 'package:sociality/Services/Database.dart';
import 'package:sociality/Widgets/BottomTabBarWidget.dart';

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
          print(
              "This is the email value- ${DatabaseMethods().getUserInfo(emailEditingController.text)}");
          HelperFunctions.saveUserLoggedInSharedPreference(true);
          HelperFunctions.saveUserNameSharedPreference(
              userInfoSnapshot.docs[0].get("name"));
          // userInfoSnapshot.documents[0].data["userName"]);
          HelperFunctions.saveUserEmailSharedPreference(
              userInfoSnapshot.docs[0].get("email"));

          // Navigator.pushReplacement(context,
          //     MaterialPageRoute(builder: (context) => MainTimerScreen()));
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => BottomNavigation()));
        } else {
          setState(() {
            isloading = false;
            final snackBar = SnackBar(
              content: Text('Login Failed'),
              action: SnackBarAction(
                label: 'Try Again',
                onPressed: () {
                  //TODO - Some code to Try Again to perform the change if you want.
                },
              ),
            );

            // Find the ScaffoldMessenger in the widget tree
            // and use it to show a SnackBar.
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constants.kBackgroundcolor,
        body: isloading
            ? Container(
                child: Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.red[200],
                    valueColor: AlwaysStoppedAnimation(
                      Colors.red[100],
                    ),
                  ),
                ),
              )
            : LayoutBuilder(
                builder: (context, constraints) => ListView(
                  children: <Widget>[
                    Container(
                      constraints:
                          BoxConstraints(minHeight: constraints.maxHeight),
                      child: Form(
                        key: formKey,
                        child: Column(
                          //using this column with combination of single list instead of listview
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: MediaQuery.of(context).size.height * 0.20,
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                              child: Center(
                                child: Image.asset("assets/images/logo.png"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 10.0),
                              child: TextFormField(
                                controller: emailEditingController,
                                validator: (value) {
                                  return RegExp(
                                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                          .hasMatch(value)
                                      ? null
                                      : "Please Enter Correct Email";
                                },
                                decoration: textFieldInputDecorationSquared(
                                    "Enter Your Email"),
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 10.0),
                              child: TextFormField(
                                controller: passwordEditingController,
                                validator: (val) {
                                  return val.length > 6
                                      ? null
                                      : "Enter Password 6+ characters";
                                },
                                decoration: textFieldInputDecorationSquared(
                                    'Enter your password'),
                                style: Theme.of(context).textTheme.bodyText1,
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
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: Text("Forgot Password",
                                    style:
                                        Theme.of(context).textTheme.headline5),
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            ConstrainedBox(
                              constraints: BoxConstraints.tightFor(width: 150),
                              child: ElevatedButton(
                                style: eventButtonStyle(Constants.kaccent1),
                                onPressed: () {
                                  logIn();
                                },
                                child: Text("Login"),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Don't have an account? ",
                                    style:
                                        Theme.of(context).textTheme.headline5),
                                GestureDetector(
                                  onTap: () {
                                    widget.toggleView();
                                  },
                                  child: Text(
                                    "Sign up Now",
                                    style: TextStyle(
                                        color: Constants.kaccent1,
                                        decoration: TextDecoration.underline,
                                        fontSize: 14.4,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ));
  }
}
