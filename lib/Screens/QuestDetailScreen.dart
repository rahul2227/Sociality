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
                  onPressed: () {}, // verticle - 5.0 , horizontal - 10.0
                  style: eventButtonStyleSized(
                      buttonColor: Constants.kaccent1,
                      verticle: 5.0,
                      horizontal: 10.0),
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
                        'Complete the Project',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Text(
                        'Write only optimized code',
                        style: Theme.of(context).textTheme.bodyText1,
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
