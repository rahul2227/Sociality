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
        autofocus: true, // horizontal: 16.0, vertical: 10.0
        style: eventButtonStyleSized(
            buttonColor: Constants.kaccent1, horizontal: 16.0, verticle: 10.0),
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
