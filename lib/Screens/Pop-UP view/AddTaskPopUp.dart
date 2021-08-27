import 'package:flutter/material.dart';
import 'package:sociality/HelperFunctions/Theme.dart';
import 'package:sociality/Services/Database.dart';

class Generatetask extends StatefulWidget {
  @override
  _GeneratetaskState createState() => _GeneratetaskState();
}

class _GeneratetaskState extends State<Generatetask> {
  final List<String> dropitems = <String>["Quest 1", "Quest 2", "Quest 3"];

  final addTaskFormKey = GlobalKey<FormState>();

  String selected = 'Quest 1';

  TextEditingController taskNameEditingController = new TextEditingController();
  TextEditingController taskDescriptionEditingController =
      new TextEditingController();
  // Use this controller if necessary
  TextEditingController dueDateEditingController = new TextEditingController();
  addTask() {
    if (taskNameEditingController.text.isNotEmpty) {
      Map<String, dynamic> taskInfo = {
        "title": taskNameEditingController.text,
        "description": taskDescriptionEditingController.text,
        "dueDate": dueDateEditingController.text,
      };

      DatabaseMethods().addDBTask(taskInfo);

      setState(() {
        taskNameEditingController.text = "";
        taskDescriptionEditingController.text = "";
        dueDateEditingController.text = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.kBackgroundcolor,
      appBar: AppBar(
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 16.0),
          child: Form(
            key: addTaskFormKey,
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
                  child: TextFormField(
                    controller: taskNameEditingController,
                    style: Theme.of(context).textTheme.bodyText1,
                    decoration: textFieldInputDecorationCircular(),
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
                  child: TextFormField(
                    controller: taskDescriptionEditingController,
                    maxLines: 5,
                    style: Theme.of(context).textTheme.bodyText1,
                    decoration: textFieldInputDecorationCircular(),
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
                          .bodyText1!
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
                          selected = value.toString();
                        });
                      },
                    ),
                  ),
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
                  child: TextFormField(
                    controller: dueDateEditingController,
                    style: Theme.of(context).textTheme.bodyText1,
                    decoration: textFieldInputDecorationCircular(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(16.0, 0, 0.0, 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 90,
                        child: TextButton(
                            onPressed: () {
                              addTask();
                              Navigator.of(context).pop();
                            },
                            style: eventButtonStyle(Constants.kaccent1),
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
      ),
    );
  }
}
