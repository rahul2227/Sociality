import 'package:flutter/material.dart';
import 'package:sociality/HelperFunctions/Theme.dart';
import 'package:sociality/Widgets/QuestCard.dart';

class Questboard extends StatelessWidget {
  //table view of the screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.kBackgroundcolor,
      appBar: AppBar(
        title: Text(
          'Quest Board',
          style: Theme.of(context).textTheme.headline3,
        ),
        elevation: 0,
        actions: [
          IconButton(
              icon: Icon(Icons.add, size: 24.0, color: Constants.kTextcolor),
              onPressed: () {}),
        ],
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 12.0, 0, 0.0),
        child: Column(
          children: <Widget>[
            QuestCard(),
            QuestCard()
          ], //TODO Stream builder here
// to get the code and descriptions of the container made.
          //TODO See if the code is running without passing the context of the application
        ),
      ),
    );
  }
}
