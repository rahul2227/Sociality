import 'package:flutter/material.dart';
import 'package:sociality/HelperFunctions/HelperFunction.dart';
import 'package:sociality/HelperFunctions/Theme.dart';
import 'package:sociality/Screens/MainTimerScreen.dart';
import 'package:sociality/Services/Auth.dart';
import 'package:sociality/Services/Database.dart';

import 'MainTimerScreen.dart';

class SignUp extends StatefulWidget {
  final Function toggleView;
  SignUp(this.toggleView);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();
  TextEditingController usernameEditingController = new TextEditingController();

  AuthService authService = new AuthService();
  DatabaseMethods databaseMethods = new DatabaseMethods();

  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  signMeUp() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      await authService
          .signUpWithEmailAndPassword(
              emailEditingController.text, passwordEditingController.text)
          .then((result) {
        if (result != null) {
          Map<String, String> userDataMap = {
            "name": usernameEditingController.text,
            "email": emailEditingController.text
          };

          print(userDataMap);

          databaseMethods.addUserInfo(userDataMap);

          HelperFunctions.saveUserLoggedInSharedPreference(true);
          HelperFunctions.saveUserNameSharedPreference(
              usernameEditingController.text);
          HelperFunctions.saveUserEmailSharedPreference(
              emailEditingController.text);

          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => MainTimerScreen()));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.kBackgroundcolor,
      body: isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
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
                            child: Column(
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.20,
                                  padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                                  width: MediaQuery.of(context).size.width,
                                  child: Center(
                                    child:
                                        Image.asset("assets/images/logo.png"),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 10.0),
                                  child: TextFormField(
                                    controller: usernameEditingController,
                                    validator: (value) {
                                      return value!.isEmpty || value.length < 4
                                          ? "Please provide a Username"
                                          : null;
                                    },
                                    decoration: textFieldInputDecorationSquared(
                                        'Username'),
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                    obscureText: false,
                                    autofocus: false,
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
                                              .hasMatch(value!)
                                          ? null
                                          : "Please enter correct email";
                                    },
                                    decoration: textFieldInputDecorationSquared(
                                        'Enter your Email'),
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                    autofocus: false,
                                    obscureText: false,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 10.0),
                                  child: TextFormField(
                                    controller: passwordEditingController,
                                    validator: (val) {
                                      return val!.length < 6
                                          ? "Please enter a Password having 6+ characters"
                                          : null;
                                    },
                                    decoration: textFieldInputDecorationSquared(
                                        'Enter a Password'),
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                    obscureText: false,
                                    autofocus: false,
                                  ),
                                ),
                                SizedBox(
                                  height: 2.0,
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Center(
                                  child: ConstrainedBox(
                                    constraints:
                                        BoxConstraints.tightFor(width: 150),
                                    child: ElevatedButton(
                                      style:
                                          eventButtonStyle(Constants.kaccent1),
                                      onPressed: () {
                                        signMeUp();
                                      },
                                      child: Text("Sign Up"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // You need to give new text here consult with NAV
                                Text("Already have an account. ",
                                    style:
                                        Theme.of(context).textTheme.headline5),
                                GestureDetector(
                                  onTap: () {
                                    widget.toggleView();
                                  },
                                  child: Text(
                                    "Sign In Now",
                                    style: TextStyle(
                                        color: Constants.kaccent1,
                                        decoration: TextDecoration.underline,
                                        fontSize: 14.4,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
