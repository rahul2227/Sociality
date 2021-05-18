import 'package:flutter/material.dart';
import 'package:sociality/HelperFunctions/Theme.dart';
import 'package:sociality/Screens/TaskBoard.dart';

Widget appBarCustom(BuildContext context, {String barTitle}) {
  return AppBar(
    title: (barTitle != null)
        ? Text(
            barTitle,
            style: Theme.of(context).textTheme.headline5,
          )
        : null,
    backgroundColor: Constants.kBackgroundcolor,
    elevation: 0,
    centerTitle: true,
    leading: Icon(
      Icons.settings,
      size: 24.0,
    ),
    actions: [
      IconButton(
          icon: Icon(Icons.content_paste_rounded,
              size: 24.0, color: Constants.kTextcolor),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Task()));
          }),
    ],
  );
}
