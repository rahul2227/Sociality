import 'package:flutter/material.dart';
import 'package:sociality/HelperFunctions/Theme.dart';

class Newquest extends StatefulWidget {
  // this is the new quest form
// Quest data will be transferred to firebase from here and then will be retrieved by
// Quest board
  @override
  _NewquestState createState() => _NewquestState();
}

class _NewquestState extends State<Newquest> {
  final List<String> dropitems = <String>[
    "Beginner",
    "Intermediate",
    "Advanced"
  ];
  //final List<String> data = [];
  String selected = 'Beginner';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constants.kBackgroundcolor,
        appBar: AppBar(
          title:
              Text('New Quest', style: Theme.of(context).textTheme.headline5),
          titleSpacing: 0,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 12.0, 0, 0.0),
            child: Container(
              margin: EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Text('Quest name',
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .merge(TextStyle(fontWeight: FontWeight.w700))),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: TextField(
                      style: Theme.of(context).textTheme.bodyText1,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Constants.kCardcolor,
                        //hoverColor: Constants.kCardcolor,
                        focusColor: Constants.kaccent1,
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                            borderSide: new BorderSide(
                                color: Constants.kaccent1, width: 3.0)),
                        errorBorder: OutlineInputBorder(
                            borderSide: new BorderSide(
                                color: Constants.kaccent1, width: 3.0)),
                        contentPadding: EdgeInsets.all(12.0),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Text('Quest description',
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .merge(TextStyle(fontWeight: FontWeight.w700))),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: TextField(
                      maxLines: 5,
                      style: Theme.of(context).textTheme.bodyText1,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Constants.kCardcolor,
                        //hoverColor: Constants.kCardcolor,
                        focusColor: Constants.kaccent1,
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                            borderSide: new BorderSide(
                                color: Constants.kaccent1, width: 3.0)),
                        errorBorder: OutlineInputBorder(
                            borderSide: new BorderSide(
                                color: Constants.kaccent1, width: 3.0)),
                        contentPadding: EdgeInsets.all(12.0),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Text('Skill',
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .merge(TextStyle(fontWeight: FontWeight.w700))),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
                    color: Constants.kCardcolor,
                    child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                      dropdownColor: Constants.kaccent1,
                      autofocus: true,
                      isExpanded: true,
                      icon: Icon(
                          // Add this
                          Icons.arrow_drop_down, // Add this
                          color: Constants.kTextcolor,
                          size: 24.0 // Add this
                          ),
                      elevation: 2,
                      style:
                          Theme.of(context).textTheme.bodyText1.merge(TextStyle(
                                color: Constants.kTextcolor,
                              )),
                      value: selected,
                      items: dropitems.map((item) {
                        return DropdownMenuItem(
                          value: item,
                          child: new Text(item),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selected = value;
                        });
                      },
                    )),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Text('Minimum experience',
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .merge(TextStyle(fontWeight: FontWeight.w700))),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: TextField(
                      style: Theme.of(context).textTheme.bodyText1,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Constants.kCardcolor,
                        //hoverColor: Constants.kCardcolor,
                        focusColor: Constants.kaccent1,
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                            borderSide: new BorderSide(
                                color: Constants.kaccent1, width: 3.0)),
                        errorBorder: OutlineInputBorder(
                            borderSide: new BorderSide(
                                color: Constants.kaccent1, width: 3.0)),
                        contentPadding: EdgeInsets.all(12.0),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 90,
                        margin: EdgeInsets.only(top: 10.0),
                        child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.all(8.0)),
                                backgroundColor: MaterialStateProperty.all(
                                    Constants.kaccent1),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0))),
                                overlayColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                    if (states.contains(MaterialState.hovered))
                                      return Constants.kaccent1;
                                    if (states
                                            .contains(MaterialState.focused) ||
                                        states.contains(MaterialState.pressed))
                                      return Constants.kaccent1;
                                    return null; // Defer to the widget's default.
                                  },
                                )),
                            child: Text('Done',
                                style: Theme.of(context).textTheme.button)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
