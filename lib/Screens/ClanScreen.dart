import 'package:flutter/material.dart';
import 'package:sociality/HelperFunctions/Theme.dart';

class Clan extends StatelessWidget {
  Container buildclanmember(BuildContext context) {
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
          confirmbox(context);
        },
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  Icon(Icons.circle, color: Constants.kTextcolor, size: 18.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text('Clan member name',
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
                  Text('Clan member name',
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
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.all(8.0)),
                        backgroundColor:
                            MaterialStateProperty.all(Constants.kaccent2),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0))),
                        overlayColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.hovered))
                              return Constants.kaccent2;
                            if (states.contains(MaterialState.focused) ||
                                states.contains(MaterialState.pressed))
                              return Constants.kaccent2;
                            return null; // Defer to the widget's default.
                          },
                        )),
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
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.all(8.0)),
                        backgroundColor:
                            MaterialStateProperty.all(Constants.kaccent1),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0))),
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
          title: Text(
            'Clan Name',
            style: Theme.of(context).textTheme.headline3,
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
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.all(15.0)),
                      backgroundColor:
                          MaterialStateProperty.all(Constants.kCardcolor),
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
                    // Navigator.of(context)
                    //     .push(MaterialPageRoute(builder: (context) => QuestDetails()));
                    confirmbox(context);
                  },
                  child: SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.star,
                            color: Constants.kTextcolor, size: 24.0),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text(
                            'Leader Name',
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
