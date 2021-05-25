import 'package:flutter/material.dart';
import 'package:sociality/HelperFunctions/Theme.dart';
import 'package:sociality/Screens/Pop-UP%20view/AddTaskPopUp.dart';

class Task extends StatefulWidget {
  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  final TextEditingController ctrl = TextEditingController();
  bool mask = true;
  List<String> task = []; //

  Container buildtask(
      BuildContext context, String data, int serialNumber, bool masking) {
    setState(() {
      task.add(ctrl.text);
    });
    return Container(
      margin: EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
      child: TextButton(
        onPressed: () {},
        autofocus: true,
        style: ButtonStyle(
            padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0)),
            backgroundColor: MaterialStateProperty.all(Constants.kaccent1),
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    '$serialNumber.',
                    style:
                        Theme.of(context).textTheme.headline3.merge(TextStyle(
                              color: Constants.kBackgroundcolor,
                            )),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 7.0),
                  child: Text(
                    '$data',
                    style:
                        Theme.of(context).textTheme.headline3.merge(TextStyle(
                              color: Constants.kBackgroundcolor,
                            )),
                  ),
                ),
              ],
            ),
            if (!masking)
              IconButton(
                onPressed: () {
                  setState(() {
                    task.removeAt(serialNumber - 1);
                  });
                },
                icon: Icon(Icons.delete,
                    size: 24, color: Constants.kBackgroundcolor),
              ),
          ],
        ),
      ),
    );
  }

  // addNewTask(context, ctrl, task, stateFunction);

  // addNewTask(BuildContext context) {
  //   return showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           title:
  //               Text('New Task', style: Theme.of(context).textTheme.headline3),
  //           content: TextField(
  //             style: Theme.of(context).textTheme.bodyText1,
  //             decoration: InputDecoration(
  //               filled: true,
  //               fillColor: Constants.kCardcolor,
  //               //hoverColor: Constants.kCardcolor,
  //               focusColor: Constants.kaccent1,
  //               border: InputBorder.none,
  //               focusedBorder: OutlineInputBorder(
  //                   borderSide:
  //                       new BorderSide(color: Constants.kaccent1, width: 3.0)),
  //               errorBorder: OutlineInputBorder(
  //                   borderSide:
  //                       new BorderSide(color: Constants.kaccent1, width: 3.0)),
  //               contentPadding: EdgeInsets.all(12.0),
  //             ),
  //             controller: ctrl,
  //           ),
  //           actions: [
  //             Container(
  //               width: 90,
  //               margin: EdgeInsets.only(right: 8.0),
  //               child: TextButton(
  //                   onPressed: () {
  //                     setState(() {
  //                       task.add(ctrl.text);
  //                     });
  //                     Navigator.of(context).pop();
  //                   },
  //                   style: ButtonStyle(
  //                       padding: MaterialStateProperty.all(EdgeInsets.all(8.0)),
  //                       backgroundColor:
  //                           MaterialStateProperty.all(Constants.kaccent1),
  //                       shape: MaterialStateProperty.all(RoundedRectangleBorder(
  //                           borderRadius: BorderRadius.circular(30.0))),
  //                       overlayColor: MaterialStateProperty.resolveWith<Color>(
  //                         (Set<MaterialState> states) {
  //                           if (states.contains(MaterialState.hovered))
  //                             return Constants.kaccent1;
  //                           if (states.contains(MaterialState.focused) ||
  //                               states.contains(MaterialState.pressed))
  //                             return Constants.kaccent1;
  //                           return null; // Defer to the widget's default.
  //                         },
  //                       )),
  //                   child: Text('Done',
  //                       style: Theme.of(context).textTheme.button)),
  //             ),
  //           ],
  //         );
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.kBackgroundcolor,
      appBar: AppBar(
        title: Text(
          'My Tasks',
          style: Theme.of(context).textTheme.headline3,
        ),
        elevation: 0,
        backgroundColor: Constants.kBackgroundcolor,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              // addNewTask(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Generatetask()));
            },
            icon: Icon(Icons.add, size: 24, color: Constants.kTextcolor),
          ),
          if (task.isNotEmpty)
            IconButton(
              onPressed: () {
                setState(() {
                  mask = !mask;
                });
              },
              icon: Icon(Icons.remove, size: 24, color: Constants.kTextcolor),
            ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 12.0, 0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: new ListView.builder(
                itemCount: task.length,
                itemBuilder: (ctxt, index) =>
                    buildtask(ctxt, task[index], index + 1, mask),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
