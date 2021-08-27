import 'package:flutter/material.dart';
import 'package:sociality/HelperFunctions/Authenticate.dart';
import 'package:sociality/Services/Auth.dart';

import '../HelperFunctions/Theme.dart';

//TODO - No need for this screen now so transfer logout function

class AccountScreen extends StatelessWidget {
  final AuthService authService = new AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constants.kBackgroundcolor,
        appBar: AppBar(
          title: Text('Account details',
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .merge(TextStyle(fontWeight: FontWeight.w600))),
          elevation: 0,
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.logout,
                  size: 24.0,
                  color: Constants.kTextcolor,
                ),
                tooltip: 'Logout',
                onPressed: () {
                  AuthService().signOut();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Authenticate()));
                }),
          ],
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(0, 12.0, 0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Text('Full name',
                          style: Theme.of(context).textTheme.headline4),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Text('Rahul Sharma',
                          style: Theme.of(context).textTheme.headline2),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Text('Username',
                          style: Theme.of(context).textTheme.headline4),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Text('Rahul123',
                          style: Theme.of(context).textTheme.headline2),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Text('Clan',
                          style: Theme.of(context).textTheme.headline4),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Text('Winter Moon',
                          style: Theme.of(context).textTheme.headline2),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Text('Quest Completed',
                          style: Theme.of(context).textTheme.headline4),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Text('4',
                          style: Theme.of(context).textTheme.headline2),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
