import 'package:flutter/material.dart';
import 'package:sociality/HelperFunctions/Theme.dart';

changeEmail(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title:
              Text('Edit Email', style: Theme.of(context).textTheme.headline3),
          content: TextField(
            // TODO - text form field implementation
            style: Theme.of(context).textTheme.bodyText1,
            decoration: textFieldInputDecorationSmall(),
          ),
          actions: [
            Container(
              width: 80,
              margin: EdgeInsets.only(right: 8.0),
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: eventButtonStyle(Constants.kaccent1),
                  child: Text('Done',
                      style: Theme.of(context).textTheme.bodyText1.merge(
                          TextStyle(color: Constants.kBackgroundcolor)))),
            ),
          ],
        );
      });
}

changePassword(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title:
              Text('Edit Email', style: Theme.of(context).textTheme.headline4),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Enter Old Password',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .merge(TextStyle(fontWeight: FontWeight.w600))),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: TextField(
                    style: Theme.of(context).textTheme.bodyText1,
                    decoration: textFieldInputDecorationSmall(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text('Enter New Password',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .merge(TextStyle(fontWeight: FontWeight.w600))),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: TextField(
                    style: Theme.of(context).textTheme.bodyText1,
                    decoration: textFieldInputDecorationSmall(),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Container(
              width: 80,
              margin: EdgeInsets.only(right: 8.0),
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: eventButtonStyle(Constants.kaccent1),
                  child: Text('Done',
                      style: Theme.of(context).textTheme.bodyText1.merge(
                          TextStyle(color: Constants.kBackgroundcolor)))),
            ),
          ],
        );
      });
}
