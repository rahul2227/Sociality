import 'package:flutter/material.dart';
import 'package:sociality/HelperFunctions/Theme.dart';

class Generatetask extends StatefulWidget {
  @override
  _GeneratetaskState createState() => _GeneratetaskState();
}

class _GeneratetaskState extends State<Generatetask> {
  final List<String> dropitems = <String>["Quest 1", "Quest 2", "Quest 3"];

  String selected = 'Quest 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.kBackgroundcolor,
      appBar: AppBar(
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 12.0, 0, 0.0),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //text name
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        'Task Name',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20.0),
                      child: TextField(
                        style: Theme.of(context).textTheme.bodyText1,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Constants.kCardcolor,
                          //hoverColor: Constants.kCardcolor,
                          focusColor: Constants.kaccent1,
                          border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                  const Radius.circular(30.0))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                  const Radius.circular(30.0)),
                              borderSide: new BorderSide(
                                  color: Constants.kaccent1, width: 3.0)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                  const Radius.circular(30.0)),
                              borderSide: new BorderSide(
                                  color: Constants.kaccent1, width: 3.0)),
                          contentPadding: EdgeInsets.all(12.0),
                        ),
                      ),
                    ),

                    //text description
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        'Task Description',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20.0),
                      child: TextField(
                        maxLines: 5,
                        style: Theme.of(context).textTheme.bodyText1,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Constants.kCardcolor,
                          //hoverColor: Constants.kCardcolor,
                          focusColor: Constants.kaccent1,
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(30.0),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(30.0),
                            ),
                            borderSide: new BorderSide(
                                color: Constants.kaccent1, width: 3.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(30.0),
                            ),
                            borderSide: new BorderSide(
                                color: Constants.kaccent1, width: 3.0),
                          ),
                          contentPadding: EdgeInsets.all(12.0),
                        ),
                      ),
                    ),

                    //quest selection
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        'Select your quest',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    Container(
                      // TODO - Understand the meaning of this code from nav
                      margin: const EdgeInsets.only(bottom: 20.0),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
                      color: Constants.kCardcolor,
                      child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                        dropdownColor: Constants.kaccent1,
                        autofocus: true,
                        isExpanded: true,
                        icon: Icon(Icons.arrow_drop_down,
                            color: Constants.kTextcolor, size: 24.0),
                        elevation: 2,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .merge(TextStyle(
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

                    //break time
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        'Break Time',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20.0),
                      child: TextField(
                        style: Theme.of(context).textTheme.bodyText1,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Constants.kCardcolor,
                          //hoverColor: Constants.kCardcolor,
                          focusColor: Constants.kaccent1,
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(30.0),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(30.0),
                              ),
                              borderSide: new BorderSide(
                                  color: Constants.kaccent1, width: 3.0)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(30.0),
                              ),
                              borderSide: new BorderSide(
                                  color: Constants.kaccent1, width: 3.0)),
                          contentPadding: EdgeInsets.all(12.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 90,
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.all(8.0)),
                              backgroundColor:
                                  MaterialStateProperty.all(Constants.kaccent1),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0))),
                              overlayColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.hovered))
                                    return Constants.kaccent1;
                                  if (states.contains(MaterialState.focused) ||
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
