import 'package:flutter/material.dart';
import 'package:sociality/HelperFunctions/Theme.dart';

class QuestDetails extends StatelessWidget {
  // this is the screen we get after we click on that card.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constants.kBackgroundcolor,
        appBar: AppBar(
          title: Text('Quest details',
              style: Theme.of(context).textTheme.headline5),
          elevation: 0,
          actions: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 10.0)),
                      backgroundColor:
                          MaterialStateProperty.all(Constants.kaccent1),
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
                  child: Text(
                    'Join',
                    style: Theme.of(context).textTheme.button,
                  )),
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(0, 12.0, 0, 0.0),
          child: Container(
            margin: EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
            child: Column(
              children: <Widget>[
                Column(
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
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Skill',
                                  style: Theme.of(context).textTheme.headline6),
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
                                    style:
                                        Theme.of(context).textTheme.headline6),
                                Text('4yrs',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Quest Members',
                      style: Theme.of(context).textTheme.headline5,
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
