import 'package:flutter/material.dart';
import 'package:sociality/HelperFunctions/Theme.dart';

class Clan extends StatelessWidget {
  Container buildclanmember(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
      child: TextButton(
        style: eventButtonStyle15(Constants.kaccent1),
        onPressed: () {
          confirmbox(context);
        },
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  Icon(Icons.circle, color: Constants.kTextcolor, size: 14.4),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text('Nav Jindal',
                        style: Theme.of(context).textTheme.headline3),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  confirmbox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Constants.kBackgroundcolor,
            title: Text('Do you want to add these in your session',
                style: Theme.of(context).textTheme.headline4),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Nav Jindal',
                      style: Theme.of(context).textTheme.headline3),
                ],
              ),
            ),
            actions: [
              Container(
                width: 90,
                margin: EdgeInsets.only(right: 8.0),
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: eventButtonStyle(Constants.kaccent2),
                    child: Text('Cancel',
                        style: Theme.of(context).textTheme.button)),
              ),
              Container(
                width: 90,
                margin: EdgeInsets.only(right: 8.0),
                child: TextButton(
                    onPressed: () {
                      //on click it will go the home screen
                    },
                    style: eventButtonStyle(Constants.kaccent1),
                    child:
                        Text('Add', style: Theme.of(context).textTheme.button)),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constants.kBackgroundcolor,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text(
            'Winter Moon',
            style: Theme.of(context)
                .textTheme
                .headline3!
                .merge(TextStyle(fontWeight: FontWeight.w600)),
          ),
          elevation: 0,
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(0, 12.0, 0, 0.0),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
                child: TextButton(
                  style: eventButtonStyle15(Constants.kaccent1),
                  onPressed: () {
                    // Navigator.of(context)
                    //     .push(MaterialPageRoute(builder: (context) => QuestDetails()));
                    confirmbox(context);
                  },
                  child: SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.star,
                            color: Constants.kTextcolor, size: 22.5),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text(
                            'Rahul Sharma',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              buildclanmember(context),
            ],
          ),
        ));
  }
}
