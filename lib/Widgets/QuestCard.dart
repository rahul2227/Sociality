import 'package:flutter/material.dart';
import 'package:sociality/HelperFunctions/Theme.dart';
import 'package:sociality/Screens/QuestDetailScreen.dart';

class QuestCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
      child: TextButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.all(15.0)),
            backgroundColor: MaterialStateProperty.all(Constants.kCardcolor),
            overlayColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.hovered))
                  return Constants.kaccent1;
                if (states.contains(MaterialState.focused) ||
                    states.contains(MaterialState.pressed))
                  return Constants.kaccent1;
                return null; // Defer to the widget's default.
              },
            )),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => QuestDetails()));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Text(
                'Quest Name',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Text(
                'Commodo anim nulla aliquip pariatur fugiat officia tempor quis esse est cillum aute.',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Skill', style: Theme.of(context).textTheme.headline6),
                    Text('Medium',
                        style: Theme.of(context).textTheme.bodyText1),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Experience',
                          style: Theme.of(context).textTheme.headline6),
                      Text('4yrs',
                          style: Theme.of(context).textTheme.bodyText1),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
