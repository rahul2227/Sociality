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
  late AnimationController controller;

  bool show = true;

  String get timerString {
    Duration duration = controller.duration! * controller.value;
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
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: appBarCustom(context)),
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 12.0, 0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.schedule_outlined,
              size: 85.831,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: AnimatedBuilder(
                  animation: controller,
                  builder: (BuildContext context, Widget? child) {
                    return new Text(
                      timerString, // This is the timer string which is
                      // wrapped to animation builder for coordinating the animation
                      style: theme.textTheme.headline1,
                    );
                  }),
            ),
            Container(
              // This will contain all the buttons there are
              //to control or add timers
              margin: EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  if (show)
                    GestureDetector(
                      onTap: () {
                        print("Timer tapped");
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
                      child: AnimatedBuilder(
                        animation: controller,
                        builder: (BuildContext context, Widget? child) {
                          return new Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 8),
                            child: Text(
                              "Start Timer",
                              style: theme.textTheme.headline4!.merge(TextStyle(
                                  color: Constants.kBackgroundcolor,
                                  fontWeight: FontWeight.w600)),
                            ), // this will get a pop window asking for time
                            decoration: BoxDecoration(
                              color: Constants.kaccent1,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          );
                        },
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 20.0, 0, 10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Text(
                          "Ongoing Quest",
                          style: theme.textTheme.headline4,
                        ),
                      ),
                    ),
                  ),
                  QuestCard(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
