import 'package:flutter/material.dart';
import 'package:sociality/HelperFunctions/Authenticate.dart';
import 'package:sociality/HelperFunctions/Theme.dart';
import 'package:sociality/HelperFunctions/utils.dart';
import 'package:sociality/Services/Auth.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool mask = false;
  final AuthService authService = new AuthService();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Constants.kBackgroundcolor,
      appBar: AppBar(
        title: Text('Profile', style: theme.textTheme.headline4),
        elevation: 0,
        actions: [
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
          IconButton(
              onPressed: () {
                setState(() {
                  mask = !mask;
                });
              },
              icon: Icon(Icons.edit, size: 24.0, color: Constants.kaccent1))
        ],
      ),
      body: Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 38,
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1464802686167-b939a6910659?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=733&q=80'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Username',
                          style: theme.textTheme.headline3,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(
                            'Occcupation/stream',
                            style: theme.textTheme.headline3!
                                .merge(TextStyle(fontWeight: FontWeight.w500)),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  'Email',
                  style: theme.textTheme.bodyText1!
                      .merge(TextStyle(fontWeight: FontWeight.w600)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Constants.kBackgroundcolor),
                        padding:
                            MaterialStateProperty.all(EdgeInsets.all(0.0))),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        'email@email.com',
                        style: theme.textTheme.headline3!.merge(TextStyle(
                            color: Constants.kbodycolor,
                            fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ),
                  if (mask)
                    IconButton(
                        onPressed: () {
                          changeEmail(context);
                        },
                        icon: Icon(Icons.edit_outlined,
                            size: 24.0, color: Constants.kaccent1))
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  'Password',
                  style: theme.textTheme.bodyText1!
                      .merge(TextStyle(fontWeight: FontWeight.w600)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Constants.kBackgroundcolor),
                        padding:
                            MaterialStateProperty.all(EdgeInsets.all(0.0))),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        '*******',
                        style: theme.textTheme.headline3!.merge(TextStyle(
                            color: Constants.kbodycolor,
                            fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ),
                  if (mask)
                    IconButton(
                        onPressed: () {
                          changePassword(context);
                        },
                        icon: Icon(Icons.edit_outlined,
                            size: 24.0, color: Constants.kaccent1))
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  'Quest Completed',
                  style: theme.textTheme.bodyText1!
                      .merge(TextStyle(fontWeight: FontWeight.w600)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  '12',
                  style: theme.textTheme.headline3!.merge(TextStyle(
                      color: Constants.kbodycolor,
                      fontWeight: FontWeight.w500)),
                ),
              ),
            ],
          )),
    );
  }
}
