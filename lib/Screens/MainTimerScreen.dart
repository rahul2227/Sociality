import 'package:flutter/material.dart';
import 'package:sociality/HelperFunctions/Theme.dart';
import 'package:sociality/Widgets/AppBarWidget.dart';
import 'package:sociality/Widgets/QuestCard.dart';

class MainTimerScreen extends StatefulWidget {
  @override
  _MainTimerScreenState createState() => _MainTimerScreenState();
}

class _MainTimerScreenState extends State<MainTimerScreen>
    with TickerProviderStateMixin {
  AnimationController controller;

  bool show = true;

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${duration.inHours.toString().padLeft(2, '0')}:${duration.inMinutes.toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  void toggleVisibility() {
    setState(() {
      show = !show;
    });
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 240),
      // TODO - you need to provide the duration here in seconds for any
      // part like if you want counter for 4 min you will give value = 240
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Constants.kBackgroundcolor,
      appBar: appBarCustom(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.access_time_outlined,
            size: 115,
          ),
          Text(
            "Timer",
            style: theme.textTheme.headline4,
          ),
          AnimatedBuilder(
              animation: controller,
              builder: (BuildContext context, Widget child) {
                return new Text(
                  timerString, // This is the timer string which is
                  // wrapped to animation builder for coordinating the animation
                  style: theme.textTheme.headline1,
                );
              }),
          Container(
            // This will contain all the buttons there are
            //to control or add timers
            margin: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    print("Timer tapped"); // TODO - add the timer form
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      "Start Timer",
                      style: theme.textTheme.bodyText1,
                    ), // this will get a pop window asking for time
                    decoration: BoxDecoration(
                      color: Constants.kaccent1,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                if (show)
                  FloatingActionButton(
                    child: AnimatedBuilder(
                      animation: controller,
                      builder: (BuildContext context, Widget child) {
                        return new Icon(controller.isAnimating
                            ? Icons.pause
                            : Icons.play_arrow_outlined);
                      },
                    ),
                    onPressed: () {
                      if (controller.isAnimating) {
                        controller.stop();
                      } else {
                        controller.reverse(
                            from: controller.value == 0.0
                                ? 1.0
                                : controller.value);
                        toggleVisibility();
                      }
                    },
                  ),
                GestureDetector(
                  onTap: () {
                    // This will get have a
                    //popup asking for task details
                    print("Task tapped");
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      "Add Task",
                      style: theme.textTheme.bodyText1,
                    ), // this will get a pop window asking for time
                    decoration: BoxDecoration(
                      color: Constants.kaccent2,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                child: Text(
                  "Priority Quest.",
                  style: theme.textTheme.headline3,
                ),
              ),
            ),
          ),
          // new Padding(padding: EdgeInsets.all(2.0), child: new Divider()),
          QuestCard()
        ],
      ),
    );
  }
}
