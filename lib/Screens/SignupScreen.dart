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
    if (formKey.currentState.validate()) {
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
                        // crossAxisAlignment: CrossAxisAlignment.start,
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
                                      return value.isEmpty || value.length < 4
                                          ? "Please provide a Username"
                                          : null;
                                    },
                                    decoration: new InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 16.0),
                                        filled: true,
                                        fillColor: Constants.kCardcolor,
                                        border: InputBorder.none,
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: new BorderSide(
                                                color: Constants.kaccent1,
                                                width: 2.0)),
                                        hintText: 'Username',
                                        hintStyle: TextStyle(
                                            color: Constants.kTextcolor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18.0)),
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
                                              .hasMatch(value)
                                          ? null
                                          : "Please enter correct email";
                                    },
                                    decoration: new InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 16.0, vertical: 10.0),
                                        filled: true,
                                        fillColor: Constants.kCardcolor,
                                        border: InputBorder.none,
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: new BorderSide(
                                                color: Constants.kaccent1,
                                                width: 2.0)),
                                        hintText: 'Enter your Email',
                                        hintStyle: TextStyle(
                                            color: Constants.kTextcolor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18.0)),
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
                                      return val.length < 6
                                          ? "Please enter a Password having 6+ characters"
                                          : null;
                                    },
                                    decoration: new InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 16.0),
                                        filled: true,
                                        fillColor: Constants.kCardcolor,
                                        border: InputBorder.none,
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: new BorderSide(
                                                color: Constants.kaccent1,
                                                width: 2.0)),
                                        hintText: 'Enter a Password',
                                        hintStyle: TextStyle(
                                            color: Constants.kTextcolor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18.0)),
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                    obscureText: false,
                                    autofocus: false,
                                  ),
                                ),
                                SizedBox(
                                  height: 2.0,
                                ),
                                // Container(
                                //   alignment: Alignment.centerRight,
                                //   child: Container(
                                //     padding: EdgeInsets.symmetric(
                                //         horizontal: 16, vertical: 8),
                                //     child: Text(
                                //       "Forgot Password",
                                //       style: Theme.of(context).textTheme.headline5,
                                //     ),
                                //   ),
                                // ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Center(
                                  child: ConstrainedBox(
                                    constraints:
                                        BoxConstraints.tightFor(width: 150),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                          padding: MaterialStateProperty.all(
                                              EdgeInsets.all(8.0)),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Constants.kaccent1),
                                          shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0))),
                                          overlayColor: MaterialStateProperty
                                              .resolveWith<Color>(
                                            (Set<MaterialState> states) {
                                              if (states.contains(
                                                  MaterialState.hovered))
                                                return Constants.kaccent1;
                                              if (states.contains(
                                                      MaterialState.focused) ||
                                                  states.contains(
                                                      MaterialState.pressed))
                                                return Constants.kaccent1;
                                              return null; // Defer to the widget's default.
                                            },
                                          )),
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
