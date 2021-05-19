import 'package:flutter/material.dart';
import 'package:sociality/HelperFunctions/HelperFunction.dart';
import 'package:sociality/Screens/MainTimerScreen.dart';
import 'package:sociality/Services/Auth.dart';
import 'package:sociality/Services/Database.dart';

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
      backgroundColor: const Color(0xfff06449),
      body: isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : ListView(
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    //using this column with combination of single list instead of listview
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height * 0.45,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Image.asset("assets/images/logo.png"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 16),
                        child: TextFormField(
                          controller: usernameEditingController,
                          validator: (value) {
                            return value.isEmpty || value.length < 4
                                ? "Please provide a Username"
                                : null;
                          },
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 16),
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
                            border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(30.0),
                              ),
                            ),
                            hintText: 'Enter your Email ID',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 16),
                        child: TextFormField(
                          controller: passwordEditingController,
                          validator: (val) {
                            return val.length < 6
                                ? "Please enter a Password having 6+ characters"
                                : null;
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
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                              signMeUp();
                            },
                            child: Text("Sign Up"),
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
                          Text("Already have an account "),
                          GestureDetector(
                            onTap: () {
                              widget.toggleView();
                            },
                            child: Text(
                              "Sign In Now",
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
                ),
              ],
            ),
    );
  }
}
